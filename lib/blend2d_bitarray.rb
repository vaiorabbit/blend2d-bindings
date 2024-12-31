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

  class BLBitArrayCore < FFI::Struct
    layout(
      :_d, BLObjectDetail,
    )
    def _d = self[:_d]
    def _d=(v) self[:_d] = v end
    def init() = blBitArrayInit(self)
    def self.create()
      instance = BLBitArrayCore.new
      blBitArrayInit(instance)
      instance
    end
    def initMove(other) = blBitArrayInitMove(self, other)
    def initWeak(other) = blBitArrayInitWeak(self, other)
    def destroy() = blBitArrayDestroy(self)
    def reset() = blBitArrayReset(self)
    def assignMove(other) = blBitArrayAssignMove(self, other)
    def assignWeak(other) = blBitArrayAssignWeak(self, other)
    def assignWords(wordData, wordCount) = blBitArrayAssignWords(self, wordData, wordCount)
    def isEmpty() = blBitArrayIsEmpty(self)
    def getSize() = blBitArrayGetSize(self)
    def getWordCount() = blBitArrayGetWordCount(self)
    def getCapacity() = blBitArrayGetCapacity(self)
    def getData() = blBitArrayGetData(self)
    def getCardinality() = blBitArrayGetCardinality(self)
    def getCardinalityInRange(startBit, endBit) = blBitArrayGetCardinalityInRange(self, startBit, endBit)
    def hasBit(bitIndex) = blBitArrayHasBit(self, bitIndex)
    def hasBitsInRange(startBit, endBit) = blBitArrayHasBitsInRange(self, startBit, endBit)
    def subsumes(b) = blBitArraySubsumes(a, b)
    def intersects(b) = blBitArrayIntersects(a, b)
    def getRange(startOut, endOut) = blBitArrayGetRange(self, startOut, endOut)
    def equals(b) = blBitArrayEquals(a, b)
    def compare(b) = blBitArrayCompare(a, b)
    def clear() = blBitArrayClear(self)
    def resize(nBits) = blBitArrayResize(self, nBits)
    def reserve(nBits) = blBitArrayReserve(self, nBits)
    def shrink() = blBitArrayShrink(self)
    def setBit(bitIndex) = blBitArraySetBit(self, bitIndex)
    def fillRange(startBit, endBit) = blBitArrayFillRange(self, startBit, endBit)
    def fillWords(bitIndex, wordData, wordCount) = blBitArrayFillWords(self, bitIndex, wordData, wordCount)
    def clearBit(bitIndex) = blBitArrayClearBit(self, bitIndex)
    def clearRange(startBit, endBit) = blBitArrayClearRange(self, startBit, endBit)
    def clearWord(bitIndex, wordValue) = blBitArrayClearWord(self, bitIndex, wordValue)
    def clearWords(bitIndex, wordData, wordCount) = blBitArrayClearWords(self, bitIndex, wordData, wordCount)
    def replaceOp(nBits, dataOut) = blBitArrayReplaceOp(self, nBits, dataOut)
    def replaceBit(bitIndex, bitValue) = blBitArrayReplaceBit(self, bitIndex, bitValue)
    def replaceWord(bitIndex, wordValue) = blBitArrayReplaceWord(self, bitIndex, wordValue)
    def replaceWords(bitIndex, wordData, wordCount) = blBitArrayReplaceWords(self, bitIndex, wordData, wordCount)
    def appendBit(bitValue) = blBitArrayAppendBit(self, bitValue)
    def appendWord(wordValue) = blBitArrayAppendWord(self, wordValue)
    def appendWords(wordData, wordCount) = blBitArrayAppendWords(self, wordData, wordCount)
  end

  class BLBitArrayImpl < FFI::Struct
    layout(
      :size, :uint,
      :capacity, :uint,
    )
    def size = self[:size]
    def size=(v) self[:size] = v end
    def capacity = self[:capacity]
    def capacity=(v) self[:capacity] = v end
    def self.create_as(_size_, _capacity_)
      instance = BLBitArrayImpl.new
      instance[:size] = _size_
      instance[:capacity] = _capacity_
      instance
    end
  end


  # Function

  def self.setup_bitarray_symbols(output_error = false)
    symbols = [
      :blBitArrayInit,
      :blBitArrayInitMove,
      :blBitArrayInitWeak,
      :blBitArrayDestroy,
      :blBitArrayReset,
      :blBitArrayAssignMove,
      :blBitArrayAssignWeak,
      :blBitArrayAssignWords,
      :blBitArrayIsEmpty,
      :blBitArrayGetSize,
      :blBitArrayGetWordCount,
      :blBitArrayGetCapacity,
      :blBitArrayGetData,
      :blBitArrayGetCardinality,
      :blBitArrayGetCardinalityInRange,
      :blBitArrayHasBit,
      :blBitArrayHasBitsInRange,
      :blBitArraySubsumes,
      :blBitArrayIntersects,
      :blBitArrayGetRange,
      :blBitArrayEquals,
      :blBitArrayCompare,
      :blBitArrayClear,
      :blBitArrayResize,
      :blBitArrayReserve,
      :blBitArrayShrink,
      :blBitArraySetBit,
      :blBitArrayFillRange,
      :blBitArrayFillWords,
      :blBitArrayClearBit,
      :blBitArrayClearRange,
      :blBitArrayClearWord,
      :blBitArrayClearWords,
      :blBitArrayReplaceOp,
      :blBitArrayReplaceBit,
      :blBitArrayReplaceWord,
      :blBitArrayReplaceWords,
      :blBitArrayAppendBit,
      :blBitArrayAppendWord,
      :blBitArrayAppendWords,
    ]
    apis = {
      :blBitArrayInit => :blBitArrayInit,
      :blBitArrayInitMove => :blBitArrayInitMove,
      :blBitArrayInitWeak => :blBitArrayInitWeak,
      :blBitArrayDestroy => :blBitArrayDestroy,
      :blBitArrayReset => :blBitArrayReset,
      :blBitArrayAssignMove => :blBitArrayAssignMove,
      :blBitArrayAssignWeak => :blBitArrayAssignWeak,
      :blBitArrayAssignWords => :blBitArrayAssignWords,
      :blBitArrayIsEmpty => :blBitArrayIsEmpty,
      :blBitArrayGetSize => :blBitArrayGetSize,
      :blBitArrayGetWordCount => :blBitArrayGetWordCount,
      :blBitArrayGetCapacity => :blBitArrayGetCapacity,
      :blBitArrayGetData => :blBitArrayGetData,
      :blBitArrayGetCardinality => :blBitArrayGetCardinality,
      :blBitArrayGetCardinalityInRange => :blBitArrayGetCardinalityInRange,
      :blBitArrayHasBit => :blBitArrayHasBit,
      :blBitArrayHasBitsInRange => :blBitArrayHasBitsInRange,
      :blBitArraySubsumes => :blBitArraySubsumes,
      :blBitArrayIntersects => :blBitArrayIntersects,
      :blBitArrayGetRange => :blBitArrayGetRange,
      :blBitArrayEquals => :blBitArrayEquals,
      :blBitArrayCompare => :blBitArrayCompare,
      :blBitArrayClear => :blBitArrayClear,
      :blBitArrayResize => :blBitArrayResize,
      :blBitArrayReserve => :blBitArrayReserve,
      :blBitArrayShrink => :blBitArrayShrink,
      :blBitArraySetBit => :blBitArraySetBit,
      :blBitArrayFillRange => :blBitArrayFillRange,
      :blBitArrayFillWords => :blBitArrayFillWords,
      :blBitArrayClearBit => :blBitArrayClearBit,
      :blBitArrayClearRange => :blBitArrayClearRange,
      :blBitArrayClearWord => :blBitArrayClearWord,
      :blBitArrayClearWords => :blBitArrayClearWords,
      :blBitArrayReplaceOp => :blBitArrayReplaceOp,
      :blBitArrayReplaceBit => :blBitArrayReplaceBit,
      :blBitArrayReplaceWord => :blBitArrayReplaceWord,
      :blBitArrayReplaceWords => :blBitArrayReplaceWords,
      :blBitArrayAppendBit => :blBitArrayAppendBit,
      :blBitArrayAppendWord => :blBitArrayAppendWord,
      :blBitArrayAppendWords => :blBitArrayAppendWords,
    }
    args = {
      :blBitArrayInit => [:pointer],
      :blBitArrayInitMove => [:pointer, :pointer],
      :blBitArrayInitWeak => [:pointer, :pointer],
      :blBitArrayDestroy => [:pointer],
      :blBitArrayReset => [:pointer],
      :blBitArrayAssignMove => [:pointer, :pointer],
      :blBitArrayAssignWeak => [:pointer, :pointer],
      :blBitArrayAssignWords => [:pointer, :pointer, :uint],
      :blBitArrayIsEmpty => [:pointer],
      :blBitArrayGetSize => [:pointer],
      :blBitArrayGetWordCount => [:pointer],
      :blBitArrayGetCapacity => [:pointer],
      :blBitArrayGetData => [:pointer],
      :blBitArrayGetCardinality => [:pointer],
      :blBitArrayGetCardinalityInRange => [:pointer, :uint, :uint],
      :blBitArrayHasBit => [:pointer, :uint],
      :blBitArrayHasBitsInRange => [:pointer, :uint, :uint],
      :blBitArraySubsumes => [:pointer, :pointer],
      :blBitArrayIntersects => [:pointer, :pointer],
      :blBitArrayGetRange => [:pointer, :pointer, :pointer],
      :blBitArrayEquals => [:pointer, :pointer],
      :blBitArrayCompare => [:pointer, :pointer],
      :blBitArrayClear => [:pointer],
      :blBitArrayResize => [:pointer, :uint],
      :blBitArrayReserve => [:pointer, :uint],
      :blBitArrayShrink => [:pointer],
      :blBitArraySetBit => [:pointer, :uint],
      :blBitArrayFillRange => [:pointer, :uint, :uint],
      :blBitArrayFillWords => [:pointer, :uint, :pointer, :uint],
      :blBitArrayClearBit => [:pointer, :uint],
      :blBitArrayClearRange => [:pointer, :uint, :uint],
      :blBitArrayClearWord => [:pointer, :uint, :uint],
      :blBitArrayClearWords => [:pointer, :uint, :pointer, :uint],
      :blBitArrayReplaceOp => [:pointer, :uint, :pointer],
      :blBitArrayReplaceBit => [:pointer, :uint, :bool],
      :blBitArrayReplaceWord => [:pointer, :uint, :uint],
      :blBitArrayReplaceWords => [:pointer, :uint, :pointer, :uint],
      :blBitArrayAppendBit => [:pointer, :bool],
      :blBitArrayAppendWord => [:pointer, :uint],
      :blBitArrayAppendWords => [:pointer, :pointer, :uint],
    }
    retvals = {
      :blBitArrayInit => :uint,
      :blBitArrayInitMove => :uint,
      :blBitArrayInitWeak => :uint,
      :blBitArrayDestroy => :uint,
      :blBitArrayReset => :uint,
      :blBitArrayAssignMove => :uint,
      :blBitArrayAssignWeak => :uint,
      :blBitArrayAssignWords => :uint,
      :blBitArrayIsEmpty => :bool,
      :blBitArrayGetSize => :uint,
      :blBitArrayGetWordCount => :uint,
      :blBitArrayGetCapacity => :uint,
      :blBitArrayGetData => :pointer,
      :blBitArrayGetCardinality => :uint,
      :blBitArrayGetCardinalityInRange => :uint,
      :blBitArrayHasBit => :bool,
      :blBitArrayHasBitsInRange => :bool,
      :blBitArraySubsumes => :bool,
      :blBitArrayIntersects => :bool,
      :blBitArrayGetRange => :bool,
      :blBitArrayEquals => :bool,
      :blBitArrayCompare => :int,
      :blBitArrayClear => :uint,
      :blBitArrayResize => :uint,
      :blBitArrayReserve => :uint,
      :blBitArrayShrink => :uint,
      :blBitArraySetBit => :uint,
      :blBitArrayFillRange => :uint,
      :blBitArrayFillWords => :uint,
      :blBitArrayClearBit => :uint,
      :blBitArrayClearRange => :uint,
      :blBitArrayClearWord => :uint,
      :blBitArrayClearWords => :uint,
      :blBitArrayReplaceOp => :uint,
      :blBitArrayReplaceBit => :uint,
      :blBitArrayReplaceWord => :uint,
      :blBitArrayReplaceWords => :uint,
      :blBitArrayAppendBit => :uint,
      :blBitArrayAppendWord => :uint,
      :blBitArrayAppendWords => :uint,
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

