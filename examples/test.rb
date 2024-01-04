require_relative '../lib/blend2d.rb'
require_relative 'util'

include Blend2D

if __FILE__ == $PROGRAM_NAME
  load_blend2d_lib()

  img = BLImageCore.new
  r = blImageInitAs(img, 480, 480, BL_FORMAT_PRGB32)
  puts "blImageInitAs failed (result = #{r})" unless r == BL_SUCCESS

  ctx = BLContextCore.new
  r = blContextInitAs(ctx, img, nil)
  puts "blContextInitAs failed (result = #{r})" unless r == BL_SUCCESS

  blContextClearAll(ctx)

  # First shape
  radial = BLGradientCore.new
  radialValues = BLRadialGradientValues.new
  radialValues[:x0] = 180.0
  radialValues[:y0] = 180.0
  radialValues[:x1] = 180.0
  radialValues[:y1] = 180.0
  radialValues[:r0] = 180.0

  blGradientInitAs(radial, BL_GRADIENT_TYPE_RADIAL, radialValues, BL_EXTEND_MODE_PAD, nil, 0, nil)
  blGradientAddStopRgba32(radial, 0.0, 0xFFFFFFFF)
  blGradientAddStopRgba32(radial, 1.0, 0xFFFF6F3F)

  circle = BLCircle.new
  circle[:cx] = 180.0
  circle[:cy] = 180.0
  circle[:r] = 160.0

  blContextFillGeometryExt(ctx, BL_GEOMETRY_TYPE_CIRCLE, circle, radial)

  blGradientDestroy(radial)
  radial = nil

  # Second shape
  linear = BLGradientCore.new
  linearValues = BLLinearGradientValues.new
  linearValues[:x0] = 195.0
  linearValues[:y0] = 195.0
  linearValues[:x1] = 470.0
  linearValues[:y1] = 470.0

  blGradientInitAs(linear, BL_GRADIENT_TYPE_LINEAR, linearValues, BL_EXTEND_MODE_PAD, nil, 0, nil)
  blGradientAddStopRgba32(linear, 0.0, 0xFFFFFFFF)
  blGradientAddStopRgba32(linear, 1.0, 0xFF3F9FFF)

  # blContextSetCompOp(ctx, BL_COMP_OP_DIFFERENCE) # BL_COMP_OP_DIFFERENCE causes error on calling blContextFillGeometryExt ('65543 NOT_IMPLEMENTED')
  # Ref.:
  # - https://github.com/blend2d/blend2d/issues/182
  # - https://github.com/blend2d/blend2d/issues/181
  blContextSetCompOp(ctx, BL_COMP_OP_PLUS)

  roundRect = BLRoundRect.new
  roundRect[:x] = 195.0
  roundRect[:y] = 195.0
  roundRect[:w] = 270.0
  roundRect[:h] = 270.0
  roundRect[:rx] = 25.0
  roundRect[:ry] = 25.0
  r = blContextFillGeometryExt(ctx, BL_GEOMETRY_TYPE_ROUND_RECT, roundRect, linear)
  puts "blContextFillGeometryExt failed (result = #{r})" unless r == BL_SUCCESS

  blGradientDestroy(linear)
  linear = nil

  blContextDestroy(ctx)
  ctx = nil

  codec = BLImageCodecCore.new

  blImageCodecInitByName(codec, "PNG", "PNG".chars.length, nil)
  blImageWriteToFile(img, "bl_sample_capi.png", codec)
  blImageCodecDestroy(codec)
  codec = nil

  blImageDestroy(img)
  img = nil
end
