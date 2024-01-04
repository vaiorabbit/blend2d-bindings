import blend2d_parser, blend2d_generator

TYPEDEF_PREFIX_MATRIX = """
  class BLMatrix2D_Contents_Elements < FFI::Struct
    layout(
      :m00, :double,
      :m01, :double,
      :m10, :double,
      :m11, :double,
      :m20, :double,
      :m21, :double,
    )
  end

  class BLMatrix2D_Contents < FFI::Union
    layout(
      :m, [:double, 6],
      :elements, BLMatrix2D_Contents_Elements,
    )
  end

  class BLMatrix2D < FFI::Struct
    layout(
      :contents, BLMatrix2D_Contents,
    )
  end
"""

if __name__ == "__main__":

    ctx = blend2d_parser.ParseContext('matrix.h')
    blend2d_parser.execute(ctx)

    ctx.decl_structs['BLMatrix2D'] = None

    blend2d_generator.sanitize(ctx)
    blend2d_generator.generate(ctx,
                               prefix = blend2d_generator.PREFIX + "require_relative 'blend2d_geometry'\n",
                               typedef_prefix = TYPEDEF_PREFIX_MATRIX,
                               setup_method_name = 'matrix')
