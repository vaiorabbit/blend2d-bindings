import blend2d_parser, blend2d_generator

TYPEDEF_PREFIX_PATH = """
  class BLPathView < FFI::Struct
    layout(
      :commandData, :pointer,
      :vertexData, :pointer,
      :size, :ulong,
    )
  end

  class BLStrokeOptionsCore_Contents_Content < FFI::Struct
    layout(
      :startCap, :uchar,
      :endCap, :uchar,
      :join, :uchar,
      :transformOrder, :uchar,
      :reserved, [:uchar, 4],
    )
  end

  class BLStrokeOptionsCore_Contents < FFI::Union
    layout(
      :content, BLStrokeOptionsCore_Contents_Content,
      :caps, [:uchar, 2],
      :hints, :ulong_long,
    )
  end

  class BLStrokeOptionsCore < FFI::Struct
    layout(
      :contents, BLStrokeOptionsCore_Contents,
      :width, :double,
      :miterLimit, :double,
      :dashOffset, :double,
      :dashArray, BLArrayCore,
    )
  end

  class BLPathImpl_Contents_Content < FFI::Struct
    layout(
      :commandData, :pointer,
      :vertexData, :pointer,
      :size, :ulong,
    )
  end

  class BLPathImpl_Contents < FFI::Union
    layout(
      :content, BLPathImpl_Contents_Content,
      :view, BLPathView,
    )
  end

  class BLPathImpl < FFI::Struct
    layout(
      :contents, BLPathImpl_Contents,
      :capacity, :ulong,
      :flags, :uint,
    )
  end
"""

if __name__ == "__main__":

    ctx = blend2d_parser.ParseContext('path.h')
    blend2d_parser.execute(ctx)

    ctx.decl_structs['BLPathView'] = None
    ctx.decl_structs['BLStrokeOptionsCore'] = None
    ctx.decl_structs['BLPathImpl'] = None

    blend2d_generator.sanitize(ctx)
    blend2d_generator.generate(ctx,
                               prefix = blend2d_generator.PREFIX + "require_relative 'blend2d_array'\nrequire_relative 'blend2d_geometry'\nrequire_relative 'blend2d_object'\n",
                               typedef_prefix = TYPEDEF_PREFIX_PATH,
                               setup_method_name = 'path')
