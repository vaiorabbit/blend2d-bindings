require_relative 'util/setup_blend2d'

# Ref.: https://web.archive.org/web/20170103014420im_/http://www.explore-hokkaido.com/assets/svg/hokkaido-map.svg
hokkaido = [
  [31.66,226.29],
  [31.56,215.25],
  [28.15,207.94],
  [23.25,206.53],
  [21.67,201.39],
  [17.76,200.06],
  [16.18,194.91],
  [20.83,187.27],
  [19.74,176.14],
  [21.98,173.32],
  [31.11,172.06],
  [37.83,163.59],
  [40.49,167.82],
  [42.57,166.99],
  [47.29,158.35],
  [53.69,153.86],
  [44.87,139.08],
  [46.44,132.19],
  [53.58,130.77],
  [65.72,141.81],
  [76.93,139.72],
  [76.68,142.71],
  [83.41,146.28],
  [88.64,143.7],
  [95.36,135.22],
  [91.43,109.81],
  [94.83,105.08],
  [102.06,102.66],
  [106.54,97.01],
  [107.43,74.01],
  [112.08,66.36],
  [113.89,56.48],
  [112.38,38.29],
  [105.97,18.7],
  [109.7,9.98],
  [109.2,3.91],
  [110.95,7.07],
  [116.01,6.48],
  [122.57,0],
  [146.26,29.05],
  [153.16,42.66],
  [167.71,60.92],
  [195.05,82.24],
  [223.54,89.61],
  [224.21,93.67],
  [228.78,99.07],
  [247.72,100.63],
  [271.86,75.53],
  [273.44,80.68],
  [261.59,102.78],
  [260.77,112.74],
  [263.26,118.97],
  [272.98,122.78],
  [270.82,124.61],
  [272.07,121.7],
  [266.09,121.21],
  [270.08,133.58],
  [275.49,141.05],
  [279.39,142.38],
  [287.03,134.98],
  [294.09,134.56],
  [283.46,141.71],
  [280.89,148.52],
  [263.7,150.11],
  [261.22,155.93],
  [256.82,160.58],
  [251.84,160.17],
  [250.01,158.01],
  [251.17,156.1],
  [248.26,154.86],
  [244.78,160.59],
  [247.6,162.83],
  [232.57,162.59],
  [224.85,158.95],
  [209.24,165.69],
  [193.97,180.48],
  [183.85,193.69],
  [180.12,202.42],
  [179.88,217.45],
  [177.23,225.26],
  [164.19,213.14],
  [142,202.28],
  [115.5,183.04],
  [102.7,179.98],
  [105.94,177.23],
  [90.33,183.97],
  [73.07,198.6],
  [70.33,195.37],
  [74.31,195.69],
  [69.41,194.29],
  [67.91,188.14],
  [60.6,179.51],
  [49.55,179.6],
  [43.99,186.17],
  [40.18,195.89],
  [40.85,199.96],
  [52.15,208.92],
  [62.12,209.74],
  [70.1,222.44],
  [78.83,226.17],
  [80.57,229.32],
  [74.18,233.81],
  [70.03,235.48],
  [61.39,230.75],
  [58.23,232.5],
  [58.56,228.51],
  [55.66,227.27],
  [53.25,232.09],
  [45.95,235.5],
  [45.21,244.47],
  [36.91,247.79],
  [33.5,252.53],
  [26.77,248.97],
  [24.28,242.74],
  [26.02,233.85],
  [31.66,226.29],
]

# Ref.: https://www.bang-guru.com/assets/img_v5/base/ico_score_on.svg
star = [
  [0,15],
  [4.1,3.5],
  [15,3.5],
  [6.1,-3.2],
  [9.3,-15],
  [0,-7.9],
  [-9.3,-15],
  [-6.1,-3.2],
  [-15,3.5],
  [-4.1,3.5],
]

scale_h = FFI::MemoryPointer.new(:double, 2)
scale_h.put_array_of_double(0, [1.5, 1.5])
translate_h = FFI::MemoryPointer.new(:double, 2)
translate_h.put_array_of_double(0, [15, 30])

scale_s = FFI::MemoryPointer.new(:double, 2)
scale_s.put_array_of_double(0, [2.0, 2.0])
rotate_s = FFI::MemoryPointer.new(:double, 1)
rotate_s.put_array_of_double(0, [Math::PI])
translate_s = FFI::MemoryPointer.new(:double, 2)
translate_s.put_array_of_double(0, [170, 260])

if __FILE__ == $PROGRAM_NAME
  img = BLImageCore.create_as(480, 480, BL_FORMAT_PRGB32)
  ctx = BLContextCore.create_as(img, nil)
  ctx.clearAll()

  # First shape
  ctx.applyTransformOp(BL_TRANSFORM_OP_SCALE, scale_h) # TODO Prepare ctx.scale(xy), etc.
  ctx.applyTransformOp(BL_TRANSFORM_OP_TRANSLATE, translate_h)

  path_hokkaido = BLPathCore.create()
  hokkaido.each_with_index do |point, i|
    if i == 0
      path_hokkaido.moveTo(point[0], point[1])
    else
      path_hokkaido.lineTo(point[0], point[1])
    end
  end
  path_hokkaido.close()

  ctx.setStrokeCaps(BL_STROKE_CAP_ROUND)
  ctx.setStrokeWidth(2)
  ctx.strokeGeometryRgba32(BL_GEOMETRY_TYPE_PATH, path_hokkaido, BLRgba32.create_as(0xFF000000).value)
  ctx.fillGeometryRgba32(BL_GEOMETRY_TYPE_PATH, path_hokkaido, BLRgba32.create_as(0xFF20F020).value) # TODO Prepare ctx.fillPath(path, BLRgba32.create_as(0xFFFFFFFF)), etc.

  # Second shape

  ctx.applyTransformOp(BL_TRANSFORM_OP_RESET, nil)
  ctx.applyTransformOp(BL_TRANSFORM_OP_TRANSLATE, translate_s)
  ctx.applyTransformOp(BL_TRANSFORM_OP_SCALE, scale_s)
  ctx.applyTransformOp(BL_TRANSFORM_OP_ROTATE, rotate_s)

  path_star = BLPathCore.create()
  star.each_with_index do |point, i|
    if i == 0
      path_star.moveTo(point[0], point[1])
    else
      path_star.lineTo(point[0], point[1])
    end
  end
  path_star.close()

  ctx.setStrokeCaps(BL_STROKE_CAP_ROUND)
  ctx.setStrokeWidth(5)
  ctx.strokeGeometryRgba32(BL_GEOMETRY_TYPE_PATH, path_star, BLRgba32.create_as(0xFF0080FF).value)
  ctx.fillGeometryRgba32(BL_GEOMETRY_TYPE_PATH, path_star, BLRgba32.create_as(0xFFF08020).value)

  ctx.end()

  ctx.destroy()
  ctx = nil

  codec = BLImageCodecCore.new
  codec.initByName("PNG", "PNG".chars.length, nil)

  img.writeToFile("stroke.png", codec)
  codec.destroy()
  codec = nil

  img.destroy()
  img = nil
end
