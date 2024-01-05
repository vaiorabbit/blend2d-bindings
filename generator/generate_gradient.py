import blend2d_parser, blend2d_generator

TYPEDEF_PREFIX_GRADIENT = """
  class BLGradientStop < FFI::Struct
    layout(
      :offset, :double,
      :rgba, BLRgba64,
    )
  end

  class BLLinearGradientValues < FFI::Struct
    layout(
      :x0, :double,
      :y0, :double,
      :x1, :double,
      :y1, :double,
    )
  end

  class BLRadialGradientValues < FFI::Struct
    layout(
      :x0, :double,
      :y0, :double,
      :x1, :double,
      :y1, :double,
      :r0, :double,
    )
  end

  class BLConicGradientValues < FFI::Struct
    layout(
      :x0, :double,
      :y0, :double,
      :angle, :double,
    )
  end

  # class BLGradientCore < FFI::Struct
  #   layout(
  #     :_d, BLObjectDetail,
  #   )
  # end

  class BLGradientImpl_Contents < FFI::Union
    layout(
      :values, [:double, 6],
      :linear, BLLinearGradientValues,
      :radial, BLRadialGradientValues,
      :conic, BLConicGradientValues,
    )
  end

  class BLGradientImpl < FFI::Struct
    layout(
      :stops, :pointer,
      :size, :ulong,
      :capacity, :ulong,
      :transform, BLMatrix2D,
      :contents, BLGradientImpl_Contents,
    )
  end
"""

if __name__ == "__main__":

    ctx = blend2d_parser.ParseContext('gradient.h')
    blend2d_parser.execute(ctx)

    ctx.decl_structs['BLGradientStop'] = None
    ctx.decl_structs['BLLinearGradientValues'] = None
    ctx.decl_structs['BLRadialGradientValues'] = None
    ctx.decl_structs['BLConicGradientValues'] = None
    # ctx.decl_structs['BLGradientCore'] = None
    ctx.decl_structs['BLGradientImpl'] = None

    blend2d_generator.sanitize(ctx)

    blend2d_generator.generate(ctx,
                               prefix = blend2d_generator.PREFIX + "require_relative 'blend2d_geometry'\nrequire_relative 'blend2d_matrix'\nrequire_relative 'blend2d_object'\nrequire_relative 'blend2d_rgba'\n",
                               typedef_prefix = TYPEDEF_PREFIX_GRADIENT,
                               setup_method_name = 'gradient')
