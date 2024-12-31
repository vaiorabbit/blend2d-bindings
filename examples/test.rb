require_relative '../lib/blend2d.rb'
require_relative 'util'

include Blend2D

if __FILE__ == $PROGRAM_NAME
  load_blend2d_lib()

  img = BLImageCore.create_as(480, 480, BL_FORMAT_PRGB32)

  ctx = BLContextCore.create_as(img, nil)
  ctx.clearAll()

  # First shape
  radialValues = BLRadialGradientValues.create_as(180, 180, 180, 180, 180, 0.0)
  radial = BLGradientCore.create_as(BL_GRADIENT_TYPE_RADIAL, radialValues, BL_EXTEND_MODE_PAD, nil, 0, nil)
  radial.addStopRgba32(0.0, 0xFFFFFFFF)
  radial.addStopRgba32(1.0, 0xFFFF6F3F)

  circle = BLCircle.create_as(180, 180, 160)

  ctx.fillGeometryExt(BL_GEOMETRY_TYPE_CIRCLE, circle, radial)
  radial.destroy()
  radial = nil

  # Second shape
  linearValues = BLLinearGradientValues.create_as(195, 195, 470, 470)
  linear = BLGradientCore.create_as(BL_GRADIENT_TYPE_LINEAR, linearValues, BL_EXTEND_MODE_PAD, nil, 0, nil)
  linear.addStopRgba32(0.0, 0xFFFFFFFF)
  linear.addStopRgba32(1.0, 0xFF3F9FFF)

  # blContextSetCompOp(ctx, BL_COMP_OP_DIFFERENCE) # BL_COMP_OP_DIFFERENCE causes error on calling blContextFillGeometryExt ('65543 NOT_IMPLEMENTED')
  # Ref.:
  # - https://github.com/blend2d/blend2d/issues/182
  # - https://github.com/blend2d/blend2d/issues/181
  ctx.setCompOp(BL_COMP_OP_PLUS)

  roundRect = BLRoundRect.create_as(195, 195, 270, 270, 25, 25)

  r = ctx.fillGeometryExt(BL_GEOMETRY_TYPE_ROUND_RECT, roundRect, linear)
  puts "blContextFillGeometryExt failed (result = #{r})" unless r == BL_SUCCESS

  linear.destroy()
  linear = nil

  ctx.destroy()
  ctx = nil

  codec = BLImageCodecCore.new
  codec.initByName("PNG", "PNG".chars.length, nil)
  img.writeToFile("test.png", codec)
  codec.destroy()
  codec = nil

  img.destroy()
  img = nil
end
