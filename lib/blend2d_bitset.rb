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

  BL_BIT_SET_INVALID_INDEX = 4294967295
  BL_BIT_SET_RANGE_MASK = 2147483648
  BL_BIT_SET_SEGMENT_WORD_COUNT = 4

  # Typedef

  typedef :int, :BLBitSetConstants

  # Struct

  class BLBitSetSegment < FFI::Struct
    layout(
      :_startWord, :uint,
      :_data, [:uint, 4],
    )
    def _startWord = self[:_startWord]
    def _startWord=(v) self[:_startWord] = v end
    def _data = self[:_data]
    def _data=(v) self[:_data] = v end
    def self.create_as(__startWord_, __data_)
      instance = BLBitSetSegment.new
      instance[:_startWord] = __startWord_
      instance[:_data] = __data_
      instance
    end
  end

  class BLBitSetData < FFI::Struct
    layout(
      :segmentData, :pointer,
      :segmentCount, :uint,
      :ssoSegments, [BLBitSetSegment, 3],
    )
    def segmentData = self[:segmentData]
    def segmentData=(v) self[:segmentData] = v end
    def segmentCount = self[:segmentCount]
    def segmentCount=(v) self[:segmentCount] = v end
    def ssoSegments = self[:ssoSegments]
    def ssoSegments=(v) self[:ssoSegments] = v end
    def self.create_as(_segmentData_, _segmentCount_, _ssoSegments_)
      instance = BLBitSetData.new
      instance[:segmentData] = _segmentData_
      instance[:segmentCount] = _segmentCount_
      instance[:ssoSegments] = _ssoSegments_
      instance
    end
  end

  class BLBitSetCore < FFI::Struct
    layout(
      :_d, BLObjectDetail,
    )
    def _d = self[:_d]
    def _d=(v) self[:_d] = v end
    def init() = blBitSetInit(self)
    def self.create()
      instance = BLBitSetCore.new
      blBitSetInit(instance)
      instance
    end
    def initMove(other) = blBitSetInitMove(self, other)
    def initWeak(other) = blBitSetInitWeak(self, other)
    def initRange(startBit, endBit) = blBitSetInitRange(self, startBit, endBit)
    def destroy() = blBitSetDestroy(self)
    def reset() = blBitSetReset(self)
    def assignMove(other) = blBitSetAssignMove(self, other)
    def assignWeak(other) = blBitSetAssignWeak(self, other)
    def assignDeep(other) = blBitSetAssignDeep(self, other)
    def assignRange(startBit, endBit) = blBitSetAssignRange(self, startBit, endBit)
    def assignWords(startWord, wordData, wordCount) = blBitSetAssignWords(self, startWord, wordData, wordCount)
    def isEmpty() = blBitSetIsEmpty(self)
    def getData(out) = blBitSetGetData(self, out)
    def getSegmentCount() = blBitSetGetSegmentCount(self)
    def getSegmentCapacity() = blBitSetGetSegmentCapacity(self)
    def getCardinality() = blBitSetGetCardinality(self)
    def getCardinalityInRange(startBit, endBit) = blBitSetGetCardinalityInRange(self, startBit, endBit)
    def hasBit(bitIndex) = blBitSetHasBit(self, bitIndex)
    def hasBitsInRange(startBit, endBit) = blBitSetHasBitsInRange(self, startBit, endBit)
    def subsumes(b) = blBitSetSubsumes(a, b)
    def intersects(b) = blBitSetIntersects(a, b)
    def getRange(startOut, endOut) = blBitSetGetRange(self, startOut, endOut)
    def equals(b) = blBitSetEquals(a, b)
    def compare(b) = blBitSetCompare(a, b)
    def clear() = blBitSetClear(self)
    def shrink() = blBitSetShrink(self)
    def optimize() = blBitSetOptimize(self)
    def chop(startBit, endBit) = blBitSetChop(self, startBit, endBit)
    def addBit(bitIndex) = blBitSetAddBit(self, bitIndex)
    def addRange(rangeStartBit, rangeEndBit) = blBitSetAddRange(self, rangeStartBit, rangeEndBit)
    def addWords(startWord, wordData, wordCount) = blBitSetAddWords(self, startWord, wordData, wordCount)
    def clearBit(bitIndex) = blBitSetClearBit(self, bitIndex)
    def clearRange(rangeStartBit, rangeEndBit) = blBitSetClearRange(self, rangeStartBit, rangeEndBit)
    def builderCommit(builder, newAreaIndex) = blBitSetBuilderCommit(self, builder, newAreaIndex)
    def builderAddRange(builder, startBit, endBit) = blBitSetBuilderAddRange(self, builder, startBit, endBit)
  end

  class BLBitSetBuilderCore < FFI::Struct
    layout(
      :_areaShift, :uint,
      :_areaIndex, :uint,
    )
    def _areaShift = self[:_areaShift]
    def _areaShift=(v) self[:_areaShift] = v end
    def _areaIndex = self[:_areaIndex]
    def _areaIndex=(v) self[:_areaIndex] = v end
    def commit(builder, newAreaIndex) = blBitSetBuilderCommit(self, builder, newAreaIndex)
    def addRange(builder, startBit, endBit) = blBitSetBuilderAddRange(self, builder, startBit, endBit)
    def self.create_as(__areaShift_, __areaIndex_)
      instance = BLBitSetBuilderCore.new
      instance[:_areaShift] = __areaShift_
      instance[:_areaIndex] = __areaIndex_
      instance
    end
  end

  class BLBitSetImpl < FFI::Struct
    layout(
      :segmentCount, :uint,
      :segmentCapacity, :uint,
    )
    def segmentCount = self[:segmentCount]
    def segmentCount=(v) self[:segmentCount] = v end
    def segmentCapacity = self[:segmentCapacity]
    def segmentCapacity=(v) self[:segmentCapacity] = v end
    def self.create_as(_segmentCount_, _segmentCapacity_)
      instance = BLBitSetImpl.new
      instance[:segmentCount] = _segmentCount_
      instance[:segmentCapacity] = _segmentCapacity_
      instance
    end
  end


  # Function

  def self.setup_bitset_symbols(output_error = false)
    symbols = [
      :blBitSetInit,
      :blBitSetInitMove,
      :blBitSetInitWeak,
      :blBitSetInitRange,
      :blBitSetDestroy,
      :blBitSetReset,
      :blBitSetAssignMove,
      :blBitSetAssignWeak,
      :blBitSetAssignDeep,
      :blBitSetAssignRange,
      :blBitSetAssignWords,
      :blBitSetIsEmpty,
      :blBitSetGetData,
      :blBitSetGetSegmentCount,
      :blBitSetGetSegmentCapacity,
      :blBitSetGetCardinality,
      :blBitSetGetCardinalityInRange,
      :blBitSetHasBit,
      :blBitSetHasBitsInRange,
      :blBitSetSubsumes,
      :blBitSetIntersects,
      :blBitSetGetRange,
      :blBitSetEquals,
      :blBitSetCompare,
      :blBitSetClear,
      :blBitSetShrink,
      :blBitSetOptimize,
      :blBitSetChop,
      :blBitSetAddBit,
      :blBitSetAddRange,
      :blBitSetAddWords,
      :blBitSetClearBit,
      :blBitSetClearRange,
      :blBitSetBuilderCommit,
      :blBitSetBuilderAddRange,
    ]
    apis = {
      :blBitSetInit => :blBitSetInit,
      :blBitSetInitMove => :blBitSetInitMove,
      :blBitSetInitWeak => :blBitSetInitWeak,
      :blBitSetInitRange => :blBitSetInitRange,
      :blBitSetDestroy => :blBitSetDestroy,
      :blBitSetReset => :blBitSetReset,
      :blBitSetAssignMove => :blBitSetAssignMove,
      :blBitSetAssignWeak => :blBitSetAssignWeak,
      :blBitSetAssignDeep => :blBitSetAssignDeep,
      :blBitSetAssignRange => :blBitSetAssignRange,
      :blBitSetAssignWords => :blBitSetAssignWords,
      :blBitSetIsEmpty => :blBitSetIsEmpty,
      :blBitSetGetData => :blBitSetGetData,
      :blBitSetGetSegmentCount => :blBitSetGetSegmentCount,
      :blBitSetGetSegmentCapacity => :blBitSetGetSegmentCapacity,
      :blBitSetGetCardinality => :blBitSetGetCardinality,
      :blBitSetGetCardinalityInRange => :blBitSetGetCardinalityInRange,
      :blBitSetHasBit => :blBitSetHasBit,
      :blBitSetHasBitsInRange => :blBitSetHasBitsInRange,
      :blBitSetSubsumes => :blBitSetSubsumes,
      :blBitSetIntersects => :blBitSetIntersects,
      :blBitSetGetRange => :blBitSetGetRange,
      :blBitSetEquals => :blBitSetEquals,
      :blBitSetCompare => :blBitSetCompare,
      :blBitSetClear => :blBitSetClear,
      :blBitSetShrink => :blBitSetShrink,
      :blBitSetOptimize => :blBitSetOptimize,
      :blBitSetChop => :blBitSetChop,
      :blBitSetAddBit => :blBitSetAddBit,
      :blBitSetAddRange => :blBitSetAddRange,
      :blBitSetAddWords => :blBitSetAddWords,
      :blBitSetClearBit => :blBitSetClearBit,
      :blBitSetClearRange => :blBitSetClearRange,
      :blBitSetBuilderCommit => :blBitSetBuilderCommit,
      :blBitSetBuilderAddRange => :blBitSetBuilderAddRange,
    }
    args = {
      :blBitSetInit => [:pointer],
      :blBitSetInitMove => [:pointer, :pointer],
      :blBitSetInitWeak => [:pointer, :pointer],
      :blBitSetInitRange => [:pointer, :uint, :uint],
      :blBitSetDestroy => [:pointer],
      :blBitSetReset => [:pointer],
      :blBitSetAssignMove => [:pointer, :pointer],
      :blBitSetAssignWeak => [:pointer, :pointer],
      :blBitSetAssignDeep => [:pointer, :pointer],
      :blBitSetAssignRange => [:pointer, :uint, :uint],
      :blBitSetAssignWords => [:pointer, :uint, :pointer, :uint],
      :blBitSetIsEmpty => [:pointer],
      :blBitSetGetData => [:pointer, :pointer],
      :blBitSetGetSegmentCount => [:pointer],
      :blBitSetGetSegmentCapacity => [:pointer],
      :blBitSetGetCardinality => [:pointer],
      :blBitSetGetCardinalityInRange => [:pointer, :uint, :uint],
      :blBitSetHasBit => [:pointer, :uint],
      :blBitSetHasBitsInRange => [:pointer, :uint, :uint],
      :blBitSetSubsumes => [:pointer, :pointer],
      :blBitSetIntersects => [:pointer, :pointer],
      :blBitSetGetRange => [:pointer, :pointer, :pointer],
      :blBitSetEquals => [:pointer, :pointer],
      :blBitSetCompare => [:pointer, :pointer],
      :blBitSetClear => [:pointer],
      :blBitSetShrink => [:pointer],
      :blBitSetOptimize => [:pointer],
      :blBitSetChop => [:pointer, :uint, :uint],
      :blBitSetAddBit => [:pointer, :uint],
      :blBitSetAddRange => [:pointer, :uint, :uint],
      :blBitSetAddWords => [:pointer, :uint, :pointer, :uint],
      :blBitSetClearBit => [:pointer, :uint],
      :blBitSetClearRange => [:pointer, :uint, :uint],
      :blBitSetBuilderCommit => [:pointer, :pointer, :uint],
      :blBitSetBuilderAddRange => [:pointer, :pointer, :uint, :uint],
    }
    retvals = {
      :blBitSetInit => :uint,
      :blBitSetInitMove => :uint,
      :blBitSetInitWeak => :uint,
      :blBitSetInitRange => :uint,
      :blBitSetDestroy => :uint,
      :blBitSetReset => :uint,
      :blBitSetAssignMove => :uint,
      :blBitSetAssignWeak => :uint,
      :blBitSetAssignDeep => :uint,
      :blBitSetAssignRange => :uint,
      :blBitSetAssignWords => :uint,
      :blBitSetIsEmpty => :int,
      :blBitSetGetData => :uint,
      :blBitSetGetSegmentCount => :uint,
      :blBitSetGetSegmentCapacity => :uint,
      :blBitSetGetCardinality => :uint,
      :blBitSetGetCardinalityInRange => :uint,
      :blBitSetHasBit => :int,
      :blBitSetHasBitsInRange => :int,
      :blBitSetSubsumes => :int,
      :blBitSetIntersects => :int,
      :blBitSetGetRange => :int,
      :blBitSetEquals => :int,
      :blBitSetCompare => :int,
      :blBitSetClear => :uint,
      :blBitSetShrink => :uint,
      :blBitSetOptimize => :uint,
      :blBitSetChop => :uint,
      :blBitSetAddBit => :uint,
      :blBitSetAddRange => :uint,
      :blBitSetAddWords => :uint,
      :blBitSetClearBit => :uint,
      :blBitSetClearRange => :uint,
      :blBitSetBuilderCommit => :uint,
      :blBitSetBuilderAddRange => :uint,
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

