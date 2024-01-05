# Ruby-Blend2D : Yet another Blend2D wrapper for Ruby
#
# * https://github.com/vaiorabbit/blend2d-bindings
#
# [NOTICE] Autogenerated. Do not edit.

require 'ffi'

module Blend2D
  extend FFI::Library
  # Define/Macro


  # Enum

  BL_SUCCESS = 0
  BL_ERROR_START_INDEX = 65536
  BL_ERROR_OUT_OF_MEMORY = 65536
  BL_ERROR_INVALID_VALUE = 65537
  BL_ERROR_INVALID_STATE = 65538
  BL_ERROR_INVALID_HANDLE = 65539
  BL_ERROR_INVALID_CONVERSION = 65540
  BL_ERROR_OVERFLOW = 65541
  BL_ERROR_NOT_INITIALIZED = 65542
  BL_ERROR_NOT_IMPLEMENTED = 65543
  BL_ERROR_NOT_PERMITTED = 65544
  BL_ERROR_IO = 65545
  BL_ERROR_BUSY = 65546
  BL_ERROR_INTERRUPTED = 65547
  BL_ERROR_TRY_AGAIN = 65548
  BL_ERROR_TIMED_OUT = 65549
  BL_ERROR_BROKEN_PIPE = 65550
  BL_ERROR_INVALID_SEEK = 65551
  BL_ERROR_SYMLINK_LOOP = 65552
  BL_ERROR_FILE_TOO_LARGE = 65553
  BL_ERROR_ALREADY_EXISTS = 65554
  BL_ERROR_ACCESS_DENIED = 65555
  BL_ERROR_MEDIA_CHANGED = 65556
  BL_ERROR_READ_ONLY_FS = 65557
  BL_ERROR_NO_DEVICE = 65558
  BL_ERROR_NO_ENTRY = 65559
  BL_ERROR_NO_MEDIA = 65560
  BL_ERROR_NO_MORE_DATA = 65561
  BL_ERROR_NO_MORE_FILES = 65562
  BL_ERROR_NO_SPACE_LEFT = 65563
  BL_ERROR_NOT_EMPTY = 65564
  BL_ERROR_NOT_FILE = 65565
  BL_ERROR_NOT_DIRECTORY = 65566
  BL_ERROR_NOT_SAME_DEVICE = 65567
  BL_ERROR_NOT_BLOCK_DEVICE = 65568
  BL_ERROR_INVALID_FILE_NAME = 65569
  BL_ERROR_FILE_NAME_TOO_LONG = 65570
  BL_ERROR_TOO_MANY_OPEN_FILES = 65571
  BL_ERROR_TOO_MANY_OPEN_FILES_BY_OS = 65572
  BL_ERROR_TOO_MANY_LINKS = 65573
  BL_ERROR_TOO_MANY_THREADS = 65574
  BL_ERROR_THREAD_POOL_EXHAUSTED = 65575
  BL_ERROR_FILE_EMPTY = 65576
  BL_ERROR_OPEN_FAILED = 65577
  BL_ERROR_NOT_ROOT_DEVICE = 65578
  BL_ERROR_UNKNOWN_SYSTEM_ERROR = 65579
  BL_ERROR_INVALID_ALIGNMENT = 65580
  BL_ERROR_INVALID_SIGNATURE = 65581
  BL_ERROR_INVALID_DATA = 65582
  BL_ERROR_INVALID_STRING = 65583
  BL_ERROR_INVALID_KEY = 65584
  BL_ERROR_DATA_TRUNCATED = 65585
  BL_ERROR_DATA_TOO_LARGE = 65586
  BL_ERROR_DECOMPRESSION_FAILED = 65587
  BL_ERROR_INVALID_GEOMETRY = 65588
  BL_ERROR_NO_MATCHING_VERTEX = 65589
  BL_ERROR_INVALID_CREATE_FLAGS = 65590
  BL_ERROR_NO_MATCHING_COOKIE = 65591
  BL_ERROR_NO_STATES_TO_RESTORE = 65592
  BL_ERROR_TOO_MANY_SAVED_STATES = 65593
  BL_ERROR_IMAGE_TOO_LARGE = 65594
  BL_ERROR_IMAGE_NO_MATCHING_CODEC = 65595
  BL_ERROR_IMAGE_UNKNOWN_FILE_FORMAT = 65596
  BL_ERROR_IMAGE_DECODER_NOT_PROVIDED = 65597
  BL_ERROR_IMAGE_ENCODER_NOT_PROVIDED = 65598
  BL_ERROR_PNG_MULTIPLE_IHDR = 65599
  BL_ERROR_PNG_INVALID_IDAT = 65600
  BL_ERROR_PNG_INVALID_IEND = 65601
  BL_ERROR_PNG_INVALID_PLTE = 65602
  BL_ERROR_PNG_INVALID_TRNS = 65603
  BL_ERROR_PNG_INVALID_FILTER = 65604
  BL_ERROR_JPEG_UNSUPPORTED_FEATURE = 65605
  BL_ERROR_JPEG_INVALID_SOS = 65606
  BL_ERROR_JPEG_INVALID_SOF = 65607
  BL_ERROR_JPEG_MULTIPLE_SOF = 65608
  BL_ERROR_JPEG_UNSUPPORTED_SOF = 65609
  BL_ERROR_FONT_NOT_INITIALIZED = 65610
  BL_ERROR_FONT_NO_MATCH = 65611
  BL_ERROR_FONT_NO_CHARACTER_MAPPING = 65612
  BL_ERROR_FONT_MISSING_IMPORTANT_TABLE = 65613
  BL_ERROR_FONT_FEATURE_NOT_AVAILABLE = 65614
  BL_ERROR_FONT_CFF_INVALID_DATA = 65615
  BL_ERROR_FONT_PROGRAM_TERMINATED = 65616
  BL_ERROR_GLYPH_SUBSTITUTION_TOO_LARGE = 65617
  BL_ERROR_INVALID_GLYPH = 65618
  BL_ERROR_FORCE_UINT = 4294967295
  BL_BYTE_ORDER_LE = 0
  BL_BYTE_ORDER_BE = 1
  BL_BYTE_ORDER_NATIVE = 0
  BL_BYTE_ORDER_SWAPPED = 1
  BL_BYTE_ORDER_FORCE_UINT = 4294967295
  BL_DATA_ACCESS_NO_FLAGS = 0
  BL_DATA_ACCESS_READ = 1
  BL_DATA_ACCESS_WRITE = 2
  BL_DATA_ACCESS_RW = 3
  BL_DATA_ACCESS_FORCE_UINT = 4294967295
  BL_DATA_SOURCE_TYPE_NONE = 0
  BL_DATA_SOURCE_TYPE_MEMORY = 1
  BL_DATA_SOURCE_TYPE_FILE = 2
  BL_DATA_SOURCE_TYPE_CUSTOM = 3
  BL_DATA_SOURCE_TYPE_MAX_VALUE = 3
  BL_DATA_SOURCE_TYPE_FORCE_UINT = 4294967295
  BL_MODIFY_OP_ASSIGN_FIT = 0
  BL_MODIFY_OP_ASSIGN_GROW = 1
  BL_MODIFY_OP_APPEND_FIT = 2
  BL_MODIFY_OP_APPEND_GROW = 3
  BL_MODIFY_OP_MAX_VALUE = 3
  BL_MODIFY_OP_FORCE_UINT = 4294967295
  BL_BOOLEAN_OP_COPY = 0
  BL_BOOLEAN_OP_AND = 1
  BL_BOOLEAN_OP_OR = 2
  BL_BOOLEAN_OP_XOR = 3
  BL_BOOLEAN_OP_AND_NOT = 4
  BL_BOOLEAN_OP_NOT_AND = 5
  BL_BOOLEAN_OP_MAX_VALUE = 5
  BL_BOOLEAN_OP_FORCE_UINT = 4294967295
  BL_EXTEND_MODE_PAD = 0
  BL_EXTEND_MODE_REPEAT = 1
  BL_EXTEND_MODE_REFLECT = 2
  BL_EXTEND_MODE_PAD_X_PAD_Y = 0
  BL_EXTEND_MODE_PAD_X_REPEAT_Y = 3
  BL_EXTEND_MODE_PAD_X_REFLECT_Y = 4
  BL_EXTEND_MODE_REPEAT_X_REPEAT_Y = 1
  BL_EXTEND_MODE_REPEAT_X_PAD_Y = 5
  BL_EXTEND_MODE_REPEAT_X_REFLECT_Y = 6
  BL_EXTEND_MODE_REFLECT_X_REFLECT_Y = 2
  BL_EXTEND_MODE_REFLECT_X_PAD_Y = 7
  BL_EXTEND_MODE_REFLECT_X_REPEAT_Y = 8
  BL_EXTEND_MODE_SIMPLE_MAX_VALUE = 2
  BL_EXTEND_MODE_COMPLEX_MAX_VALUE = 8
  BL_EXTEND_MODE_MAX_VALUE = 8
  BL_EXTEND_MODE_FORCE_UINT = 4294967295
  BL_TEXT_ENCODING_UTF8 = 0
  BL_TEXT_ENCODING_UTF16 = 1
  BL_TEXT_ENCODING_UTF32 = 2
  BL_TEXT_ENCODING_LATIN1 = 3
  BL_TEXT_ENCODING_WCHAR = 2
  BL_TEXT_ENCODING_MAX_VALUE = 3
  BL_TEXT_ENCODING_FORCE_UINT = 4294967295

  # Typedef

  typedef :uint, :BLResult
  typedef :uint, :BLTag
  typedef :ulong_long, :BLUniqueId
  typedef :void, :BLUnknown
  callback :BLDebugMessageSinkFunc, [:pointer, :ulong, :pointer], :void
  typedef :int, :BLResultCode
  typedef :int, :BLByteOrder
  typedef :int, :BLDataAccessFlags
  typedef :int, :BLDataSourceType
  typedef :int, :BLModifyOp
  typedef :int, :BLBooleanOp
  typedef :int, :BLExtendMode
  typedef :int, :BLTextEncoding

  # Struct

  class BLRange < FFI::Struct
    layout(
      :start, :ulong,
      :end, :ulong,
    )
    def start = self[:start]
    def start=(v) self[:start] = v end
    def end = self[:end]
    def end=(v) self[:end] = v end
    def self.create_as(_start_, _end_)
      instance = BLRange.new
      instance[:start] = _start_
      instance[:end] = _end_
      instance
    end
  end

  class BLArrayView < FFI::Struct
    layout(
      :data, :pointer,
      :size, :ulong,
    )
    def data = self[:data]
    def data=(v) self[:data] = v end
    def size = self[:size]
    def size=(v) self[:size] = v end
    def self.create_as(_data_, _size_)
      instance = BLArrayView.new
      instance[:data] = _data_
      instance[:size] = _size_
      instance
    end
  end

  class BLStringView < FFI::Struct
    layout(
      :data, :pointer,
      :size, :ulong,
    )
    def data = self[:data]
    def data=(v) self[:data] = v end
    def size = self[:size]
    def size=(v) self[:size] = v end
    def self.create_as(_data_, _size_)
      instance = BLStringView.new
      instance[:data] = _data_
      instance[:size] = _size_
      instance
    end
  end


  # Function

  def self.setup_api_symbols(output_error = false)
    symbols = [
      :blTraceError,
      :blRuntimeAssertionFailure,
    ]
    apis = {
      :blTraceError => :blTraceError,
      :blRuntimeAssertionFailure => :blRuntimeAssertionFailure,
    }
    args = {
      :blTraceError => [:uint],
      :blRuntimeAssertionFailure => [:pointer, :int, :pointer],
    }
    retvals = {
      :blTraceError => :uint,
      :blRuntimeAssertionFailure => :void,
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

