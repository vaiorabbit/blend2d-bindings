require_relative '../util/setup_blend2d'
require_relative '../util/setup_imgui'
require_relative '../util/setup_raylib'

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

def renderBlend2DImage(ctx, angle, circle_count, blImg, blImgData, rayImg, rayImgData)
  ctx.clearAll()
  ctx.fillAllRgba32(BLRgba32.create_as(0xFF000000).value)

  p = BLPathCore.create

  cx = blImgData.size.w / 2
  cy = blImgData.size.h / 2
  maxDist = 1000.0
  baseAngle = angle / 180.0 * Math::PI

  circle_count.times do |i|
    t = i.to_f * 1.01 / 1000
    d = t * 1000.0 * 0.4 + 10
    a = baseAngle + t * Math::PI * 2 * 20
    x = cx + Math.cos(a) * d
    y = cy + Math.sin(a) * d
    r = [t * 8 + 0.5, 10.0].min
    circle = BLCircle.create_as(x, y, r)
    p.addGeometry(BL_GEOMETRY_TYPE_CIRCLE, circle, nil, BL_GEOMETRY_DIRECTION_CW) # p.addCircle(BLCircle(x, y, r))
  end

  ctx.fillGeometryRgba32(BL_GEOMETRY_TYPE_PATH, p, BLRgba32.create_as(0xFFFFFFFF).value) # ctx.fillPath(p, BLRgba32(0xFFFFFFFFu))
end

if __FILE__ == $PROGRAM_NAME
  sidebar_width = 200
  image_width = 480
  image_height = 480

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

  # ImGui setup ends here

  # Prepare Raylib texture image
  renderBlend2DImage(ctx, angle, circle_count, blImg, blImgData, rayImg, rayImgData)
  rayTex = raylibTextureFromBlend2DImage(blImg, blImgData, rayImg, rayImgData)

  SetTargetFPS(60)

  until quit_mainloop
    if redrawEveryFrame
      angle += 0.05
      angle -= 360.0 if angle >= 360.0
    end

    show_ui = !show_ui if IsKeyPressed(KEY_F1)

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
        count_buf = [circle_count].pack("L")
        if ImGui::SliderInt("Count", count_buf, 100, 2000)
          circle_count = count_buf.unpack1("L")
        end
        ImGui::End()
      end

      ImGui.Render()
      ImGui.ImplRaylib_RenderDrawData(ImGui.GetDrawData())
    EndDrawing()

    quit_mainloop |= WindowShouldClose()

    if exec_redraw
      renderBlend2DImage(ctx, angle, circle_count, blImg, blImgData, rayImg, rayImgData)
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

