# Ruby-Blend2D : Yet another Blend2D wrapper for Ruby
#
# * https://github.com/vaiorabbit/blend2d-bindings
#
# [NOTICE] Autogenerated. Do not edit.

require 'ffi'
require_relative 'blend2d_array'
require_relative 'blend2d_bitset'
require_relative 'blend2d_filesystem'
require_relative 'blend2d_fontdata'
require_relative 'blend2d_fontdefs'
require_relative 'blend2d_geometry'
require_relative 'blend2d_glyphbuffer'
require_relative 'blend2d_object'
require_relative 'blend2d_path'
require_relative 'blend2d_string'

module Blend2D
  extend FFI::Library
  # Define/Macro


  # Enum

  BL_FONT_FACE_NO_FLAGS = 0
  BL_FONT_FACE_FLAG_TYPOGRAPHIC_NAMES = 1
  BL_FONT_FACE_FLAG_TYPOGRAPHIC_METRICS = 2
  BL_FONT_FACE_FLAG_CHAR_TO_GLYPH_MAPPING = 4
  BL_FONT_FACE_FLAG_HORIZONTAL_METIRCS = 16
  BL_FONT_FACE_FLAG_VERTICAL_METRICS = 32
  BL_FONT_FACE_FLAG_HORIZONTAL_KERNING = 64
  BL_FONT_FACE_FLAG_VERTICAL_KERNING = 128
  BL_FONT_FACE_FLAG_OPENTYPE_FEATURES = 256
  BL_FONT_FACE_FLAG_PANOSE_DATA = 512
  BL_FONT_FACE_FLAG_UNICODE_COVERAGE = 1024
  BL_FONT_FACE_FLAG_BASELINE_Y_EQUALS_0 = 4096
  BL_FONT_FACE_FLAG_LSB_POINT_X_EQUALS_0 = 8192
  BL_FONT_FACE_FLAG_VARIATION_SEQUENCES = 268435456
  BL_FONT_FACE_FLAG_OPENTYPE_VARIATIONS = 536870912
  BL_FONT_FACE_FLAG_SYMBOL_FONT = 1073741824
  BL_FONT_FACE_FLAG_LAST_RESORT_FONT = -2147483648
  BL_FONT_FACE_FLAG_FORCE_UINT = -1
  BL_FONT_FACE_DIAG_NO_FLAGS = 0
  BL_FONT_FACE_DIAG_WRONG_NAME_DATA = 1
  BL_FONT_FACE_DIAG_FIXED_NAME_DATA = 2
  BL_FONT_FACE_DIAG_WRONG_KERN_DATA = 4
  BL_FONT_FACE_DIAG_FIXED_KERN_DATA = 8
  BL_FONT_FACE_DIAG_WRONG_CMAP_DATA = 16
  BL_FONT_FACE_DIAG_WRONG_CMAP_FORMAT = 32
  BL_FONT_FACE_DIAG_FORCE_UINT = -1
  BL_FONT_OUTLINE_TYPE_NONE = 0
  BL_FONT_OUTLINE_TYPE_TRUETYPE = 1
  BL_FONT_OUTLINE_TYPE_CFF = 2
  BL_FONT_OUTLINE_TYPE_CFF2 = 3
  BL_FONT_OUTLINE_TYPE_MAX_VALUE = 3
  BL_FONT_OUTLINE_TYPE_FORCE_UINT = -1

  # Typedef

  typedef :int, :BLFontFaceFlags
  typedef :int, :BLFontFaceDiagFlags
  typedef :int, :BLFontOutlineType

  # Struct

  class BLFontFaceInfo < FFI::Struct
    layout(
      :faceType, :uchar,
      :outlineType, :uchar,
      :reserved8, [:uchar, 2],
      :glyphCount, :uint,
      :revision, :uint,
      :faceIndex, :uint,
      :faceFlags, :uint,
      :diagFlags, :uint,
      :reserved, [:uint, 2],
    )
    def faceType = self[:faceType]
    def faceType=(v) self[:faceType] = v end
    def outlineType = self[:outlineType]
    def outlineType=(v) self[:outlineType] = v end
    def reserved8 = self[:reserved8]
    def reserved8=(v) self[:reserved8] = v end
    def glyphCount = self[:glyphCount]
    def glyphCount=(v) self[:glyphCount] = v end
    def revision = self[:revision]
    def revision=(v) self[:revision] = v end
    def faceIndex = self[:faceIndex]
    def faceIndex=(v) self[:faceIndex] = v end
    def faceFlags = self[:faceFlags]
    def faceFlags=(v) self[:faceFlags] = v end
    def diagFlags = self[:diagFlags]
    def diagFlags=(v) self[:diagFlags] = v end
    def reserved = self[:reserved]
    def reserved=(v) self[:reserved] = v end
    def self.create_as(_faceType_, _outlineType_, _reserved8_, _glyphCount_, _revision_, _faceIndex_, _faceFlags_, _diagFlags_, _reserved_)
      instance = BLFontFaceInfo.new
      instance[:faceType] = _faceType_
      instance[:outlineType] = _outlineType_
      instance[:reserved8] = _reserved8_
      instance[:glyphCount] = _glyphCount_
      instance[:revision] = _revision_
      instance[:faceIndex] = _faceIndex_
      instance[:faceFlags] = _faceFlags_
      instance[:diagFlags] = _diagFlags_
      instance[:reserved] = _reserved_
      instance
    end
  end

  class BLFontFaceCore < FFI::Struct
    layout(
      :_d, BLObjectDetail,
    )
    def _d = self[:_d]
    def _d=(v) self[:_d] = v end
    def init() = blFontFaceInit(self)
    def self.create()
      instance = BLFontFaceCore.new
      blFontFaceInit(instance)
      instance
    end
    def initMove(other) = blFontFaceInitMove(self, other)
    def initWeak(other) = blFontFaceInitWeak(self, other)
    def destroy() = blFontFaceDestroy(self)
    def reset() = blFontFaceReset(self)
    def assignMove(other) = blFontFaceAssignMove(self, other)
    def assignWeak(other) = blFontFaceAssignWeak(self, other)
    def equals(b) = blFontFaceEquals(a, b)
    def createFromFile(fileName, readFlags) = blFontFaceCreateFromFile(self, fileName, readFlags)
    def createFromData(fontData, faceIndex) = blFontFaceCreateFromData(self, fontData, faceIndex)
    def getFullName(out) = blFontFaceGetFullName(self, out)
    def getFamilyName(out) = blFontFaceGetFamilyName(self, out)
    def getSubfamilyName(out) = blFontFaceGetSubfamilyName(self, out)
    def getPostScriptName(out) = blFontFaceGetPostScriptName(self, out)
    def getFaceInfo(out) = blFontFaceGetFaceInfo(self, out)
    def getDesignMetrics(out) = blFontFaceGetDesignMetrics(self, out)
    def getUnicodeCoverage(out) = blFontFaceGetUnicodeCoverage(self, out)
    def getCharacterCoverage(out) = blFontFaceGetCharacterCoverage(self, out)
    def hasScriptTag(scriptTag) = blFontFaceHasScriptTag(self, scriptTag)
    def hasFeatureTag(featureTag) = blFontFaceHasFeatureTag(self, featureTag)
    def hasVariationTag(variationTag) = blFontFaceHasVariationTag(self, variationTag)
    def getScriptTags(out) = blFontFaceGetScriptTags(self, out)
    def getFeatureTags(out) = blFontFaceGetFeatureTags(self, out)
    def getVariationTags(out) = blFontFaceGetVariationTags(self, out)
  end

  class BLFontFaceVirt < FFI::Struct
    layout(
      :base, BLObjectVirtBase,
    )
    def base = self[:base]
    def base=(v) self[:base] = v end
    def self.create_as(_base_)
      instance = BLFontFaceVirt.new
      instance[:base] = _base_
      instance
    end
  end

  class BLFontFaceImpl < FFI::Struct
    layout(
      :virt, :pointer,
      :weight, :ushort,
      :stretch, :uchar,
      :style, :uchar,
      :faceInfo, BLFontFaceInfo,
      :uniqueId, :ulong_long,
      :data, BLFontDataCore,
      :fullName, BLStringCore,
      :familyName, BLStringCore,
      :subfamilyName, BLStringCore,
      :postScriptName, BLStringCore,
      :designMetrics, BLFontDesignMetrics,
      :unicodeCoverage, BLFontUnicodeCoverage,
      :panose, BLFontPanose,
    )
    def virt = self[:virt]
    def virt=(v) self[:virt] = v end
    def weight = self[:weight]
    def weight=(v) self[:weight] = v end
    def stretch = self[:stretch]
    def stretch=(v) self[:stretch] = v end
    def style = self[:style]
    def style=(v) self[:style] = v end
    def faceInfo = self[:faceInfo]
    def faceInfo=(v) self[:faceInfo] = v end
    def uniqueId = self[:uniqueId]
    def uniqueId=(v) self[:uniqueId] = v end
    def data = self[:data]
    def data=(v) self[:data] = v end
    def fullName = self[:fullName]
    def fullName=(v) self[:fullName] = v end
    def familyName = self[:familyName]
    def familyName=(v) self[:familyName] = v end
    def subfamilyName = self[:subfamilyName]
    def subfamilyName=(v) self[:subfamilyName] = v end
    def postScriptName = self[:postScriptName]
    def postScriptName=(v) self[:postScriptName] = v end
    def designMetrics = self[:designMetrics]
    def designMetrics=(v) self[:designMetrics] = v end
    def unicodeCoverage = self[:unicodeCoverage]
    def unicodeCoverage=(v) self[:unicodeCoverage] = v end
    def panose = self[:panose]
    def panose=(v) self[:panose] = v end
    def self.create_as(_virt_, _weight_, _stretch_, _style_, _faceInfo_, _uniqueId_, _data_, _fullName_, _familyName_, _subfamilyName_, _postScriptName_, _designMetrics_, _unicodeCoverage_, _panose_)
      instance = BLFontFaceImpl.new
      instance[:virt] = _virt_
      instance[:weight] = _weight_
      instance[:stretch] = _stretch_
      instance[:style] = _style_
      instance[:faceInfo] = _faceInfo_
      instance[:uniqueId] = _uniqueId_
      instance[:data] = _data_
      instance[:fullName] = _fullName_
      instance[:familyName] = _familyName_
      instance[:subfamilyName] = _subfamilyName_
      instance[:postScriptName] = _postScriptName_
      instance[:designMetrics] = _designMetrics_
      instance[:unicodeCoverage] = _unicodeCoverage_
      instance[:panose] = _panose_
      instance
    end
  end


  # Function

  def self.setup_fontface_symbols(output_error = false)
    symbols = [
      :blFontFaceInit,
      :blFontFaceInitMove,
      :blFontFaceInitWeak,
      :blFontFaceDestroy,
      :blFontFaceReset,
      :blFontFaceAssignMove,
      :blFontFaceAssignWeak,
      :blFontFaceEquals,
      :blFontFaceCreateFromFile,
      :blFontFaceCreateFromData,
      :blFontFaceGetFullName,
      :blFontFaceGetFamilyName,
      :blFontFaceGetSubfamilyName,
      :blFontFaceGetPostScriptName,
      :blFontFaceGetFaceInfo,
      :blFontFaceGetDesignMetrics,
      :blFontFaceGetUnicodeCoverage,
      :blFontFaceGetCharacterCoverage,
      :blFontFaceHasScriptTag,
      :blFontFaceHasFeatureTag,
      :blFontFaceHasVariationTag,
      :blFontFaceGetScriptTags,
      :blFontFaceGetFeatureTags,
      :blFontFaceGetVariationTags,
    ]
    apis = {
      :blFontFaceInit => :blFontFaceInit,
      :blFontFaceInitMove => :blFontFaceInitMove,
      :blFontFaceInitWeak => :blFontFaceInitWeak,
      :blFontFaceDestroy => :blFontFaceDestroy,
      :blFontFaceReset => :blFontFaceReset,
      :blFontFaceAssignMove => :blFontFaceAssignMove,
      :blFontFaceAssignWeak => :blFontFaceAssignWeak,
      :blFontFaceEquals => :blFontFaceEquals,
      :blFontFaceCreateFromFile => :blFontFaceCreateFromFile,
      :blFontFaceCreateFromData => :blFontFaceCreateFromData,
      :blFontFaceGetFullName => :blFontFaceGetFullName,
      :blFontFaceGetFamilyName => :blFontFaceGetFamilyName,
      :blFontFaceGetSubfamilyName => :blFontFaceGetSubfamilyName,
      :blFontFaceGetPostScriptName => :blFontFaceGetPostScriptName,
      :blFontFaceGetFaceInfo => :blFontFaceGetFaceInfo,
      :blFontFaceGetDesignMetrics => :blFontFaceGetDesignMetrics,
      :blFontFaceGetUnicodeCoverage => :blFontFaceGetUnicodeCoverage,
      :blFontFaceGetCharacterCoverage => :blFontFaceGetCharacterCoverage,
      :blFontFaceHasScriptTag => :blFontFaceHasScriptTag,
      :blFontFaceHasFeatureTag => :blFontFaceHasFeatureTag,
      :blFontFaceHasVariationTag => :blFontFaceHasVariationTag,
      :blFontFaceGetScriptTags => :blFontFaceGetScriptTags,
      :blFontFaceGetFeatureTags => :blFontFaceGetFeatureTags,
      :blFontFaceGetVariationTags => :blFontFaceGetVariationTags,
    }
    args = {
      :blFontFaceInit => [:pointer],
      :blFontFaceInitMove => [:pointer, :pointer],
      :blFontFaceInitWeak => [:pointer, :pointer],
      :blFontFaceDestroy => [:pointer],
      :blFontFaceReset => [:pointer],
      :blFontFaceAssignMove => [:pointer, :pointer],
      :blFontFaceAssignWeak => [:pointer, :pointer],
      :blFontFaceEquals => [:pointer, :pointer],
      :blFontFaceCreateFromFile => [:pointer, :pointer, :int],
      :blFontFaceCreateFromData => [:pointer, :pointer, :uint],
      :blFontFaceGetFullName => [:pointer, :pointer],
      :blFontFaceGetFamilyName => [:pointer, :pointer],
      :blFontFaceGetSubfamilyName => [:pointer, :pointer],
      :blFontFaceGetPostScriptName => [:pointer, :pointer],
      :blFontFaceGetFaceInfo => [:pointer, :pointer],
      :blFontFaceGetDesignMetrics => [:pointer, :pointer],
      :blFontFaceGetUnicodeCoverage => [:pointer, :pointer],
      :blFontFaceGetCharacterCoverage => [:pointer, :pointer],
      :blFontFaceHasScriptTag => [:pointer, :uint],
      :blFontFaceHasFeatureTag => [:pointer, :uint],
      :blFontFaceHasVariationTag => [:pointer, :uint],
      :blFontFaceGetScriptTags => [:pointer, :pointer],
      :blFontFaceGetFeatureTags => [:pointer, :pointer],
      :blFontFaceGetVariationTags => [:pointer, :pointer],
    }
    retvals = {
      :blFontFaceInit => :uint,
      :blFontFaceInitMove => :uint,
      :blFontFaceInitWeak => :uint,
      :blFontFaceDestroy => :uint,
      :blFontFaceReset => :uint,
      :blFontFaceAssignMove => :uint,
      :blFontFaceAssignWeak => :uint,
      :blFontFaceEquals => :bool,
      :blFontFaceCreateFromFile => :uint,
      :blFontFaceCreateFromData => :uint,
      :blFontFaceGetFullName => :uint,
      :blFontFaceGetFamilyName => :uint,
      :blFontFaceGetSubfamilyName => :uint,
      :blFontFaceGetPostScriptName => :uint,
      :blFontFaceGetFaceInfo => :uint,
      :blFontFaceGetDesignMetrics => :uint,
      :blFontFaceGetUnicodeCoverage => :uint,
      :blFontFaceGetCharacterCoverage => :uint,
      :blFontFaceHasScriptTag => :bool,
      :blFontFaceHasFeatureTag => :bool,
      :blFontFaceHasVariationTag => :bool,
      :blFontFaceGetScriptTags => :uint,
      :blFontFaceGetFeatureTags => :uint,
      :blFontFaceGetVariationTags => :uint,
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

