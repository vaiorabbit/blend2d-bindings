import blend2d_parser, blend2d_generator

TYPEDEF_PREFIX_FORMAT = """
  class BLFormatInfo_union_sizes_shift < FFI::Struct
    layout(
      :sizes, [:uchar, 4],
      :shifts, [:uchar, 4],
    )
  end

  class BLFormatInfo_union_rgba_sizes_shift < FFI::Struct
    layout(
      :rSize, :uchar,
      :gSize, :uchar,
      :bSize, :uchar,
      :aSize, :uchar,
      :rShift, :uchar,
      :gShift, :uchar,
      :bShift, :uchar,
      :aShift, :uchar,
    )
  end

  class BLFormatInfo_union < FFI::Union
    layout(
      :sizes_shifts, BLFormatInfo_union_sizes_shift,
      :rgba_sizes_shift, BLFormatInfo_union_rgba_sizes_shift,
      :palette, :pointer,
    )
  end

  class BLFormatInfo < FFI::Struct
    layout(
      :depth, :uint,
      :flags, :int,
      :union, BLFormatInfo_union,
    )
  end
"""

if __name__ == "__main__":

    ctx = blend2d_parser.ParseContext('format.h')
    blend2d_parser.execute(ctx)

    ctx.decl_structs['BLFormatInfo'] = None

    blend2d_generator.sanitize(ctx)
    blend2d_generator.generate(ctx,
                               prefix = blend2d_generator.PREFIX + "require_relative 'blend2d_array'\n",
                               typedef_prefix = TYPEDEF_PREFIX_FORMAT,
                               setup_method_name = 'format')
