import blend2d_parser, blend2d_generator

TYPEDEF_PREFIX_PIXELCONVERTER = """
  class BLPixelConverterOptions < FFI::Struct
    layout(
      :origin, BLPointI,
      :gap, :ulong,
    )
  end

  class BLPixelConverterCore_Contents_Function < FFI::Struct
    layout(
      :convertFunc, :pointer,
      :internalFlags, :uchar,
    )
  end

  class BLPixelConverterCore_Contents < FFI::Union
    layout(
      :function, BLPixelConverterCore_Contents_Function,
      :data, [:uchar, 80],
    )
  end

  class BLPixelConverterCore < FFI::Struct
    layout(
      :contents, BLPixelConverterCore_Contents,
    )
  end
"""

if __name__ == "__main__":

    ctx = blend2d_parser.ParseContext('pixelconverter.h')
    blend2d_parser.execute(ctx)

    ctx.decl_structs['BLPixelConverterOptions'] = None
    ctx.decl_structs['BLPixelConverterCore'] = None

    blend2d_generator.sanitize(ctx)

    blend2d_generator.generate(ctx,
                               prefix = blend2d_generator.PREFIX + "require_relative 'blend2d_format'\nrequire_relative 'blend2d_geometry'\n",
                               typedef_prefix = TYPEDEF_PREFIX_PIXELCONVERTER,
                               setup_method_name = 'pixelconverter')
