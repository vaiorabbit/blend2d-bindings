# Ruby-Blend2D : Yet another Blend2D wrapper for Ruby
#
# * https://github.com/vaiorabbit/blend2d-bindings
#
# [NOTICE] Autogenerated. Do not edit.

require 'ffi'
require_relative 'blend2d_imagecodec'
require_relative 'blend2d_object'
require_relative 'blend2d_string'

module Blend2D
  extend FFI::Library
  # Define/Macro


  # Enum


  # Typedef


  # Struct

  class BLImageEncoderCore < FFI::Struct
    layout(
      :_d, BLObjectDetail,
    )
    def _d = self[:_d]
    def _d=(v) self[:_d] = v end
    def init() = blImageEncoderInit(self)
    def self.create()
      instance = BLImageEncoderCore.new
      blImageEncoderInit(instance)
      instance
    end
    def initMove(other) = blImageEncoderInitMove(self, other)
    def initWeak(other) = blImageEncoderInitWeak(self, other)
    def destroy() = blImageEncoderDestroy(self)
    def reset() = blImageEncoderReset(self)
    def assignMove(other) = blImageEncoderAssignMove(self, other)
    def assignWeak(other) = blImageEncoderAssignWeak(self, other)
    def restart() = blImageEncoderRestart(self)
    def writeFrame(dst, image) = blImageEncoderWriteFrame(self, dst, image)
  end

  class BLImageEncoderVirt < FFI::Struct
    layout(
      :base, BLObjectVirtBase,
      :restart, :pointer,
      :writeFrame, :pointer,
    )
    def base = self[:base]
    def base=(v) self[:base] = v end
    def restart = self[:restart]
    def restart=(v) self[:restart] = v end
    def writeFrame = self[:writeFrame]
    def writeFrame=(v) self[:writeFrame] = v end
    def self.create_as(_base_, _restart_, _writeFrame_)
      instance = BLImageEncoderVirt.new
      instance[:base] = _base_
      instance[:restart] = _restart_
      instance[:writeFrame] = _writeFrame_
      instance
    end
  end

  class BLImageEncoderImpl < FFI::Struct
    layout(
      :virt, :pointer,
      :codec, BLImageCodecCore,
      :lastResult, :uint,
      :handle, :pointer,
      :frameIndex, :ulong_long,
      :bufferIndex, :ulong_long,
    )
    def virt = self[:virt]
    def virt=(v) self[:virt] = v end
    def codec = self[:codec]
    def codec=(v) self[:codec] = v end
    def lastResult = self[:lastResult]
    def lastResult=(v) self[:lastResult] = v end
    def handle = self[:handle]
    def handle=(v) self[:handle] = v end
    def frameIndex = self[:frameIndex]
    def frameIndex=(v) self[:frameIndex] = v end
    def bufferIndex = self[:bufferIndex]
    def bufferIndex=(v) self[:bufferIndex] = v end
    def self.create_as(_virt_, _codec_, _lastResult_, _handle_, _frameIndex_, _bufferIndex_)
      instance = BLImageEncoderImpl.new
      instance[:virt] = _virt_
      instance[:codec] = _codec_
      instance[:lastResult] = _lastResult_
      instance[:handle] = _handle_
      instance[:frameIndex] = _frameIndex_
      instance[:bufferIndex] = _bufferIndex_
      instance
    end
  end


  # Function

  def self.setup_imageencoder_symbols(output_error = false)
    symbols = [
      :blImageEncoderInit,
      :blImageEncoderInitMove,
      :blImageEncoderInitWeak,
      :blImageEncoderDestroy,
      :blImageEncoderReset,
      :blImageEncoderAssignMove,
      :blImageEncoderAssignWeak,
      :blImageEncoderRestart,
      :blImageEncoderWriteFrame,
    ]
    apis = {
      :blImageEncoderInit => :blImageEncoderInit,
      :blImageEncoderInitMove => :blImageEncoderInitMove,
      :blImageEncoderInitWeak => :blImageEncoderInitWeak,
      :blImageEncoderDestroy => :blImageEncoderDestroy,
      :blImageEncoderReset => :blImageEncoderReset,
      :blImageEncoderAssignMove => :blImageEncoderAssignMove,
      :blImageEncoderAssignWeak => :blImageEncoderAssignWeak,
      :blImageEncoderRestart => :blImageEncoderRestart,
      :blImageEncoderWriteFrame => :blImageEncoderWriteFrame,
    }
    args = {
      :blImageEncoderInit => [:pointer],
      :blImageEncoderInitMove => [:pointer, :pointer],
      :blImageEncoderInitWeak => [:pointer, :pointer],
      :blImageEncoderDestroy => [:pointer],
      :blImageEncoderReset => [:pointer],
      :blImageEncoderAssignMove => [:pointer, :pointer],
      :blImageEncoderAssignWeak => [:pointer, :pointer],
      :blImageEncoderRestart => [:pointer],
      :blImageEncoderWriteFrame => [:pointer, :pointer, :pointer],
    }
    retvals = {
      :blImageEncoderInit => :uint,
      :blImageEncoderInitMove => :uint,
      :blImageEncoderInitWeak => :uint,
      :blImageEncoderDestroy => :uint,
      :blImageEncoderReset => :uint,
      :blImageEncoderAssignMove => :uint,
      :blImageEncoderAssignWeak => :uint,
      :blImageEncoderRestart => :uint,
      :blImageEncoderWriteFrame => :uint,
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

