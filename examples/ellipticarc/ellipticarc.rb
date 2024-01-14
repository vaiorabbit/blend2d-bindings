require_relative 'util'

SIZE_MAX = 2 ** 64 - 1

def getClosestVertex(mouse_pos, maxDistance, pts)
  closestIndex = SIZE_MAX
  closestDistance = Float::MAX
  pts.each_with_index do |pt, i|
    d = Math.hypot(pt.x - mouse_pos.x, pt.y - mouse_pos.y)
    if d < closestDistance && d < maxDistance
      closestIndex = i
      closestDistance = d
    end
  end
  return closestIndex
end

# Blend2D ARGB -> Raylib ABGR
def raylibTextureFromBlend2DImage(blImg, blImgData, rayImg, rayImgData)
  blImg.getData(blImgData)
  pixels = blImgData.pixelData.get_array_of_uint(0, blImgData.size.w * blImgData.size.h)
  pixels.map! do |argb|
    abgr = (argb & 0xFF000000) | ((argb & 0x00FF0000) >> 16) | (argb & 0x0000FF00) | ((argb & 0x000000FF) << 16)
  end
  rayImgData.put_array_of_uint(0, pixels)
  rayImg.data = rayImgData

  return LoadTextureFromImage(rayImg)
end

def renderBlend2DImage(ctx, xRadiusValue, yRadiusValue, angleValue, largeArcFlag, sweepArcFlag, closestVertex, pts, blImg, blImgData, rayImg, rayImgData)
  ctx.clearAll()
  ctx.fillAllRgba32(BLRgba32.create_as(0xFF000000).value)

  radius = BLPoint.create_as(xRadiusValue, yRadiusValue)
  angle = (angleValue / 180.0) * Math::PI

  # Render all arcs before rendering the one that is selected.
  p = BLPathCore.create

  p.moveTo(pts[0].x, pts[0].y)
  p.ellipticArcTo(radius.x, radius.y, angle, 0, 0, pts[1].x, pts[1].y)
  p.moveTo(pts[0].x, pts[0].y)
  p.ellipticArcTo(radius.x, radius.y, angle, 0, 1, pts[1].x, pts[1].y)
  p.moveTo(pts[0].x, pts[0].y)
  p.ellipticArcTo(radius.x, radius.y, angle, 1, 0, pts[1].x, pts[1].y)
  p.moveTo(pts[0].x, pts[0].y)
  p.ellipticArcTo(radius.x, radius.y, angle, 1, 1, pts[1].x, pts[1].y)

  ctx.setStrokeStyleRgba32(BLRgba32.create_as(0x40FFFFFF).value)
  ctx.strokeGeometry(BL_GEOMETRY_TYPE_PATH, p)

  # Render elliptic arc based on the given parameters.
  p.clear()
  p.moveTo(pts[0].x, pts[0].y)
  p.ellipticArcTo(radius.x, radius.y, angle, largeArcFlag ? 1 : 0, sweepArcFlag ? 1 : 0, pts[1].x, pts[1].y)

  # renderPathPoints : Render all points of the path (as the arc was split into segments).
  count = p.getSize()
  vtxs = p.getVertexData()
  ctx.setFillStyleRgba32(BLRgba32.create_as(0xFF808080).value)
  count.times do |i|
    vtx = BLPoint.new(vtxs + i * BLPoint.size)
    ctx.fillGeometry(BL_GEOMETRY_TYPE_CIRCLE, BLCircle.create_as(vtx.x, vtx.y, 2.0))
  end

  # Render the rest of the UI (draggable points).
  circle = BLCircle.create_as(pts[0].x, pts[0].y, 2.5)
  ctx.fillGeometryRgba32(BL_GEOMETRY_TYPE_CIRCLE, circle, 0 == closestVertex ? BLRgba32.create_as(0xFF00FFFF).value : BLRgba32.create_as(0xFF007FFF).value)
  circle = BLCircle.create_as(pts[1].x, pts[1].y, 2.5)
  ctx.fillGeometryRgba32(BL_GEOMETRY_TYPE_CIRCLE, circle, 0 == closestVertex ? BLRgba32.create_as(0xFF00FFFF).value : BLRgba32.create_as(0xFF007FFF).value)

  ctx.fillGeometryRgba32(BL_GEOMETRY_TYPE_PATH, p, BLRgba32.create_as(0xFFFFFFFF).value) # ctx.fillPath(p, BLRgba32(0xFFFFFFFFu))
