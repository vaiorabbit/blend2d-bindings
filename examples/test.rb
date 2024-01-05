require_relative '../lib/blend2d.rb'
require_relative 'util'

include Blend2D

if __FILE__ == $PROGRAM_NAME
  load_blend2d_lib()

  img = BLImageCore.new
  r = img.initAs(480, 480, BL_FORMAT_PRGB32)
  puts "blImageInitAs failed (result = #{r})" unless r == BL_SUCCESS

  ctx = BLContextCore.new
  r = ctx.initAs(img, nil)
  puts "blContextInitAs failed (result = #{r})" unless r == BL_SUCCESS

  ctx.clearAll()

  # First shape
  radial = BLGradientCore.new
  radialValues = BLRadialGradientValues.new
  radialValues[:x0] = 180.0
  radialValues[:y0] = 180.0
  radialValues[:x1] = 180.0
  radialValues[:y1] = 180.0
  radialValues[:r0] = 180.0

  radial.initAs(BL_GRADIENT_TYPE_RADIAL, radialValues, BL_EXTEND_MODE_PAD, nil, 0, nil)
  radial.addStopRgba32(0.0, 0xFFFFFFFF)
  radial.addStopRgba32(1.0, 0xFFFF6F3F)

  circle = BLCircle.new
  circle[:cx] = 180.0
  circle[:cy] = 180.0
  circle[:r] = 160.0

  ctx.fillGeometryExt(BL_GEOMETRY_TYPE_CIRCLE, circle, radial)

  radial.destroy()
  radial = nil

  # Second shape
  linear = BLGradientCore.new
  linearValues = BLLinearGradientValues.new
  linearValues[:x0] = 195.0
  linearValues[:y0] = 195.0
  linearValues[:x1] = 470.0
  linearValues[:y1] = 470.0

  linear.initAs(BL_GRADIENT_TYPE_LINEAR, linearValues, BL_EXTEND_MODE_PAD, nil, 0, nil)
  linear.addStopRgba32(0.0, 0xFFFFFFFF)
  linear.addStopRgba32(1.0, 0xFF3F9FFF)

  # blContextSetCompOp(ctx, BL_COMP_OP_DIFFERENCE) # BL_COMP_OP_DIFFERENCE causes error on calling blContextFillGeometryExt ('65543 NOT_IMPLEMENTED')
  # Ref.:
  # - https://github.com/blend2d/blend2d/issues/182
  # - https://github.com/blend2d/blend2d/issues/181
  ctx.setCompOp(BL_COMP_OP_PLUS)

  roundRect = BLRoundRect.new
  roundRect[:x] = 195.0
  roundRect[:y] = 195.0
  roundRect[:w] = 270.0
  roundRect[:h] = 270.0
  roundRect[:rx] = 25.0
  roundRect[:ry] = 25.0
  r = ctx.fillGeometryExt(BL_GEOMETRY_TYPE_ROUND_RECT, roundRect, linear)
  puts "blContextFillGeometryExt failed (result = #{r})" unless r == BL_SUCCESS

  linear.destroy()
  linear = nil

  ctx.destroy()
  ctx = nil

  codec = BLImageCodecCore.new

  codec.initByName("PNG", "PNG".chars.length, nil)
  img.writeToFile("bl_sample_capi.png", codec)
  codec.destroy()
  codec = nil

  img.destroy()
  img = nil
end
