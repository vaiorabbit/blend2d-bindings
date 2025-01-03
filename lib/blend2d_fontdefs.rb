# Ruby-Blend2D : Yet another Blend2D wrapper for Ruby
#
# * https://github.com/vaiorabbit/blend2d-bindings
#
# [NOTICE] Autogenerated. Do not edit.

require 'ffi'
require_relative 'blend2d_geometry'

module Blend2D
  extend FFI::Library
  # Define/Macro


  # Enum

  BL_ORIENTATION_HORIZONTAL = 0
  BL_ORIENTATION_VERTICAL = 1
  BL_ORIENTATION_MAX_VALUE = 1
  BL_ORIENTATION_FORCE_UINT = -1
  BL_FONT_FACE_TYPE_NONE = 0
  BL_FONT_FACE_TYPE_OPENTYPE = 1
  BL_FONT_FACE_TYPE_MAX_VALUE = 1
  BL_FONT_FACE_TYPE_FORCE_UINT = -1
  BL_FONT_STRETCH_ULTRA_CONDENSED = 1
  BL_FONT_STRETCH_EXTRA_CONDENSED = 2
  BL_FONT_STRETCH_CONDENSED = 3
  BL_FONT_STRETCH_SEMI_CONDENSED = 4
  BL_FONT_STRETCH_NORMAL = 5
  BL_FONT_STRETCH_SEMI_EXPANDED = 6
  BL_FONT_STRETCH_EXPANDED = 7
  BL_FONT_STRETCH_EXTRA_EXPANDED = 8
  BL_FONT_STRETCH_ULTRA_EXPANDED = 9
  BL_FONT_STRETCH_MAX_VALUE = 9
  BL_FONT_STRETCH_FORCE_UINT = -1
  BL_FONT_STYLE_NORMAL = 0
  BL_FONT_STYLE_OBLIQUE = 1
  BL_FONT_STYLE_ITALIC = 2
  BL_FONT_STYLE_MAX_VALUE = 2
  BL_FONT_STYLE_FORCE_UINT = -1
  BL_FONT_WEIGHT_THIN = 100
  BL_FONT_WEIGHT_EXTRA_LIGHT = 200
  BL_FONT_WEIGHT_LIGHT = 300
  BL_FONT_WEIGHT_SEMI_LIGHT = 350
  BL_FONT_WEIGHT_NORMAL = 400
  BL_FONT_WEIGHT_MEDIUM = 500
  BL_FONT_WEIGHT_SEMI_BOLD = 600
  BL_FONT_WEIGHT_BOLD = 700
  BL_FONT_WEIGHT_EXTRA_BOLD = 800
  BL_FONT_WEIGHT_BLACK = 900
  BL_FONT_WEIGHT_EXTRA_BLACK = 950
  BL_FONT_WEIGHT_FORCE_UINT = -1
  BL_FONT_STRING_ID_COPYRIGHT_NOTICE = 0
  BL_FONT_STRING_ID_FAMILY_NAME = 1
  BL_FONT_STRING_ID_SUBFAMILY_NAME = 2
  BL_FONT_STRING_ID_UNIQUE_IDENTIFIER = 3
  BL_FONT_STRING_ID_FULL_NAME = 4
  BL_FONT_STRING_ID_VERSION_STRING = 5
  BL_FONT_STRING_ID_POST_SCRIPT_NAME = 6
  BL_FONT_STRING_ID_TRADEMARK = 7
  BL_FONT_STRING_ID_MANUFACTURER_NAME = 8
  BL_FONT_STRING_ID_DESIGNER_NAME = 9
  BL_FONT_STRING_ID_DESCRIPTION = 10
  BL_FONT_STRING_ID_VENDOR_URL = 11
  BL_FONT_STRING_ID_DESIGNER_URL = 12
  BL_FONT_STRING_ID_LICENSE_DESCRIPTION = 13
  BL_FONT_STRING_ID_LICENSE_INFO_URL = 14
  BL_FONT_STRING_ID_RESERVED = 15
  BL_FONT_STRING_ID_TYPOGRAPHIC_FAMILY_NAME = 16
  BL_FONT_STRING_ID_TYPOGRAPHIC_SUBFAMILY_NAME = 17
  BL_FONT_STRING_ID_COMPATIBLE_FULL_NAME = 18
  BL_FONT_STRING_ID_SAMPLE_TEXT = 19
  BL_FONT_STRING_ID_POST_SCRIPT_CID_NAME = 20
  BL_FONT_STRING_ID_WWS_FAMILY_NAME = 21
  BL_FONT_STRING_ID_WWS_SUBFAMILY_NAME = 22
  BL_FONT_STRING_ID_LIGHT_BACKGROUND_PALETTE = 23
  BL_FONT_STRING_ID_DARK_BACKGROUND_PALETTE = 24
  BL_FONT_STRING_ID_VARIATIONS_POST_SCRIPT_PREFIX = 25
  BL_FONT_STRING_ID_COMMON_MAX_VALUE = 26
  BL_FONT_STRING_ID_CUSTOM_START_INDEX = 255
  BL_FONT_STRING_ID_FORCE_UINT = -1
  BL_FONT_UC_INDEX_BASIC_LATIN = 0
  BL_FONT_UC_INDEX_LATIN1_SUPPLEMENT = 1
  BL_FONT_UC_INDEX_LATIN_EXTENDED_A = 2
  BL_FONT_UC_INDEX_LATIN_EXTENDED_B = 3
  BL_FONT_UC_INDEX_IPA_EXTENSIONS = 4
  BL_FONT_UC_INDEX_SPACING_MODIFIER_LETTERS = 5
  BL_FONT_UC_INDEX_COMBINING_DIACRITICAL_MARKS = 6
  BL_FONT_UC_INDEX_GREEK_AND_COPTIC = 7
  BL_FONT_UC_INDEX_COPTIC = 8
  BL_FONT_UC_INDEX_CYRILLIC = 9
  BL_FONT_UC_INDEX_ARMENIAN = 10
  BL_FONT_UC_INDEX_HEBREW = 11
  BL_FONT_UC_INDEX_VAI = 12
  BL_FONT_UC_INDEX_ARABIC = 13
  BL_FONT_UC_INDEX_NKO = 14
  BL_FONT_UC_INDEX_DEVANAGARI = 15
  BL_FONT_UC_INDEX_BENGALI = 16
  BL_FONT_UC_INDEX_GURMUKHI = 17
  BL_FONT_UC_INDEX_GUJARATI = 18
  BL_FONT_UC_INDEX_ORIYA = 19
  BL_FONT_UC_INDEX_TAMIL = 20
  BL_FONT_UC_INDEX_TELUGU = 21
  BL_FONT_UC_INDEX_KANNADA = 22
  BL_FONT_UC_INDEX_MALAYALAM = 23
  BL_FONT_UC_INDEX_THAI = 24
  BL_FONT_UC_INDEX_LAO = 25
  BL_FONT_UC_INDEX_GEORGIAN = 26
  BL_FONT_UC_INDEX_BALINESE = 27
  BL_FONT_UC_INDEX_HANGUL_JAMO = 28
  BL_FONT_UC_INDEX_LATIN_EXTENDED_ADDITIONAL = 29
  BL_FONT_UC_INDEX_GREEK_EXTENDED = 30
  BL_FONT_UC_INDEX_GENERAL_PUNCTUATION = 31
  BL_FONT_UC_INDEX_SUPERSCRIPTS_AND_SUBSCRIPTS = 32
  BL_FONT_UC_INDEX_CURRENCY_SYMBOLS = 33
  BL_FONT_UC_INDEX_COMBINING_DIACRITICAL_MARKS_FOR_SYMBOLS = 34
  BL_FONT_UC_INDEX_LETTERLIKE_SYMBOLS = 35
  BL_FONT_UC_INDEX_NUMBER_FORMS = 36
  BL_FONT_UC_INDEX_ARROWS = 37
  BL_FONT_UC_INDEX_MATHEMATICAL_OPERATORS = 38
  BL_FONT_UC_INDEX_MISCELLANEOUS_TECHNICAL = 39
  BL_FONT_UC_INDEX_CONTROL_PICTURES = 40
  BL_FONT_UC_INDEX_OPTICAL_CHARACTER_RECOGNITION = 41
  BL_FONT_UC_INDEX_ENCLOSED_ALPHANUMERICS = 42
  BL_FONT_UC_INDEX_BOX_DRAWING = 43
  BL_FONT_UC_INDEX_BLOCK_ELEMENTS = 44
  BL_FONT_UC_INDEX_GEOMETRIC_SHAPES = 45
  BL_FONT_UC_INDEX_MISCELLANEOUS_SYMBOLS = 46
  BL_FONT_UC_INDEX_DINGBATS = 47
  BL_FONT_UC_INDEX_CJK_SYMBOLS_AND_PUNCTUATION = 48
  BL_FONT_UC_INDEX_HIRAGANA = 49
  BL_FONT_UC_INDEX_KATAKANA = 50
  BL_FONT_UC_INDEX_BOPOMOFO = 51
  BL_FONT_UC_INDEX_HANGUL_COMPATIBILITY_JAMO = 52
  BL_FONT_UC_INDEX_PHAGS_PA = 53
  BL_FONT_UC_INDEX_ENCLOSED_CJK_LETTERS_AND_MONTHS = 54
  BL_FONT_UC_INDEX_CJK_COMPATIBILITY = 55
  BL_FONT_UC_INDEX_HANGUL_SYLLABLES = 56
  BL_FONT_UC_INDEX_NON_PLANE = 57
  BL_FONT_UC_INDEX_PHOENICIAN = 58
  BL_FONT_UC_INDEX_CJK_UNIFIED_IDEOGRAPHS = 59
  BL_FONT_UC_INDEX_PRIVATE_USE_PLANE0 = 60
  BL_FONT_UC_INDEX_CJK_STROKES = 61
  BL_FONT_UC_INDEX_ALPHABETIC_PRESENTATION_FORMS = 62
  BL_FONT_UC_INDEX_ARABIC_PRESENTATION_FORMS_A = 63
  BL_FONT_UC_INDEX_COMBINING_HALF_MARKS = 64
  BL_FONT_UC_INDEX_VERTICAL_FORMS = 65
  BL_FONT_UC_INDEX_SMALL_FORM_VARIANTS = 66
  BL_FONT_UC_INDEX_ARABIC_PRESENTATION_FORMS_B = 67
  BL_FONT_UC_INDEX_HALFWIDTH_AND_FULLWIDTH_FORMS = 68
  BL_FONT_UC_INDEX_SPECIALS = 69
  BL_FONT_UC_INDEX_TIBETAN = 70
  BL_FONT_UC_INDEX_SYRIAC = 71
  BL_FONT_UC_INDEX_THAANA = 72
  BL_FONT_UC_INDEX_SINHALA = 73
  BL_FONT_UC_INDEX_MYANMAR = 74
  BL_FONT_UC_INDEX_ETHIOPIC = 75
  BL_FONT_UC_INDEX_CHEROKEE = 76
  BL_FONT_UC_INDEX_UNIFIED_CANADIAN_ABORIGINAL_SYLLABICS = 77
  BL_FONT_UC_INDEX_OGHAM = 78
  BL_FONT_UC_INDEX_RUNIC = 79
  BL_FONT_UC_INDEX_KHMER = 80
  BL_FONT_UC_INDEX_MONGOLIAN = 81
  BL_FONT_UC_INDEX_BRAILLE_PATTERNS = 82
  BL_FONT_UC_INDEX_YI_SYLLABLES_AND_RADICALS = 83
  BL_FONT_UC_INDEX_TAGALOG_HANUNOO_BUHID_TAGBANWA = 84
  BL_FONT_UC_INDEX_OLD_ITALIC = 85
  BL_FONT_UC_INDEX_GOTHIC = 86
  BL_FONT_UC_INDEX_DESERET = 87
  BL_FONT_UC_INDEX_MUSICAL_SYMBOLS = 88
  BL_FONT_UC_INDEX_MATHEMATICAL_ALPHANUMERIC_SYMBOLS = 89
  BL_FONT_UC_INDEX_PRIVATE_USE_PLANE_15_16 = 90
  BL_FONT_UC_INDEX_VARIATION_SELECTORS = 91
  BL_FONT_UC_INDEX_TAGS = 92
  BL_FONT_UC_INDEX_LIMBU = 93
  BL_FONT_UC_INDEX_TAI_LE = 94
  BL_FONT_UC_INDEX_NEW_TAI_LUE = 95
  BL_FONT_UC_INDEX_BUGINESE = 96
  BL_FONT_UC_INDEX_GLAGOLITIC = 97
  BL_FONT_UC_INDEX_TIFINAGH = 98
  BL_FONT_UC_INDEX_YIJING_HEXAGRAM_SYMBOLS = 99
  BL_FONT_UC_INDEX_SYLOTI_NAGRI = 100
  BL_FONT_UC_INDEX_LINEAR_B_SYLLABARY_AND_IDEOGRAMS = 101
  BL_FONT_UC_INDEX_ANCIENT_GREEK_NUMBERS = 102
  BL_FONT_UC_INDEX_UGARITIC = 103
  BL_FONT_UC_INDEX_OLD_PERSIAN = 104
  BL_FONT_UC_INDEX_SHAVIAN = 105
  BL_FONT_UC_INDEX_OSMANYA = 106
  BL_FONT_UC_INDEX_CYPRIOT_SYLLABARY = 107
  BL_FONT_UC_INDEX_KHAROSHTHI = 108
  BL_FONT_UC_INDEX_TAI_XUAN_JING_SYMBOLS = 109
  BL_FONT_UC_INDEX_CUNEIFORM = 110
  BL_FONT_UC_INDEX_COUNTING_ROD_NUMERALS = 111
  BL_FONT_UC_INDEX_SUNDANESE = 112
  BL_FONT_UC_INDEX_LEPCHA = 113
  BL_FONT_UC_INDEX_OL_CHIKI = 114
  BL_FONT_UC_INDEX_SAURASHTRA = 115
  BL_FONT_UC_INDEX_KAYAH_LI = 116
  BL_FONT_UC_INDEX_REJANG = 117
  BL_FONT_UC_INDEX_CHAM = 118
  BL_FONT_UC_INDEX_ANCIENT_SYMBOLS = 119
  BL_FONT_UC_INDEX_PHAISTOS_DISC = 120
  BL_FONT_UC_INDEX_CARIAN_LYCIAN_LYDIAN = 121
  BL_FONT_UC_INDEX_DOMINO_AND_MAHJONG_TILES = 122
  BL_FONT_UC_INDEX_INTERNAL_USAGE_123 = 123
  BL_FONT_UC_INDEX_INTERNAL_USAGE_124 = 124
  BL_FONT_UC_INDEX_INTERNAL_USAGE_125 = 125
  BL_FONT_UC_INDEX_INTERNAL_USAGE_126 = 126
  BL_FONT_UC_INDEX_INTERNAL_USAGE_127 = 127
  BL_FONT_UC_INDEX_MAX_VALUE = 128
  BL_FONT_UC_INDEX_FORCE_UINT = -1
  BL_TEXT_DIRECTION_LTR = 0
  BL_TEXT_DIRECTION_RTL = 1
  BL_TEXT_DIRECTION_MAX_VALUE = 1
  BL_TEXT_DIRECTION_FORCE_UINT = -1

  # Typedef


  class BLFontPanose_text < FFI::Struct
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

  class BLFontPanose_script < FFI::Struct
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

  class BLFontPanose_decorative < FFI::Struct
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

  class BLFontPanose_symbol < FFI::Struct
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

  class BLFontPanose_union < FFI::Union
    layout(
      :data, [:uchar, 10],
      :familyKind, :uchar,
      :text, BLFontPanose_text,
      :script, BLFontPanose_script,
      :decorative, BLFontPanose_decorative,
      :symbol, BLFontPanose_symbol,
    )
  end

  class BLFontPanose < FFI::Struct
    layout(
      :_union, BLFontPanose_union,
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

  typedef :int, :BLOrientation
  typedef :int, :BLFontFaceType
  typedef :int, :BLFontStretch
  typedef :int, :BLFontStyle
  typedef :int, :BLFontWeight
  typedef :int, :BLFontStringId
  typedef :int, :BLFontUnicodeCoverageIndex
  typedef :int, :BLTextDirection
  typedef :uint, :BLGlyphId

  # Struct

  class BLGlyphInfo < FFI::Struct
    layout(
      :cluster, :uint,
      :reserved, :uint,
    )
    def cluster = self[:cluster]
    def cluster=(v) self[:cluster] = v end
    def reserved = self[:reserved]
    def reserved=(v) self[:reserved] = v end
    def self.create_as(_cluster_, _reserved_)
      instance = BLGlyphInfo.new
      instance[:cluster] = _cluster_
      instance[:reserved] = _reserved_
      instance
    end
  end

  class BLGlyphPlacement < FFI::Struct
    layout(
      :placement, BLPointI,
      :advance, BLPointI,
    )
    def placement = self[:placement]
    def placement=(v) self[:placement] = v end
    def advance = self[:advance]
    def advance=(v) self[:advance] = v end
    def self.create_as(_placement_, _advance_)
      instance = BLGlyphPlacement.new
      instance[:placement] = _placement_
      instance[:advance] = _advance_
      instance
    end
  end

  class BLGlyphMappingState < FFI::Struct
    layout(
      :glyphCount, :ulong_long,
      :undefinedFirst, :ulong_long,
      :undefinedCount, :ulong_long,
    )
    def glyphCount = self[:glyphCount]
    def glyphCount=(v) self[:glyphCount] = v end
    def undefinedFirst = self[:undefinedFirst]
    def undefinedFirst=(v) self[:undefinedFirst] = v end
    def undefinedCount = self[:undefinedCount]
    def undefinedCount=(v) self[:undefinedCount] = v end
    def self.create_as(_glyphCount_, _undefinedFirst_, _undefinedCount_)
      instance = BLGlyphMappingState.new
      instance[:glyphCount] = _glyphCount_
      instance[:undefinedFirst] = _undefinedFirst_
      instance[:undefinedCount] = _undefinedCount_
      instance
    end
  end

  class BLGlyphOutlineSinkInfo < FFI::Struct
    layout(
      :glyphIndex, :ulong_long,
      :contourCount, :ulong_long,
    )
    def glyphIndex = self[:glyphIndex]
    def glyphIndex=(v) self[:glyphIndex] = v end
    def contourCount = self[:contourCount]
    def contourCount=(v) self[:contourCount] = v end
    def self.create_as(_glyphIndex_, _contourCount_)
      instance = BLGlyphOutlineSinkInfo.new
      instance[:glyphIndex] = _glyphIndex_
      instance[:contourCount] = _contourCount_
      instance
    end
  end

  class BLFontUnicodeCoverage < FFI::Struct
    layout(
      :data, [:uint, 4],
    )
    def data = self[:data]
    def data=(v) self[:data] = v end
    def self.create_as(_data_)
      instance = BLFontUnicodeCoverage.new
      instance[:data] = _data_
      instance
    end
  end

  class BLTextMetrics < FFI::Struct
    layout(
      :advance, BLPoint,
      :leadingBearing, BLPoint,
      :trailingBearing, BLPoint,
      :boundingBox, BLBox,
    )
    def advance = self[:advance]
    def advance=(v) self[:advance] = v end
    def leadingBearing = self[:leadingBearing]
    def leadingBearing=(v) self[:leadingBearing] = v end
    def trailingBearing = self[:trailingBearing]
    def trailingBearing=(v) self[:trailingBearing] = v end
    def boundingBox = self[:boundingBox]
    def boundingBox=(v) self[:boundingBox] = v end
    def self.create_as(_advance_, _leadingBearing_, _trailingBearing_, _boundingBox_)
      instance = BLTextMetrics.new
      instance[:advance] = _advance_
      instance[:leadingBearing] = _leadingBearing_
      instance[:trailingBearing] = _trailingBearing_
      instance[:boundingBox] = _boundingBox_
      instance
    end
  end


  # Function

  def self.setup_fontdefs_symbols(output_error = false)
    symbols = [
    ]
    apis = {
    }
    args = {
    }
    retvals = {
    }
    symbols.each do |sym|
      begin
        attach_function apis[sym], sym, args[sym], retvals[sym]
      rescue FFI::NotFoundError => error
        $stderr.puts("[Warning] Failed to import #{sym} (#{error}).") if output_error
      end
    end
  end

end

