# Visit https://github.com/vaiorabbit/blend2d-bindings/tree/main/examples for more examples.
require_relative 'util/setup_blend2d'

if __FILE__ == $PROGRAM_NAME
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

  ctx.setCompOp(BL_COMP_OP_DIFFERENCE)
  roundRect = BLRoundRect.create_as(195, 195, 270, 270, 25, 25)
  r = ctx.fillGeometryExt(BL_GEOMETRY_TYPE_ROUND_RECT, roundRect, linear)

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
