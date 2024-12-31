require_relative 'util'

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

def renderBlend2DImage(ctx, time, style, blImg, blImgData, rayImg, rayImgData)
  ctx.clearAll()

  ctx.fillAllRgba32(BLRgba32.create_as(0xFF000000).value)
  kMarginSize = 7
  kSquareSize = 45
  kFullSize = kSquareSize + kMarginSize * 2.0
  kHalfSize = kFullSize / 2.0
  w = (blImgData.size.w + kFullSize - 1) / kFullSize
  h = (blImgData.size.h + kFullSize - 1) / kFullSize
  ix = 0
  iy = 0
  count = (w.to_i * h.to_i).to_i
  start = 0.0
  now = time

  gr = BLGradientCore.create
  case style
  when "Solid"
  # do nothing
  when "Linear"
    gr.setType(BL_GRADIENT_TYPE_LINEAR)
    values = BLLinearGradientValues.create_as(0, kMarginSize, 0, kMarginSize + kSquareSize)
    gr.setValues(0, values, BLLinearGradientValues.size / FFI::TYPE_FLOAT64.size)
  when "Radial"
    gr.setType(BL_GRADIENT_TYPE_RADIAL)
    values = BLRadialGradientValues.create_as(kHalfSize, kHalfSize, kHalfSize, kHalfSize - 15, kHalfSize, 0.0)
    gr.setValues(0, values, BLRadialGradientValues.size / FFI::TYPE_FLOAT64.size)
  when "Conic"
    gr.setType(BL_GRADIENT_TYPE_CONIC)
    values = BLConicGradientValues.create_as(kHalfSize, kHalfSize, Math::PI / -2.0, 1.0)
    gr.setValues(0, values, BLConicGradientValues.size / FFI::TYPE_FLOAT64.size)
  end

  count.times do |i|
    x = ix * kFullSize;
    y = iy * kFullSize;

    dur = (now - start) + (i * 50)
    pos = dur.modulo(3000.0) / 3000.0
    bouncePos = (pos * 2 - 1).abs
    r = (bouncePos * 50 + 50) / 100
    b = ((1 - bouncePos) * 50) / 100

    rotation = pos * (Math::PI * 2)
    radius = bouncePos * 25

    ctx.applyTransformOp(BL_TRANSFORM_OP_ROTATE_PT, [rotation, x + kHalfSize, y + kHalfSize].pack("d3"))
    ctx.applyTransformOp(BL_TRANSFORM_OP_TRANSLATE, [x, y].pack("d2"))

    roundRect = BLRoundRect.create_as(kMarginSize, kMarginSize, kSquareSize, kSquareSize, radius, radius)

    case style
    when "Solid"
      rgba = BLRgba32.create_as(0xFF000000 | (r * 255).to_i << 16 | 0 << 8 | (b * 255).to_i)
      ctx.fillGeometryRgba32(BL_GEOMETRY_TYPE_ROUND_RECT, roundRect, rgba.value)
    when "Linear", "Radial"
      gr.resetStops();
      gr.addStopRgba32(0, BLRgba32.create_as(0xFFFF7F00).value)
      gr.addStopRgba32(1, BLRgba32.create_as(0xFF000000 | (r * 255).to_i << 16 | 0 << 8 | (b * 255).to_i).value)
      ctx.fillGeometryExt(BL_GEOMETRY_TYPE_ROUND_RECT, roundRect, gr)
    when "Conic"
      gr.resetStops();
      gr.addStopRgba32(0.0, BLRgba32.create_as(0xFFFF7F00).value)
      gr.addStopRgba32(0.5, BLRgba32.create_as(0xFF000000 | (r * 255).to_i << 16 | 0 << 8 | (b * 255).to_i).value)
      gr.addStopRgba32(1.0, BLRgba32.create_as(0xFFFF7F00).value)
      ctx.fillGeometryExt(BL_GEOMETRY_TYPE_ROUND_RECT, roundRect, gr)
    end

    # ctx.resetTransform()
    ctx.applyTransformOp(BL_TRANSFORM_OP_RESET, nil)

    ix += 1
    if ix >= w
      ix = 0
      iy += 1
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  load_raylib()
  load_imgui()
  load_blend2d()

  include Raylib
  include Blend2D

  sidebar_width = 200
  image_width = 480
  image_height = 480

  time = 0

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
  styles_strings = %w{Solid Linear Radial Conic}.freeze
  styles_current = styles_strings.index('Solid')

  # ImGui setup ends here

  # Prepare Raylib texture image
  style = styles_strings[styles_current]
  renderBlend2DImage(ctx, time, style, blImg, blImgData, rayImg, rayImgData)
  rayTex = raylibTextureFromBlend2DImage(blImg, blImgData, rayImg, rayImgData)

  SetTargetFPS(60)

  until quit_mainloop
    time += 2.0 if redrawEveryFrame

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
        if ImGui::BeginCombo("Style", styles_strings[styles_current], 0)
          styles_strings.each_with_index do |str, i|
            is_selected = (styles_current == i)
            if ImGui::Selectable(str, is_selected, 0, ImVec2.create(0, 0))
              styles_current = i
              exec_redraw = true
            end
            if is_selected
              ImGui::SetItemDefaultFocus()
            end
          end
          ImGui::EndCombo()
        end
        ImGui::End()
      end

      ImGui.Render()
      ImGui.ImplRaylib_RenderDrawData(ImGui.GetDrawData())
    EndDrawing()

    quit_mainloop |= WindowShouldClose()

    if exec_redraw
      style = styles_strings[styles_current]
      renderBlend2DImage(ctx, time, style, blImg, blImgData, rayImg, rayImgData)
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

