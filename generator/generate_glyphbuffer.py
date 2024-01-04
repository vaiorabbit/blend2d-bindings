import blend2d_parser, blend2d_generator

TYPEDEF_PREFIX_GLYPHBUFFER = """
  class BLGlyphBufferImpl_Contents < FFI::Struct
    layout(
      :content, :pointer,
      :placementData, :pointer,
      :size, :ulong,
      :reserved, :uint,
      :flags, :uint,
    )
  end

  class BLGlyphBufferImpl_Data < FFI::Union
    layout(
      :contents, BLGlyphBufferImpl_Contents,
      :glyphRun, BLGlyphRun,
    )
  end

  class BLGlyphBufferImpl < FFI::Struct
    layout(
      :data, BLGlyphBufferImpl_Data,
      :infoData, :pointer,
    )
  end

  class BLGlyphBufferCore < FFI::Struct
    layout(
      :impl, :pointer,
    )
  end
"""

if __name__ == "__main__":

    ctx = blend2d_parser.ParseContext('glyphbuffer.h')
    blend2d_parser.execute(ctx)

    ctx.decl_structs['BLGlyphBufferImpl'] = None
    ctx.decl_structs['BLGlyphBufferCore'] = None

    blend2d_generator.sanitize(ctx)
    blend2d_generator.generate(ctx,
                               prefix = blend2d_generator.PREFIX + "require_relative 'blend2d_fontdefs'\nrequire_relative 'blend2d_glyphrun'\n",
                               typedef_prefix = TYPEDEF_PREFIX_GLYPHBUFFER,
                               setup_method_name = 'glyphbuffer')
