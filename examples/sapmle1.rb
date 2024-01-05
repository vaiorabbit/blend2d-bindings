# Ref.: https://github.com/blend2d/blend2d/blob/master/test/bl_sample_1.cpp
require_relative '../lib/blend2d.rb'
require_relative 'util'

include Blend2D

if __FILE__ == $PROGRAM_NAME
  load_blend2d_lib()

  img = BLImageCore.create_as(480, 480, BL_FORMAT_PRGB32)

  ctx = BLContextCore.create_as(img, nil)
  ctx.clearAll()

  path = BLPathCore.create()
  path.moveTo(26, 31)
  path.cubicTo(642, 132, 587, -136, 25, 464)
  path.cubicTo(882, 404, 144, 267, 27, 31)

  # ctx.fillPath(path, BLRgba32.create_as(0xFFFFFFFF))
  ctx.fillGeometryRgba32(BL_GEOMETRY_TYPE_PATH, path, BLRgba32.create_as(0xFFFFFFFF).value)

  ctx.end()

  ctx.destroy()
  ctx = nil

  codec = BLImageCodecCore.new
  codec.initByName("PNG", "PNG".chars.length, nil)

  img.writeToFile("sample.png", codec)
  codec.destroy()
  codec = nil

  img.destroy()
  img = nil
end
