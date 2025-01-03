# Ruby-Blend2D : Yet another Blend2D wrapper for Ruby
#
# * https://github.com/vaiorabbit/blend2d-bindings
#
# [NOTICE] Autogenerated. Do not edit.

require 'ffi'
require_relative 'blend2d_object'

module Blend2D
  extend FFI::Library
  # Define/Macro


  # Enum


  # Typedef


  # Struct

  class BLArrayCore < FFI::Struct
    layout(
      :_d, BLObjectDetail,
    )
    def _d = self[:_d]
    def _d=(v) self[:_d] = v end
    def init(arrayType) = blArrayInit(self, arrayType)
    def self.create()
      instance = BLArrayCore.new
      blArrayInit(instance)
      instance
    end
    def initMove(other) = blArrayInitMove(self, other)
    def initWeak(other) = blArrayInitWeak(self, other)
    def destroy() = blArrayDestroy(self)
    def reset() = blArrayReset(self)
    def getSize() = blArrayGetSize(self)
    def getCapacity() = blArrayGetCapacity(self)
    def getItemSize() = blArrayGetItemSize(self)
    def getData() = blArrayGetData(self)
    def clear() = blArrayClear(self)
    def shrink() = blArrayShrink(self)
    def reserve(n) = blArrayReserve(self, n)
    def resize(n, fill) = blArrayResize(self, n, fill)
    def makeMutable(dataOut) = blArrayMakeMutable(self, dataOut)
    def modifyOp(op, n, dataOut) = blArrayModifyOp(self, op, n, dataOut)
    def insertOp(index, n, dataOut) = blArrayInsertOp(self, index, n, dataOut)
    def assignMove(other) = blArrayAssignMove(self, other)
    def assignWeak(other) = blArrayAssignWeak(self, other)
    def assignDeep(other) = blArrayAssignDeep(self, other)
    def assignData(data, n) = blArrayAssignData(self, data, n)
    def assignExternalData(data, size, capacity, dataAccessFlags, destroyFunc, userData) = blArrayAssignExternalData(self, data, size, capacity, dataAccessFlags, destroyFunc, userData)
    def appendU8(value) = blArrayAppendU8(self, value)
    def appendU16(value) = blArrayAppendU16(self, value)
    def appendU32(value) = blArrayAppendU32(self, value)
    def appendU64(value) = blArrayAppendU64(self, value)
    def appendF32(value) = blArrayAppendF32(self, value)
    def appendF64(value) = blArrayAppendF64(self, value)
    def appendItem(item) = blArrayAppendItem(self, item)
    def appendData(data, n) = blArrayAppendData(self, data, n)
    def insertU8(index, value) = blArrayInsertU8(self, index, value)
    def insertU16(index, value) = blArrayInsertU16(self, index, value)
    def insertU32(index, value) = blArrayInsertU32(self, index, value)
    def insertU64(index, value) = blArrayInsertU64(self, index, value)
    def insertF32(index, value) = blArrayInsertF32(self, index, value)
    def insertF64(index, value) = blArrayInsertF64(self, index, value)
    def insertItem(index, item) = blArrayInsertItem(self, index, item)
    def insertData(index, data, n) = blArrayInsertData(self, index, data, n)
    def replaceU8(index, value) = blArrayReplaceU8(self, index, value)
    def replaceU16(index, value) = blArrayReplaceU16(self, index, value)
    def replaceU32(index, value) = blArrayReplaceU32(self, index, value)
    def replaceU64(index, value) = blArrayReplaceU64(self, index, value)
    def replaceF32(index, value) = blArrayReplaceF32(self, index, value)
    def replaceF64(index, value) = blArrayReplaceF64(self, index, value)
    def replaceItem(index, item) = blArrayReplaceItem(self, index, item)
    def replaceData(rStart, rEnd, data, n) = blArrayReplaceData(self, rStart, rEnd, data, n)
    def removeIndex(index) = blArrayRemoveIndex(self, index)
    def removeRange(rStart, rEnd) = blArrayRemoveRange(self, rStart, rEnd)
    def equals(b) = blArrayEquals(a, b)
  end

  class BLArrayImpl < FFI::Struct
    layout(
      :data, :pointer,
      :size, :ulong_long,
      :capacity, :ulong_long,
    )
    def data = self[:data]
    def data=(v) self[:data] = v end
    def size = self[:size]
    def size=(v) self[:size] = v end
    def capacity = self[:capacity]
    def capacity=(v) self[:capacity] = v end
    def self.create_as(_data_, _size_, _capacity_)
      instance = BLArrayImpl.new
      instance[:data] = _data_
      instance[:size] = _size_
      instance[:capacity] = _capacity_
      instance
    end
  end


  # Function

  def self.setup_array_symbols(output_error = false)
    symbols = [
      :blArrayInit,
      :blArrayInitMove,
      :blArrayInitWeak,
      :blArrayDestroy,
      :blArrayReset,
      :blArrayGetSize,
      :blArrayGetCapacity,
      :blArrayGetItemSize,
      :blArrayGetData,
      :blArrayClear,
      :blArrayShrink,
      :blArrayReserve,
      :blArrayResize,
      :blArrayMakeMutable,
      :blArrayModifyOp,
      :blArrayInsertOp,
      :blArrayAssignMove,
      :blArrayAssignWeak,
      :blArrayAssignDeep,
      :blArrayAssignData,
      :blArrayAssignExternalData,
      :blArrayAppendU8,
      :blArrayAppendU16,
      :blArrayAppendU32,
      :blArrayAppendU64,
      :blArrayAppendF32,
      :blArrayAppendF64,
      :blArrayAppendItem,
      :blArrayAppendData,
      :blArrayInsertU8,
      :blArrayInsertU16,
      :blArrayInsertU32,
      :blArrayInsertU64,
      :blArrayInsertF32,
      :blArrayInsertF64,
      :blArrayInsertItem,
      :blArrayInsertData,
      :blArrayReplaceU8,
      :blArrayReplaceU16,
      :blArrayReplaceU32,
      :blArrayReplaceU64,
      :blArrayReplaceF32,
      :blArrayReplaceF64,
      :blArrayReplaceItem,
      :blArrayReplaceData,
      :blArrayRemoveIndex,
      :blArrayRemoveRange,
      :blArrayEquals,
    ]
    apis = {
      :blArrayInit => :blArrayInit,
      :blArrayInitMove => :blArrayInitMove,
      :blArrayInitWeak => :blArrayInitWeak,
      :blArrayDestroy => :blArrayDestroy,
      :blArrayReset => :blArrayReset,
      :blArrayGetSize => :blArrayGetSize,
      :blArrayGetCapacity => :blArrayGetCapacity,
      :blArrayGetItemSize => :blArrayGetItemSize,
      :blArrayGetData => :blArrayGetData,
      :blArrayClear => :blArrayClear,
      :blArrayShrink => :blArrayShrink,
      :blArrayReserve => :blArrayReserve,
      :blArrayResize => :blArrayResize,
      :blArrayMakeMutable => :blArrayMakeMutable,
      :blArrayModifyOp => :blArrayModifyOp,
      :blArrayInsertOp => :blArrayInsertOp,
      :blArrayAssignMove => :blArrayAssignMove,
      :blArrayAssignWeak => :blArrayAssignWeak,
      :blArrayAssignDeep => :blArrayAssignDeep,
      :blArrayAssignData => :blArrayAssignData,
      :blArrayAssignExternalData => :blArrayAssignExternalData,
      :blArrayAppendU8 => :blArrayAppendU8,
      :blArrayAppendU16 => :blArrayAppendU16,
      :blArrayAppendU32 => :blArrayAppendU32,
      :blArrayAppendU64 => :blArrayAppendU64,
      :blArrayAppendF32 => :blArrayAppendF32,
      :blArrayAppendF64 => :blArrayAppendF64,
      :blArrayAppendItem => :blArrayAppendItem,
      :blArrayAppendData => :blArrayAppendData,
      :blArrayInsertU8 => :blArrayInsertU8,
      :blArrayInsertU16 => :blArrayInsertU16,
      :blArrayInsertU32 => :blArrayInsertU32,
      :blArrayInsertU64 => :blArrayInsertU64,
      :blArrayInsertF32 => :blArrayInsertF32,
      :blArrayInsertF64 => :blArrayInsertF64,
      :blArrayInsertItem => :blArrayInsertItem,
      :blArrayInsertData => :blArrayInsertData,
      :blArrayReplaceU8 => :blArrayReplaceU8,
      :blArrayReplaceU16 => :blArrayReplaceU16,
      :blArrayReplaceU32 => :blArrayReplaceU32,
      :blArrayReplaceU64 => :blArrayReplaceU64,
      :blArrayReplaceF32 => :blArrayReplaceF32,
      :blArrayReplaceF64 => :blArrayReplaceF64,
      :blArrayReplaceItem => :blArrayReplaceItem,
      :blArrayReplaceData => :blArrayReplaceData,
      :blArrayRemoveIndex => :blArrayRemoveIndex,
      :blArrayRemoveRange => :blArrayRemoveRange,
      :blArrayEquals => :blArrayEquals,
    }
    args = {
      :blArrayInit => [:pointer, :int],
      :blArrayInitMove => [:pointer, :pointer],
      :blArrayInitWeak => [:pointer, :pointer],
      :blArrayDestroy => [:pointer],
      :blArrayReset => [:pointer],
      :blArrayGetSize => [:pointer],
      :blArrayGetCapacity => [:pointer],
      :blArrayGetItemSize => [:pointer],
      :blArrayGetData => [:pointer],
      :blArrayClear => [:pointer],
      :blArrayShrink => [:pointer],
      :blArrayReserve => [:pointer, :ulong_long],
      :blArrayResize => [:pointer, :ulong_long, :pointer],
      :blArrayMakeMutable => [:pointer, :pointer],
      :blArrayModifyOp => [:pointer, :int, :ulong_long, :pointer],
      :blArrayInsertOp => [:pointer, :ulong_long, :ulong_long, :pointer],
      :blArrayAssignMove => [:pointer, :pointer],
      :blArrayAssignWeak => [:pointer, :pointer],
      :blArrayAssignDeep => [:pointer, :pointer],
      :blArrayAssignData => [:pointer, :pointer, :ulong_long],
      :blArrayAssignExternalData => [:pointer, :pointer, :ulong_long, :ulong_long, :int, :BLDestroyExternalDataFunc, :pointer],
      :blArrayAppendU8 => [:pointer, :uchar],
      :blArrayAppendU16 => [:pointer, :ushort],
      :blArrayAppendU32 => [:pointer, :uint],
      :blArrayAppendU64 => [:pointer, :ulong_long],
      :blArrayAppendF32 => [:pointer, :float],
      :blArrayAppendF64 => [:pointer, :double],
      :blArrayAppendItem => [:pointer, :pointer],
      :blArrayAppendData => [:pointer, :pointer, :ulong_long],
      :blArrayInsertU8 => [:pointer, :ulong_long, :uchar],
      :blArrayInsertU16 => [:pointer, :ulong_long, :ushort],
      :blArrayInsertU32 => [:pointer, :ulong_long, :uint],
      :blArrayInsertU64 => [:pointer, :ulong_long, :ulong_long],
      :blArrayInsertF32 => [:pointer, :ulong_long, :float],
      :blArrayInsertF64 => [:pointer, :ulong_long, :double],
      :blArrayInsertItem => [:pointer, :ulong_long, :pointer],
      :blArrayInsertData => [:pointer, :ulong_long, :pointer, :ulong_long],
      :blArrayReplaceU8 => [:pointer, :ulong_long, :uchar],
      :blArrayReplaceU16 => [:pointer, :ulong_long, :ushort],
      :blArrayReplaceU32 => [:pointer, :ulong_long, :uint],
      :blArrayReplaceU64 => [:pointer, :ulong_long, :ulong_long],
      :blArrayReplaceF32 => [:pointer, :ulong_long, :float],
      :blArrayReplaceF64 => [:pointer, :ulong_long, :double],
      :blArrayReplaceItem => [:pointer, :ulong_long, :pointer],
      :blArrayReplaceData => [:pointer, :ulong_long, :ulong_long, :pointer, :ulong_long],
      :blArrayRemoveIndex => [:pointer, :ulong_long],
      :blArrayRemoveRange => [:pointer, :ulong_long, :ulong_long],
      :blArrayEquals => [:pointer, :pointer],
    }
    retvals = {
      :blArrayInit => :uint,
      :blArrayInitMove => :uint,
      :blArrayInitWeak => :uint,
      :blArrayDestroy => :uint,
      :blArrayReset => :uint,
      :blArrayGetSize => :ulong_long,
      :blArrayGetCapacity => :ulong_long,
      :blArrayGetItemSize => :ulong_long,
      :blArrayGetData => :pointer,
      :blArrayClear => :uint,
      :blArrayShrink => :uint,
      :blArrayReserve => :uint,
      :blArrayResize => :uint,
      :blArrayMakeMutable => :uint,
      :blArrayModifyOp => :uint,
      :blArrayInsertOp => :uint,
      :blArrayAssignMove => :uint,
      :blArrayAssignWeak => :uint,
      :blArrayAssignDeep => :uint,
      :blArrayAssignData => :uint,
      :blArrayAssignExternalData => :uint,
      :blArrayAppendU8 => :uint,
      :blArrayAppendU16 => :uint,
      :blArrayAppendU32 => :uint,
      :blArrayAppendU64 => :uint,
      :blArrayAppendF32 => :uint,
      :blArrayAppendF64 => :uint,
      :blArrayAppendItem => :uint,
      :blArrayAppendData => :uint,
      :blArrayInsertU8 => :uint,
      :blArrayInsertU16 => :uint,
      :blArrayInsertU32 => :uint,
      :blArrayInsertU64 => :uint,
      :blArrayInsertF32 => :uint,
      :blArrayInsertF64 => :uint,
      :blArrayInsertItem => :uint,
      :blArrayInsertData => :uint,
      :blArrayReplaceU8 => :uint,
      :blArrayReplaceU16 => :uint,
      :blArrayReplaceU32 => :uint,
      :blArrayReplaceU64 => :uint,
      :blArrayReplaceF32 => :uint,
      :blArrayReplaceF64 => :uint,
      :blArrayReplaceItem => :uint,
      :blArrayReplaceData => :uint,
      :blArrayRemoveIndex => :uint,
      :blArrayRemoveRange => :uint,
      :blArrayEquals => :bool,
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

