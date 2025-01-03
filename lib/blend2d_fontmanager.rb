# Ruby-Blend2D : Yet another Blend2D wrapper for Ruby
#
# * https://github.com/vaiorabbit/blend2d-bindings
#
# [NOTICE] Autogenerated. Do not edit.

require 'ffi'
require_relative 'blend2d_font'
require_relative 'blend2d_object'
require_relative 'blend2d_string'

module Blend2D
  extend FFI::Library
  # Define/Macro


  # Enum


  # Typedef


  # Struct

  class BLFontManagerCore < FFI::Struct
    layout(
      :_d, BLObjectDetail,
    )
    def _d = self[:_d]
    def _d=(v) self[:_d] = v end
    def init() = blFontManagerInit(self)
    def self.create()
      instance = BLFontManagerCore.new
      blFontManagerInit(instance)
      instance
    end
    def initMove(other) = blFontManagerInitMove(self, other)
    def initWeak(other) = blFontManagerInitWeak(self, other)
    def initNew() = blFontManagerInitNew(self)
    def destroy() = blFontManagerDestroy(self)
    def reset() = blFontManagerReset(self)
    def assignMove(other) = blFontManagerAssignMove(self, other)
    def assignWeak(other) = blFontManagerAssignWeak(self, other)
    def create() = blFontManagerCreate(self)
    def getFaceCount() = blFontManagerGetFaceCount(self)
    def getFamilyCount() = blFontManagerGetFamilyCount(self)
    def hasFace(face) = blFontManagerHasFace(self, face)
    def addFace(face) = blFontManagerAddFace(self, face)
    def queryFace(name, nameSize, properties, out) = blFontManagerQueryFace(self, name, nameSize, properties, out)
    def queryFacesByFamilyName(name, nameSize, out) = blFontManagerQueryFacesByFamilyName(self, name, nameSize, out)
    def equals(b) = blFontManagerEquals(a, b)
  end

  class BLFontManagerVirt < FFI::Struct
    layout(
      :base, BLObjectVirtBase,
    )
    def base = self[:base]
    def base=(v) self[:base] = v end
    def self.create_as(_base_)
      instance = BLFontManagerVirt.new
      instance[:base] = _base_
      instance
    end
  end

  class BLFontManagerImpl < FFI::Struct
    layout(
      :virt, :pointer,
    )
    def virt = self[:virt]
    def virt=(v) self[:virt] = v end
    def self.create_as(_virt_)
      instance = BLFontManagerImpl.new
      instance[:virt] = _virt_
      instance
    end
  end

  class BLFontQueryProperties < FFI::Struct
    layout(
      :style, :uint,
      :weight, :uint,
      :stretch, :uint,
    )
    def style = self[:style]
    def style=(v) self[:style] = v end
    def weight = self[:weight]
    def weight=(v) self[:weight] = v end
    def stretch = self[:stretch]
    def stretch=(v) self[:stretch] = v end
    def self.create_as(_style_, _weight_, _stretch_)
      instance = BLFontQueryProperties.new
      instance[:style] = _style_
      instance[:weight] = _weight_
      instance[:stretch] = _stretch_
      instance
    end
  end


  # Function

  def self.setup_fontmanager_symbols(output_error = false)
    symbols = [
      :blFontManagerInit,
      :blFontManagerInitMove,
      :blFontManagerInitWeak,
      :blFontManagerInitNew,
      :blFontManagerDestroy,
      :blFontManagerReset,
      :blFontManagerAssignMove,
      :blFontManagerAssignWeak,
      :blFontManagerCreate,
      :blFontManagerGetFaceCount,
      :blFontManagerGetFamilyCount,
      :blFontManagerHasFace,
      :blFontManagerAddFace,
      :blFontManagerQueryFace,
      :blFontManagerQueryFacesByFamilyName,
      :blFontManagerEquals,
    ]
    apis = {
      :blFontManagerInit => :blFontManagerInit,
      :blFontManagerInitMove => :blFontManagerInitMove,
      :blFontManagerInitWeak => :blFontManagerInitWeak,
      :blFontManagerInitNew => :blFontManagerInitNew,
      :blFontManagerDestroy => :blFontManagerDestroy,
      :blFontManagerReset => :blFontManagerReset,
      :blFontManagerAssignMove => :blFontManagerAssignMove,
      :blFontManagerAssignWeak => :blFontManagerAssignWeak,
      :blFontManagerCreate => :blFontManagerCreate,
      :blFontManagerGetFaceCount => :blFontManagerGetFaceCount,
      :blFontManagerGetFamilyCount => :blFontManagerGetFamilyCount,
      :blFontManagerHasFace => :blFontManagerHasFace,
      :blFontManagerAddFace => :blFontManagerAddFace,
      :blFontManagerQueryFace => :blFontManagerQueryFace,
      :blFontManagerQueryFacesByFamilyName => :blFontManagerQueryFacesByFamilyName,
      :blFontManagerEquals => :blFontManagerEquals,
    }
    args = {
      :blFontManagerInit => [:pointer],
      :blFontManagerInitMove => [:pointer, :pointer],
      :blFontManagerInitWeak => [:pointer, :pointer],
      :blFontManagerInitNew => [:pointer],
      :blFontManagerDestroy => [:pointer],
      :blFontManagerReset => [:pointer],
      :blFontManagerAssignMove => [:pointer, :pointer],
      :blFontManagerAssignWeak => [:pointer, :pointer],
      :blFontManagerCreate => [:pointer],
      :blFontManagerGetFaceCount => [:pointer],
      :blFontManagerGetFamilyCount => [:pointer],
      :blFontManagerHasFace => [:pointer, :pointer],
      :blFontManagerAddFace => [:pointer, :pointer],
      :blFontManagerQueryFace => [:pointer, :pointer, :ulong_long, :pointer, :pointer],
      :blFontManagerQueryFacesByFamilyName => [:pointer, :pointer, :ulong_long, :pointer],
      :blFontManagerEquals => [:pointer, :pointer],
    }
    retvals = {
      :blFontManagerInit => :uint,
      :blFontManagerInitMove => :uint,
      :blFontManagerInitWeak => :uint,
      :blFontManagerInitNew => :uint,
      :blFontManagerDestroy => :uint,
      :blFontManagerReset => :uint,
      :blFontManagerAssignMove => :uint,
      :blFontManagerAssignWeak => :uint,
      :blFontManagerCreate => :uint,
      :blFontManagerGetFaceCount => :ulong_long,
      :blFontManagerGetFamilyCount => :ulong_long,
      :blFontManagerHasFace => :bool,
      :blFontManagerAddFace => :uint,
      :blFontManagerQueryFace => :uint,
      :blFontManagerQueryFacesByFamilyName => :uint,
      :blFontManagerEquals => :bool,
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

