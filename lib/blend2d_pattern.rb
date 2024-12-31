# Ruby-Blend2D : Yet another Blend2D wrapper for Ruby
#
# * https://github.com/vaiorabbit/blend2d-bindings
#
# [NOTICE] Autogenerated. Do not edit.

require 'ffi'
require_relative 'blend2d_geometry'
require_relative 'blend2d_image'
require_relative 'blend2d_matrix'
require_relative 'blend2d_object'

module Blend2D
  extend FFI::Library
  # Define/Macro


  # Enum

  BL_PATTERN_QUALITY_NEAREST = 0
  BL_PATTERN_QUALITY_BILINEAR = 1
  BL_PATTERN_QUALITY_MAX_VALUE = 1
  BL_PATTERN_QUALITY_FORCE_UINT = -1

  # Typedef

  typedef :int, :BLPatternQuality

  # Struct

  class BLPatternCore < FFI::Struct
    layout(
      :_d, BLObjectDetail,
    )
    def _d = self[:_d]
    def _d=(v) self[:_d] = v end
    def init() = blPatternInit(self)
    def self.create()
      instance = BLPatternCore.new
      blPatternInit(instance)
      instance
    end
    def initMove(other) = blPatternInitMove(self, other)
    def initWeak(other) = blPatternInitWeak(self, other)
    def initAs(image, area, extendMode, transform) = blPatternInitAs(self, image, area, extendMode, transform)
    def self.create_as(image, area, extendMode, transform)
      instance = BLPatternCore.new
      blPatternInitAs(instance, image, area, extendMode, transform)
      instance
    end
    def destroy() = blPatternDestroy(self)
    def reset() = blPatternReset(self)
    def assignMove(other) = blPatternAssignMove(self, other)
    def assignWeak(other) = blPatternAssignWeak(self, other)
    def assignDeep(other) = blPatternAssignDeep(self, other)
    def create(image, area, extendMode, transform) = blPatternCreate(self, image, area, extendMode, transform)
    def getImage(image) = blPatternGetImage(self, image)
    def setImage(image, area) = blPatternSetImage(self, image, area)
    def resetImage() = blPatternResetImage(self)
    def getArea(areaOut) = blPatternGetArea(self, areaOut)
    def setArea(area) = blPatternSetArea(self, area)
    def resetArea() = blPatternResetArea(self)
    def getExtendMode() = blPatternGetExtendMode(self)
    def setExtendMode(extendMode) = blPatternSetExtendMode(self, extendMode)
    def getTransform(transformOut) = blPatternGetTransform(self, transformOut)
    def getTransformType() = blPatternGetTransformType(self)
    def applyTransformOp(opType, opData) = blPatternApplyTransformOp(self, opType, opData)
    def equals(b) = blPatternEquals(a, b)
  end

  class BLPatternImpl < FFI::Struct
    layout(
      :image, BLImageCore,
      :area, BLRectI,
      :transform, BLMatrix2D,
    )
    def image = self[:image]
    def image=(v) self[:image] = v end
    def area = self[:area]
    def area=(v) self[:area] = v end
    def transform = self[:transform]
    def transform=(v) self[:transform] = v end
    def self.create_as(_image_, _area_, _transform_)
      instance = BLPatternImpl.new
      instance[:image] = _image_
      instance[:area] = _area_
      instance[:transform] = _transform_
      instance
    end
  end


  # Function

  def self.setup_pattern_symbols(output_error = false)
    symbols = [
      :blPatternInit,
      :blPatternInitMove,
      :blPatternInitWeak,
      :blPatternInitAs,
      :blPatternDestroy,
      :blPatternReset,
      :blPatternAssignMove,
      :blPatternAssignWeak,
      :blPatternAssignDeep,
      :blPatternCreate,
      :blPatternGetImage,
      :blPatternSetImage,
      :blPatternResetImage,
      :blPatternGetArea,
      :blPatternSetArea,
      :blPatternResetArea,
      :blPatternGetExtendMode,
      :blPatternSetExtendMode,
      :blPatternGetTransform,
      :blPatternGetTransformType,
      :blPatternApplyTransformOp,
      :blPatternEquals,
    ]
    apis = {
      :blPatternInit => :blPatternInit,
      :blPatternInitMove => :blPatternInitMove,
      :blPatternInitWeak => :blPatternInitWeak,
      :blPatternInitAs => :blPatternInitAs,
      :blPatternDestroy => :blPatternDestroy,
      :blPatternReset => :blPatternReset,
      :blPatternAssignMove => :blPatternAssignMove,
      :blPatternAssignWeak => :blPatternAssignWeak,
      :blPatternAssignDeep => :blPatternAssignDeep,
      :blPatternCreate => :blPatternCreate,
      :blPatternGetImage => :blPatternGetImage,
      :blPatternSetImage => :blPatternSetImage,
      :blPatternResetImage => :blPatternResetImage,
      :blPatternGetArea => :blPatternGetArea,
      :blPatternSetArea => :blPatternSetArea,
      :blPatternResetArea => :blPatternResetArea,
      :blPatternGetExtendMode => :blPatternGetExtendMode,
      :blPatternSetExtendMode => :blPatternSetExtendMode,
      :blPatternGetTransform => :blPatternGetTransform,
      :blPatternGetTransformType => :blPatternGetTransformType,
      :blPatternApplyTransformOp => :blPatternApplyTransformOp,
      :blPatternEquals => :blPatternEquals,
    }
    args = {
      :blPatternInit => [:pointer],
      :blPatternInitMove => [:pointer, :pointer],
      :blPatternInitWeak => [:pointer, :pointer],
      :blPatternInitAs => [:pointer, :pointer, :pointer, :int, :pointer],
      :blPatternDestroy => [:pointer],
      :blPatternReset => [:pointer],
      :blPatternAssignMove => [:pointer, :pointer],
      :blPatternAssignWeak => [:pointer, :pointer],
      :blPatternAssignDeep => [:pointer, :pointer],
      :blPatternCreate => [:pointer, :pointer, :pointer, :int, :pointer],
      :blPatternGetImage => [:pointer, :pointer],
      :blPatternSetImage => [:pointer, :pointer, :pointer],
      :blPatternResetImage => [:pointer],
      :blPatternGetArea => [:pointer, :pointer],
      :blPatternSetArea => [:pointer, :pointer],
      :blPatternResetArea => [:pointer],
      :blPatternGetExtendMode => [:pointer],
      :blPatternSetExtendMode => [:pointer, :int],
      :blPatternGetTransform => [:pointer, :pointer],
      :blPatternGetTransformType => [:pointer],
      :blPatternApplyTransformOp => [:pointer, :int, :pointer],
      :blPatternEquals => [:pointer, :pointer],
    }
    retvals = {
      :blPatternInit => :uint,
      :blPatternInitMove => :uint,
      :blPatternInitWeak => :uint,
      :blPatternInitAs => :uint,
      :blPatternDestroy => :uint,
      :blPatternReset => :uint,
      :blPatternAssignMove => :uint,
      :blPatternAssignWeak => :uint,
      :blPatternAssignDeep => :uint,
      :blPatternCreate => :uint,
      :blPatternGetImage => :uint,
      :blPatternSetImage => :uint,
      :blPatternResetImage => :uint,
      :blPatternGetArea => :uint,
      :blPatternSetArea => :uint,
      :blPatternResetArea => :uint,
      :blPatternGetExtendMode => :int,
      :blPatternSetExtendMode => :uint,
      :blPatternGetTransform => :uint,
      :blPatternGetTransformType => :int,
      :blPatternApplyTransformOp => :uint,
      :blPatternEquals => :bool,
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

