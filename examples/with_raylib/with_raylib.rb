require_relative 'util'

if __FILE__ == $PROGRAM_NAME
  load_raylib()
  load_blend2d()

  include Raylib
  include Blend2D

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
  ctx.setCompOp(BL_COMP_OP_PLUS)
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
  screen_width = blImgData.size.w
  screen_height = blImgData.size.h
  InitWindow(screen_width, screen_height, "Yet Another Ruby-raylib bindings")
  SetTargetFPS(60)

  rayImg = Image.new
  rayImg.data = rayImgData # blImgData.pixelData
  rayImg.width = blImgData.size.w
  rayImg.height = blImgData.size.h
  rayImg.mipmaps = 1
  rayImg.format = PIXELFORMAT_UNCOMPRESSED_R8G8B8A8

  rayTex = LoadTextureFromImage(rayImg)

  until WindowShouldClose()
    BeginDrawing()
      ClearBackground(RAYWHITE)
      DrawTexture(rayTex, (screen_width - rayImg.width) / 2, (screen_height - rayImg.height) / 2, WHITE)
      DrawFPS(screen_width - 100, 16)
    EndDrawing()

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
  end

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

