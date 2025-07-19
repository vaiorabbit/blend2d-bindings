import blend2d_parser, blend2d_generator

TYPEDEF_PREFIX_FORMAT = """
  class BLFontPanoseInfo_text < FFI::Struct
    layout(
      :familyKind, :uchar,
      :serifStyle, :uchar,
      :weight, :uchar,
      :proportion, :uchar,
      :contrast, :uchar,
      :strokeVariation, :uchar,
      :armStyle, :uchar,
      :letterform, :uchar,
      :midline, :uchar,
      :xHeight, :uchar,
    )
  end

  class BLFontPanoseInfo_script < FFI::Struct
    layout(
      :familyKind, :uchar,
      :toolKind, :uchar,
      :weight, :uchar,
      :spacing, :uchar,
      :aspectRatio, :uchar,
      :contrast, :uchar,
      :topology, :uchar,
      :form, :uchar,
      :finials, :uchar,
      :xAscent, :uchar,
    )
  end

  class BLFontPanoseInfo_decorative < FFI::Struct
    layout(
      :familyKind, :uchar,
      :decorativeClass, :uchar,
      :weight, :uchar,
      :aspect, :uchar,
      :contrast, :uchar,
      :serifVariant, :uchar,
      :treatment, :uchar,
      :lining, :uchar,
      :topology, :uchar,
      :characterRange, :uchar,
    )
  end

  class BLFontPanoseInfo_symbol < FFI::Struct
    layout(
      :familyKind, :uchar,
      :symbolKind, :uchar,
      :weight, :uchar,
      :spacing, :uchar,
      :aspectRatioAndContrast, :uchar,
      :aspectRatio94, :uchar,
      :aspectRatio119, :uchar,
      :aspectRatio157, :uchar,
      :aspectRatio163, :uchar,
      :aspectRatio211, :uchar,
    )
  end

  class BLFontPanoseInfo_union < FFI::Union
    layout(
      :data, [:uchar, 10],
      :familyKind, :uchar,
      :text, BLFontPanoseInfo_text,
      :script, BLFontPanoseInfo_script,
      :decorative, BLFontPanoseInfo_decorative,
      :symbol, BLFontPanoseInfo_symbol,
    )
  end

  class BLFontPanoseInfo < FFI::Struct
    layout(
      :_union, BLFontPanoseInfo_union,
    )
  end

  class BLFontMatrix_matrix_elements < FFI::Struct
    layout(
      :m00, :double,
      :m01, :double,
      :m10, :double,
      :m11, :double,
    )
  end

  class BLFontMatrix_matrix < FFI::Union
    layout(
      :m, [:double, 4],
      :elements, BLFontMatrix_matrix_elements,
    )
  end

  class BLFontMatrix < FFI::Struct
    layout(
      :matrix, BLFontMatrix_matrix,
    )
  end

  class BLFontMetrics_OrientationInfo_Elements < FFI::Struct
    layout(
      :ascent, :float,
      :vAscent, :float,
      :descent, :float,
      :vDescent, :float,
    )
  end

  class BLFontMetrics_OrientationInfo_Array < FFI::Struct
    layout(
      :ascentByOrientation, [:float, 2],
      :descentByOrientation, [:float, 2],
    )
  end

  class BLFontMetrics_OrientationInfo < FFI::Union
    layout(
      :elements, BLFontMetrics_OrientationInfo_Elements,
      :array, BLFontMetrics_OrientationInfo_Array,
    )
  end

  class BLFontMetrics < FFI::Struct
    layout(
      :size, :float,
      :orientation, BLFontMetrics_OrientationInfo,
      :lineGap, :float,
      :xHeight, :float,
      :capHeight, :float,
      :xMin, :float,
      :yMin, :float,
      :xMax, :float,
      :yMax, :float,
      :underlinePosition, :float,
      :underlineThickness, :float,
      :strikethroughPosition, :float,
      :strikethroughThickness, :float,
    )
  end

  class BLFontDesignMetrics_Orientation_Elements < FFI::Struct
    layout(
      :ascent, :int,
      :vAscent, :int,
      :descent, :int,
      :vDescent, :int,
      :hMinLSB, :int,
      :vMinLSB, :int,
      :hMinTSB, :int,
      :vMinTSB, :int,
      :hMaxAdvance, :int,
      :vMaxAdvance, :int,
    )
  end

  class BLFontDesignMetrics_Orientation_Array < FFI::Struct
    layout(
      :ascentByOrientation, [:int, 2],
      :descentByOrientation, [:int, 2],
      :minLSBByOrientation, [:int, 2],
      :minTSBByOrientation, [:int, 2],
      :maxAdvanceByOrientation, [:int, 2],
    )
  end

  class BLFontDesignMetrics_Orientation < FFI::Union
    layout(
      :elements, BLFontDesignMetrics_Orientation_Elements,
      :array, BLFontDesignMetrics_Orientation_Array,
    )
  end

  class BLFontDesignMetrics < FFI::Struct
    layout(
      :unitsPerEm, :int,
      :lowestPPEM, :int,
      :lineGap, :int,
      :xHeight, :int,
      :capHeight, :int,
      :orientation, BLFontDesignMetrics_Orientation,
      :glyphBoundingBox, BLBoxI,
      :underlinePosition, :int,
      :underlineThickness, :int,
      :strikethroughPosition, :int,
      :strikethroughThickness, :int,
    )
  end
"""

if __name__ == "__main__":

    ctx = blend2d_parser.ParseContext('fontdefs.h')
    blend2d_parser.execute(ctx)

    ctx.decl_structs['BLFontPanoseInfo'] = None
    ctx.decl_structs['BLFontMatrix'] = None
    ctx.decl_structs['BLFontMetrics'] = None
    ctx.decl_structs['BLFontDesignMetrics'] = None

    blend2d_generator.sanitize(ctx)

    blend2d_generator.generate(ctx,
                               prefix = blend2d_generator.PREFIX + "require_relative 'blend2d_geometry'\n",
                               typedef_prefix = TYPEDEF_PREFIX_FORMAT,
                               setup_method_name = 'fontdefs')
