# Ruby-Blend2D : Yet another Blend2D wrapper for Ruby
#
# * https://github.com/vaiorabbit/blend2d-bindings
#
# [NOTICE] Autogenerated. Do not edit.

require 'ffi'
require_relative 'blend2d_fontdefs'
require_relative 'blend2d_glyphrun'

module Blend2D
  extend FFI::Library
  # Define/Macro


  # Enum


  # Typedef


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


  # Struct


  # Function

  def self.setup_glyphbuffer_symbols(output_error = false)
    symbols = [
      :blGlyphBufferInit,
      :blGlyphBufferInitMove,
      :blGlyphBufferDestroy,
      :blGlyphBufferReset,
      :blGlyphBufferClear,
      :blGlyphBufferGetSize,
      :blGlyphBufferGetFlags,
      :blGlyphBufferGetGlyphRun,
      :blGlyphBufferGetContent,
      :blGlyphBufferGetInfoData,
      :blGlyphBufferGetPlacementData,
      :blGlyphBufferSetText,
      :blGlyphBufferSetGlyphs,
      :blGlyphBufferSetGlyphsFromStruct,
      :blGlyphBufferSetDebugSink,
      :blGlyphBufferResetDebugSink,
    ]
    apis = {
      :blGlyphBufferInit => :blGlyphBufferInit,
      :blGlyphBufferInitMove => :blGlyphBufferInitMove,
      :blGlyphBufferDestroy => :blGlyphBufferDestroy,
      :blGlyphBufferReset => :blGlyphBufferReset,
      :blGlyphBufferClear => :blGlyphBufferClear,
      :blGlyphBufferGetSize => :blGlyphBufferGetSize,
      :blGlyphBufferGetFlags => :blGlyphBufferGetFlags,
      :blGlyphBufferGetGlyphRun => :blGlyphBufferGetGlyphRun,
      :blGlyphBufferGetContent => :blGlyphBufferGetContent,
      :blGlyphBufferGetInfoData => :blGlyphBufferGetInfoData,
      :blGlyphBufferGetPlacementData => :blGlyphBufferGetPlacementData,
      :blGlyphBufferSetText => :blGlyphBufferSetText,
      :blGlyphBufferSetGlyphs => :blGlyphBufferSetGlyphs,
      :blGlyphBufferSetGlyphsFromStruct => :blGlyphBufferSetGlyphsFromStruct,
      :blGlyphBufferSetDebugSink => :blGlyphBufferSetDebugSink,
      :blGlyphBufferResetDebugSink => :blGlyphBufferResetDebugSink,
    }
    args = {
      :blGlyphBufferInit => [:pointer],
      :blGlyphBufferInitMove => [:pointer, :pointer],
      :blGlyphBufferDestroy => [:pointer],
      :blGlyphBufferReset => [:pointer],
      :blGlyphBufferClear => [:pointer],
      :blGlyphBufferGetSize => [:pointer],
      :blGlyphBufferGetFlags => [:pointer],
      :blGlyphBufferGetGlyphRun => [:pointer],
      :blGlyphBufferGetContent => [:pointer],
      :blGlyphBufferGetInfoData => [:pointer],
      :blGlyphBufferGetPlacementData => [:pointer],
      :blGlyphBufferSetText => [:pointer, :pointer, :ulong_long, :int],
      :blGlyphBufferSetGlyphs => [:pointer, :pointer, :ulong_long],
      :blGlyphBufferSetGlyphsFromStruct => [:pointer, :pointer, :ulong_long, :ulong_long, :int64],
      :blGlyphBufferSetDebugSink => [:pointer, :BLDebugMessageSinkFunc, :pointer],
      :blGlyphBufferResetDebugSink => [:pointer],
    }
    retvals = {
      :blGlyphBufferInit => :uint,
      :blGlyphBufferInitMove => :uint,
      :blGlyphBufferDestroy => :uint,
      :blGlyphBufferReset => :uint,
      :blGlyphBufferClear => :uint,
      :blGlyphBufferGetSize => :ulong_long,
      :blGlyphBufferGetFlags => :uint,
      :blGlyphBufferGetGlyphRun => :pointer,
      :blGlyphBufferGetContent => :pointer,
      :blGlyphBufferGetInfoData => :pointer,
      :blGlyphBufferGetPlacementData => :pointer,
      :blGlyphBufferSetText => :uint,
      :blGlyphBufferSetGlyphs => :uint,
      :blGlyphBufferSetGlyphsFromStruct => :uint,
      :blGlyphBufferSetDebugSink => :uint,
      :blGlyphBufferResetDebugSink => :uint,
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

