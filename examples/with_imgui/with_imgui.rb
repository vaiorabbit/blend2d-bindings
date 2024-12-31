require_relative '../util/setup_blend2d'
require_relative '../util/setup_imgui'
require_relative '../util/setup_raylib'

if __FILE__ == $PROGRAM_NAME
  sidebar_width = 200
  blImg = BLImageCore.create_as(480, 480, BL_FORMAT_PRGB32)

  ctx = BLContextCore.create_as(blImg, nil)
  ctx.clearAll()

  # First shape
  radialValues = BLRadialGradientValues.create_as(180, 180, 180, 180, 180, 0.0)
  radial = BLGradientCore.create_as(BL_GRADIENT_TYPE_RADIAL, radialValues, BL_EXTEND_MODE_PAD, nil, 0, nil)
  radial.addStopRgba32(0.0, 0xFFFFFFFF)
  radial.addStopRgba32(1.0, 0xFFFF6F3F)
  circle = BLCircle.create_as(180, 180, 160)
  ctx.fillGeometryExt(BL_GEOMETRY_TYPE_CIRCLE, circle, radial)

  # Second shape
  linearValues = BLLinearGradientValues.create_as(195, 195, 470, 470)
  linear = BLGradientCore.create_as(BL_GRADIENT_TYPE_LINEAR, linearValues, BL_EXTEND_MODE_PAD, nil, 0, nil)
  linear.addStopRgba32(0.0, 0xFFFFFFFF)
  linear.addStopRgba32(1.0, 0xFF3F9FFF)
  roundRect = BLRoundRect.create_as(195, 195, 270, 270, 25, 25)
  ctx.setCompOp(BL_COMP_OP_DIFFERENCE)
  ctx.fillGeometryExt(BL_GEOMETRY_TYPE_ROUND_RECT, roundRect, linear)

  # Convert pixel
  blImgData = BLImageData.new
  blImg.getData(blImgData)

  rayImgData = FFI::MemoryPointer.new(:uint, blImgData.size.w * blImgData.size.h)

  pixels = blImgData.pixelData.get_array_of_uint(0, blImgData.size.w * blImgData.size.h)
  pixels.map! do |argb|
    # Blend2D ARGB -> Raylib ABGR
    abgr = (argb & 0xFF000000) | ((argb & 0x00FF0000) >> 16) | (argb & 0x0000FF00) | ((argb & 0x000000FF) << 16)
  end
  rayImgData.put_array_of_uint(0, pixels)

  #
  # Raylib starts here
  #

  redrawEveryFrame = false

  SetTraceLogLevel(LOG_ERROR)
  screen_width = blImgData.size.w + sidebar_width
  screen_height = blImgData.size.h
  InitWindow(screen_width, screen_height, "Yet Another Ruby-raylib bindings")

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

  SetTargetFPS(60)

  rayImg = Image.new
  rayImg.data = rayImgData # blImgData.pixelData
  rayImg.width = blImgData.size.w
  rayImg.height = blImgData.size.h
  rayImg.mipmaps = 1
  rayImg.format = PIXELFORMAT_UNCOMPRESSED_R8G8B8A8

  rayTex = LoadTextureFromImage(rayImg)

  show_mainmenu = true
  quit_mainloop = false
  show_fps = true
  exec_save = false
  until quit_mainloop
    BeginDrawing()
      ClearBackground(RAYWHITE)

      show_mainmenu = !show_mainmenu if IsKeyPressed(KEY_F1)

      ImGui.ImplRaylib_NewFrame()
      ImGui.NewFrame()
      mainmenu_size = ImVec2.create
      if show_mainmenu && ImGui::BeginMainMenuBar()
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

      if show_mainmenu
        ImGui::SetNextWindowSize(ImVec2.create(sidebar_width, 480 - mainmenu_size[:y]), ImGuiCond_Always)
        ImGui::SetNextWindowPos(ImVec2.create(480, 0 + mainmenu_size[:y]), ImGuiCond_Always)
        ImGui::SetNextWindowFocus()
        ImGui::Begin('Mode', nil, ImGuiCond_Once | ImGuiWindowFlags_NoCollapse | ImGuiWindowFlags_NoResize | ImGuiWindowFlags_NoMove)
        ImGui::End()
      end

      ImGui.Render()
      ImGui.ImplRaylib_RenderDrawData(ImGui.GetDrawData())
    EndDrawing()

    quit_mainloop |= WindowShouldClose()

    DrawTexture(rayTex, 0, (screen_height - rayImg.height) / 2, WHITE)
    if show_fps
      DrawFPS(screen_width - sidebar_width - 100, mainmenu_size[:y] + 10)
    end

    if redrawEveryFrame
      ctx.clearAll()
      # First shape
      ctx.applyTransformOp(BL_TRANSFORM_OP_RESET, nil)
      ctx.fillGeometryExt(BL_GEOMETRY_TYPE_CIRCLE, circle, radial)
      ctx.setCompOp(BL_COMP_OP_PLUS)
      # Second shape
      ctx.applyTransformOp(BL_TRANSFORM_OP_RESET, nil)
      ctx.applyTransformOp(BL_TRANSFORM_OP_ROTATE_PT, [20 * GetTime() * Math::PI / 180.0, 195 + 270/2, 195 +270/2].pack("d3"))
      ctx.fillGeometryExt(BL_GEOMETRY_TYPE_ROUND_RECT, roundRect, linear)
      # Blend2D ARGB -> Raylib ABGR
      blImg.getData(blImgData)
      pixels = blImgData.pixelData.get_array_of_uint(0, blImgData.size.w * blImgData.size.h)
      pixels.map! do |argb|
        abgr = (argb & 0xFF000000) | ((argb & 0x00FF0000) >> 16) | (argb & 0x0000FF00) | ((argb & 0x000000FF) << 16)
      end
      rayImgData.put_array_of_uint(0, pixels)
      rayImg.data = rayImgData
      rayTex = LoadTextureFromImage(rayImg)
    end

    if exec_save
      codec = BLImageCodecCore.new
      codec.initByName("PNG", "PNG".chars.length, nil)
      blImg.writeToFile("with_imgui.png", codec)
      codec.destroy()
      codec = nil
      exec_save = false
    end
  end

  ImGui.ImplRaylib_Shutdown()
  ImGui.DestroyContext(nil)

  CloseWindow()

  #
  # Raylib ends here
  #

  radial.destroy()
  radial = nil

  linear.destroy()
  linear = nil

  ctx.destroy()
  ctx = nil

  blImg.destroy()
  blImg = nil
end

