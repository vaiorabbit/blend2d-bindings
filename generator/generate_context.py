import blend2d_parser, blend2d_generator

TYPEDEF_PREFIX_CONTEXT = """
  class BLContextHints_Contents_Elements < FFI::Struct
    layout(
      :renderingQuality, :uchar,
      :gradientQuality, :uchar,
      :patternQuality, :uchar,
    )
  end

  class BLContextHints_Contents < FFI::Union
    layout(
      :elements, BLContextHints_Contents_Elements,
      :hints, [:uchar, 8],
    )
  end

  class BLContextHints < FFI::Struct
    layout(
      :contents, BLContextHints_Contents,
    )
  end
"""

if __name__ == "__main__":

    ctx = blend2d_parser.ParseContext('context.h')
    blend2d_parser.execute(ctx)

    ctx.decl_structs['BLContextHints'] = None

    blend2d_generator.sanitize(ctx)

    blend2d_generator.generate(ctx,
                               prefix = blend2d_generator.PREFIX + "require_relative 'blend2d_font'\nrequire_relative 'blend2d_geometry'\nrequire_relative 'blend2d_glyphrun'\nrequire_relative 'blend2d_gradient'\nrequire_relative 'blend2d_image'\nrequire_relative 'blend2d_matrix'\nrequire_relative 'blend2d_object'\nrequire_relative 'blend2d_pattern'\nrequire_relative 'blend2d_path'\nrequire_relative 'blend2d_rgba'\nrequire_relative 'blend2d_var'\n",
                               typedef_prefix = TYPEDEF_PREFIX_CONTEXT,
                               setup_method_name = 'context')
