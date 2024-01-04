import blend2d_parser, blend2d_generator

TYPEDEF_PREFIX_OBJECT = """
  class BLObjectInfo < FFI::Struct
    layout(
      :bits, :uint,
    )
  end

  class BLObjectDetail_struct < FFI::Struct
    layout(
        :u32_data_overlap, [:uint, 2],
        :impl_payload, :uint,
        :info, BLObjectInfo,
    )
  end

  class BLObjectDetail < FFI::Union
    layout(
      :impl, :pointer,
      :char_data, [:char, 16],
      :i8_data, [:char, 16],
      :u8_data, [:uchar, 16],
      :i16_data, [:short, 8],
      :u16_data, [:ushort, 8],
      :i32_data, [:int, 4],
      :u32_data, [:uint, 4],
      :i64_data, [:long_long, 2],
      :u64_data, [:ulong_long, 2],
      :f32_data, [:float, 4],
      :f64_data, [:double, 2],
      :rgba, BLRgba,
      :rgba32, BLRgba32,
      :rgba64, BLRgba64,
      :struct, BLObjectDetail_struct,
    )
  end
"""

if __name__ == "__main__":

    ctx = blend2d_parser.ParseContext('object.h')
    blend2d_parser.execute(ctx)

    ctx.decl_structs['BLObjectDetail'] = None
    ctx.decl_structs['BLObjectInfo'] = None

    blend2d_generator.sanitize(ctx)
    blend2d_generator.generate(ctx,
                               prefix = blend2d_generator.PREFIX + "require_relative 'blend2d_rgba'\n",
                               typedef_prefix = TYPEDEF_PREFIX_OBJECT,
                               setup_method_name = 'object')
