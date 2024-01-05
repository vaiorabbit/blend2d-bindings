# Ruby-Blend2D : Yet another Blend2D wrapper for Ruby
#
# * https://github.com/vaiorabbit/blend2d-bindings
#
# [NOTICE] Autogenerated. Do not edit.

require 'ffi'
require_relative 'blend2d_array'

module Blend2D
  extend FFI::Library
  # Define/Macro


  # Enum

  BL_FILE_OPEN_NO_FLAGS = 0
  BL_FILE_OPEN_READ = 1
  BL_FILE_OPEN_WRITE = 2
  BL_FILE_OPEN_RW = 3
  BL_FILE_OPEN_CREATE = 4
  BL_FILE_OPEN_DELETE = 8
  BL_FILE_OPEN_TRUNCATE = 16
  BL_FILE_OPEN_READ_EXCLUSIVE = 268435456
  BL_FILE_OPEN_WRITE_EXCLUSIVE = 536870912
  BL_FILE_OPEN_RW_EXCLUSIVE = 805306368
  BL_FILE_OPEN_CREATE_EXCLUSIVE = 1073741824
  BL_FILE_OPEN_DELETE_EXCLUSIVE = 2147483648
  BL_FILE_OPEN_FORCE_UINT = 4294967295
  BL_FILE_SEEK_SET = 0
  BL_FILE_SEEK_CUR = 1
  BL_FILE_SEEK_END = 2
  BL_FILE_SEEK_MAX_VALUE = 3
  BL_FILE_SEEK_FORCE_UINT = 4294967295
  BL_FILE_READ_NO_FLAGS = 0
  BL_FILE_READ_MMAP_ENABLED = 1
  BL_FILE_READ_MMAP_AVOID_SMALL = 2
  BL_FILE_READ_MMAP_NO_FALLBACK = 8
  BL_FILE_READ_FORCE_UINT = 4294967295

  # Typedef

  typedef :int, :BLFileOpenFlags
  typedef :int, :BLFileSeekType
  typedef :int, :BLFileReadFlags

  # Struct

  class BLFileCore < FFI::Struct
    layout(
      :handle, :long,
    )
    def handle = self[:handle]
    def handle=(v) self[:handle] = v end
    def init() = blFileInit(self)
    def self.create()
      instance = BLFileCore.new
      blFileInit(instance)
      instance
    end
    def reset() = blFileReset(self)
    def open(fileName, openFlags) = blFileOpen(self, fileName, openFlags)
    def close() = blFileClose(self)
    def seek(offset, seekType, positionOut) = blFileSeek(self, offset, seekType, positionOut)
    def read(buffer, n, bytesReadOut) = blFileRead(self, buffer, n, bytesReadOut)
    def write(buffer, n, bytesWrittenOut) = blFileWrite(self, buffer, n, bytesWrittenOut)
    def truncate(maxSize) = blFileTruncate(self, maxSize)
    def getSize(fileSizeOut) = blFileGetSize(self, fileSizeOut)
    def systemReadFile(dst, maxSize, readFlags) = blFileSystemReadFile(fileName, dst, maxSize, readFlags)
    def systemWriteFile(data, size, bytesWrittenOut) = blFileSystemWriteFile(fileName, data, size, bytesWrittenOut)
  end


  # Function

  def self.setup_filesystem_symbols(output_error = false)
    symbols = [
      :blFileInit,
      :blFileReset,
      :blFileOpen,
      :blFileClose,
      :blFileSeek,
      :blFileRead,
      :blFileWrite,
      :blFileTruncate,
      :blFileGetSize,
      :blFileSystemReadFile,
      :blFileSystemWriteFile,
    ]
    apis = {
      :blFileInit => :blFileInit,
      :blFileReset => :blFileReset,
      :blFileOpen => :blFileOpen,
      :blFileClose => :blFileClose,
      :blFileSeek => :blFileSeek,
      :blFileRead => :blFileRead,
      :blFileWrite => :blFileWrite,
      :blFileTruncate => :blFileTruncate,
      :blFileGetSize => :blFileGetSize,
      :blFileSystemReadFile => :blFileSystemReadFile,
      :blFileSystemWriteFile => :blFileSystemWriteFile,
    }
    args = {
      :blFileInit => [:pointer],
      :blFileReset => [:pointer],
      :blFileOpen => [:pointer, :pointer, :int],
      :blFileClose => [:pointer],
      :blFileSeek => [:pointer, :long_long, :int, :pointer],
      :blFileRead => [:pointer, :pointer, :ulong, :pointer],
      :blFileWrite => [:pointer, :pointer, :ulong, :pointer],
      :blFileTruncate => [:pointer, :long_long],
      :blFileGetSize => [:pointer, :pointer],
      :blFileSystemReadFile => [:pointer, :pointer, :ulong, :int],
      :blFileSystemWriteFile => [:pointer, :pointer, :ulong, :pointer],
    }
    retvals = {
      :blFileInit => :uint,
      :blFileReset => :uint,
      :blFileOpen => :uint,
      :blFileClose => :uint,
      :blFileSeek => :uint,
      :blFileRead => :uint,
      :blFileWrite => :uint,
      :blFileTruncate => :uint,
      :blFileGetSize => :uint,
      :blFileSystemReadFile => :uint,
      :blFileSystemWriteFile => :uint,
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