end

if __FILE__ == $PROGRAM_NAME
  load_raylib()
  load_imgui()
  load_blend2d()

  include Raylib
  include Blend2D

  sidebar_width = 200
  image_width = 580
  image_height = 520

  angle = 0.0

  # Prepare Blend2D objects

  blImg = BLImageCore.create_as(image_width, image_height, BL_FORMAT_PRGB32)

  ctx = BLContextCore.create_as(blImg, nil)

  blImgData = BLImageData.new
  blImg.getData(blImgData)

  rayImgData = FFI::MemoryPointer.new(:uint, blImgData.size.w * blImgData.size.h)

  rayImg = Image.new
  rayImg.data = rayImgData
  rayImg.width = blImgData.size.w
  rayImg.height = blImgData.size.h
  rayImg.mipmaps = 1
  rayImg.format = PIXELFORMAT_UNCOMPRESSED_R8G8B8A8

  # Raylib starts here

  redrawEveryFrame = true

  SetTraceLogLevel(LOG_ERROR)
  screen_width = blImgData.size.w + sidebar_width
  screen_height = blImgData.size.h
  InitWindow(screen_width, screen_height, "Yet Another Ruby-raylib bindings")

  # ImGui setup starts here

  ImGui.CreateContext()
  ImGui.StyleColorsLight()
  ImGui.ImplRaylib_Init()
  io = ImGuiIO.new(ImGui.GetIO())
  io[:IniSavingRate] = 0
  io[:IniFilename] = nil
  io[:WantSaveIniSettings] = false
  io[:Fonts].AddFontDefault()

  # Build texture atlas
  font_pixels = FFI::MemoryPointer.new :pointer
  font_width = FFI::MemoryPointer.new :int
  font_height = FFI::MemoryPointer.new :int
  io[:Fonts].GetTexDataAsRGBA32(font_pixels, font_width, font_height, nil)

  # Upload texture to graphics system
  # [TODO] find standard and safe way to convert RGBA32 array into texture
  font_image = Raylib.GenImageColor(font_width.read_int, font_height.read_int, Raylib::BLUE)
  original_data = font_image[:data]
  font_image[:data] = font_pixels.read_pointer

  font_texture = Raylib.LoadTextureFromImage(font_image)
  font_image[:data] = original_data
  Raylib.UnloadImage(font_image)

  # Store our identifier
  font_texture_ptr = FFI::MemoryPointer.new(:uint32)
  font_texture_ptr.write(:uint32, font_texture[:id])
  io[:Fonts].SetTexID(font_texture_ptr)

  show_ui = true
  quit_mainloop = false
  show_fps = true
  exec_save = false

  circle_count = 500

  xRadiusSliderValue = 131.0
  yRadiusSliderValue = 143.0
  angleSliderValue = 0.0
  largeArcFlagValue = false
  sweepArcFlagValue = false

  pts = [BLPoint.create_as(124.0, 180.0), BLPoint.create_as(296.0, 284.0)]
  closestVertex = SIZE_MAX
  grabbedVertex = SIZE_MAX
  grabbedX = 0
  grabbedY = 0

  # ImGui setup ends here

  # Prepare Raylib texture image
  renderBlend2DImage(ctx, xRadiusSliderValue, yRadiusSliderValue, angleSliderValue, largeArcFlagValue, sweepArcFlagValue, closestVertex, pts, blImg, blImgData, rayImg, rayImgData)
  rayTex = raylibTextureFromBlend2DImage(blImg, blImgData, rayImg, rayImgData)

  SetTargetFPS(60)

  until quit_mainloop
    show_ui = !show_ui if IsKeyPressed(KEY_F1)

    if IsMouseButtonPressed(MOUSE_BUTTON_LEFT)
      if closestVertex != SIZE_MAX
        grabbedVertex = closestVertex
        mpos = GetMousePosition()
        grabbedX = mpos.x
        grabbedY = mpos.y
      end
    end
    if IsMouseButtonReleased(MOUSE_BUTTON_LEFT)
      grabbedVertex = SIZE_MAX
    end

    mouse_delta = GetMouseDelta()
    if mouse_delta.x != 0 || mouse_delta.y != 0
      if grabbedVertex == SIZE_MAX
        closestVertex = getClosestVertex(GetMousePosition(), 5, pts)
      else
        mouse_pos = GetMousePosition()
        pts[grabbedVertex] = BLPoint.create_as(mouse_pos.x, mouse_pos.y)
      end
    end

    BeginDrawing()
      ClearBackground(RAYWHITE)
      ImGui.ImplRaylib_NewFrame()
      ImGui.NewFrame()
      mainmenu_size = ImVec2.create
      if show_ui && ImGui::BeginMainMenuBar()
        mainmenu_size = ImGui::GetWindowSize()
        if ImGui::BeginMenu('Application')
          if ImGui::MenuItem_Bool('Redraw Every Frame', nil, redrawEveryFrame)
            redrawEveryFrame = !redrawEveryFrame
          end
          if ImGui::MenuItem_Bool('Show FPS', nil, show_fps)
            show_fps = !show_fps
          end
          if ImGui::MenuItem_Bool("Save")
            exec_save = true
          end
          if ImGui::MenuItem_Bool("Quit")
            quit_mainloop = true
          end
        end
      end

      exec_redraw = redrawEveryFrame

      if show_ui
        # Mode window
        ImGui::SetNextWindowSize(ImVec2.create(sidebar_width, screen_height - mainmenu_size[:y]), ImGuiCond_Always)
        ImGui::SetNextWindowPos(ImVec2.create(blImgData.size.w, 0 + mainmenu_size[:y]), ImGuiCond_Always)
        ImGui::Begin('Mode', nil, ImGuiCond_Once | ImGuiWindowFlags_NoCollapse | ImGuiWindowFlags_NoResize | ImGuiWindowFlags_NoMove)

        xRadiusSliderValue_buf = [xRadiusSliderValue].pack("F")
        yRadiusSliderValue_buf = [yRadiusSliderValue].pack("F")
        angleSliderValue_buf = [angleSliderValue].pack("F")

        if ImGui::SliderFloat("X Radius", xRadiusSliderValue_buf, 1.0, 500.0)
          xRadiusSliderValue = xRadiusSliderValue_buf.unpack1("F")
        end

        largeArcFlagValue_buf = [largeArcFlagValue ? 1 : 0].pack("c")
        if ImGui::Checkbox("Large Arc Flag", largeArcFlagValue_buf)
          largeArcFlagValue = largeArcFlagValue_buf.unpack1("c") != 0
        end

        if ImGui::SliderFloat("Y Radius", yRadiusSliderValue_buf, 1.0, 500.0)
          yRadiusSliderValue = yRadiusSliderValue_buf.unpack1("F")
        end
        sweepArcFlagValue_buf = [sweepArcFlagValue ? 1 : 0].pack("c")
        if ImGui::Checkbox("Sweep Arc Flag", sweepArcFlagValue_buf)
          sweepArcFlagValue = sweepArcFlagValue_buf.unpack1("c") != 0
        end

        if ImGui::SliderFloat("Angle", angleSliderValue_buf, -360.0, 360.0)
          angleSliderValue = angleSliderValue_buf.unpack1("F")
        end

        ImGui::End()
      end

      ImGui.Render()
      ImGui.ImplRaylib_RenderDrawData(ImGui.GetDrawData())
    EndDrawing()

    quit_mainloop |= WindowShouldClose()

    if exec_redraw
      renderBlend2DImage(ctx, xRadiusSliderValue, yRadiusSliderValue, angleSliderValue, largeArcFlagValue, sweepArcFlagValue, closestVertex, pts, blImg, blImgData, rayImg, rayImgData)
      rayTex = raylibTextureFromBlend2DImage(blImg, blImgData, rayImg, rayImgData)
    end

    if exec_save
      codec = BLImageCodecCore.new
      codec.initByName("PNG", "PNG".chars.length, nil)
      blImg.writeToFile("screenshot.png", codec)
      codec.destroy()
      codec = nil
      exec_save = false
    end

    DrawTexture(rayTex, 0, (screen_height - rayImg.height) / 2, WHITE)
    if show_fps
      DrawFPS(screen_width - sidebar_width - 100, mainmenu_size[:y] + 10)
    end

  end

  ImGui.ImplRaylib_Shutdown()
  ImGui.DestroyContext(nil)

  CloseWindow()

  #
  # Raylib ends here
  #

  ctx.destroy()
  ctx = nil

  blImg.destroy()
  blImg = nil
end

