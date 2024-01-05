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

  BL_RUNTIME_MAX_IMAGE_SIZE = 65535
  BL_RUNTIME_MAX_THREAD_COUNT = 32
  BL_RUNTIME_INFO_TYPE_BUILD = 0
  BL_RUNTIME_INFO_TYPE_SYSTEM = 1
  BL_RUNTIME_INFO_TYPE_RESOURCE = 2
  BL_RUNTIME_INFO_TYPE_MAX_VALUE = 2
  BL_RUNTIME_INFO_TYPE_FORCE_UINT = 4294967295
  BL_RUNTIME_BUILD_TYPE_DEBUG = 0
  BL_RUNTIME_BUILD_TYPE_RELEASE = 1
  BL_RUNTIME_BUILD_TYPE_FORCE_UINT = 4294967295
  BL_RUNTIME_CPU_ARCH_UNKNOWN = 0
  BL_RUNTIME_CPU_ARCH_X86 = 1
  BL_RUNTIME_CPU_ARCH_ARM = 2
  BL_RUNTIME_CPU_ARCH_MIPS = 3
  BL_RUNTIME_CPU_ARCH_FORCE_UINT = 4294967295
  BL_RUNTIME_CPU_FEATURE_X86_SSE2 = 1
  BL_RUNTIME_CPU_FEATURE_X86_SSE3 = 2
  BL_RUNTIME_CPU_FEATURE_X86_SSSE3 = 4
  BL_RUNTIME_CPU_FEATURE_X86_SSE4_1 = 8
  BL_RUNTIME_CPU_FEATURE_X86_SSE4_2 = 16
  BL_RUNTIME_CPU_FEATURE_X86_AVX = 32
  BL_RUNTIME_CPU_FEATURE_X86_AVX2 = 64
  BL_RUNTIME_CPU_FEATURE_X86_AVX512 = 128
  BL_RUNTIME_CPU_FEATURE_FORCE_UINT = 4294967295
  BL_RUNTIME_CLEANUP_NO_FLAGS = 0
  BL_RUNTIME_CLEANUP_OBJECT_POOL = 1
  BL_RUNTIME_CLEANUP_ZEROED_POOL = 2
  BL_RUNTIME_CLEANUP_THREAD_POOL = 16
  BL_RUNTIME_CLEANUP_EVERYTHING = 4294967295
  BL_RUNTIME_CLEANUP_FLAG_FORCE_UINT = 4294967295

  # Typedef

  typedef :int, :BLRuntimeLimits
  typedef :int, :BLRuntimeInfoType
  typedef :int, :BLRuntimeBuildType
  typedef :int, :BLRuntimeCpuArch
  typedef :int, :BLRuntimeCpuFeatures
  typedef :int, :BLRuntimeCleanupFlags

  # Struct

  class BLRuntimeBuildInfo < FFI::Struct
    layout(
      :majorVersion, :uint,
      :minorVersion, :uint,
      :patchVersion, :uint,
      :buildType, :uint,
      :baselineCpuFeatures, :uint,
      :supportedCpuFeatures, :uint,
      :maxImageSize, :uint,
      :maxThreadCount, :uint,
      :reserved, [:uint, 2],
      :compilerInfo, [:char, 32],
    )
    def majorVersion = self[:majorVersion]
    def majorVersion=(v) self[:majorVersion] = v end
    def minorVersion = self[:minorVersion]
    def minorVersion=(v) self[:minorVersion] = v end
    def patchVersion = self[:patchVersion]
    def patchVersion=(v) self[:patchVersion] = v end
    def buildType = self[:buildType]
    def buildType=(v) self[:buildType] = v end
    def baselineCpuFeatures = self[:baselineCpuFeatures]
    def baselineCpuFeatures=(v) self[:baselineCpuFeatures] = v end
    def supportedCpuFeatures = self[:supportedCpuFeatures]
    def supportedCpuFeatures=(v) self[:supportedCpuFeatures] = v end
    def maxImageSize = self[:maxImageSize]
    def maxImageSize=(v) self[:maxImageSize] = v end
    def maxThreadCount = self[:maxThreadCount]
    def maxThreadCount=(v) self[:maxThreadCount] = v end
    def reserved = self[:reserved]
    def reserved=(v) self[:reserved] = v end
    def compilerInfo = self[:compilerInfo]
    def compilerInfo=(v) self[:compilerInfo] = v end
    def self.create_as(_majorVersion_, _minorVersion_, _patchVersion_, _buildType_, _baselineCpuFeatures_, _supportedCpuFeatures_, _maxImageSize_, _maxThreadCount_, _reserved_, _compilerInfo_)
      instance = BLRuntimeBuildInfo.new
      instance[:majorVersion] = _majorVersion_
      instance[:minorVersion] = _minorVersion_
      instance[:patchVersion] = _patchVersion_
      instance[:buildType] = _buildType_
      instance[:baselineCpuFeatures] = _baselineCpuFeatures_
      instance[:supportedCpuFeatures] = _supportedCpuFeatures_
      instance[:maxImageSize] = _maxImageSize_
      instance[:maxThreadCount] = _maxThreadCount_
      instance[:reserved] = _reserved_
      instance[:compilerInfo] = _compilerInfo_
      instance
    end
  end

  class BLRuntimeSystemInfo < FFI::Struct
    layout(
      :cpuArch, :uint,
      :cpuFeatures, :uint,
      :coreCount, :uint,
      :threadCount, :uint,
      :threadStackSize, :uint,
      :removed, :uint,
      :allocationGranularity, :uint,
      :reserved, [:uint, 5],
    )
    def cpuArch = self[:cpuArch]
    def cpuArch=(v) self[:cpuArch] = v end
    def cpuFeatures = self[:cpuFeatures]
    def cpuFeatures=(v) self[:cpuFeatures] = v end
    def coreCount = self[:coreCount]
    def coreCount=(v) self[:coreCount] = v end
    def threadCount = self[:threadCount]
    def threadCount=(v) self[:threadCount] = v end
    def threadStackSize = self[:threadStackSize]
    def threadStackSize=(v) self[:threadStackSize] = v end
    def removed = self[:removed]
    def removed=(v) self[:removed] = v end
    def allocationGranularity = self[:allocationGranularity]
    def allocationGranularity=(v) self[:allocationGranularity] = v end
    def reserved = self[:reserved]
    def reserved=(v) self[:reserved] = v end
    def self.create_as(_cpuArch_, _cpuFeatures_, _coreCount_, _threadCount_, _threadStackSize_, _removed_, _allocationGranularity_, _reserved_)
      instance = BLRuntimeSystemInfo.new
      instance[:cpuArch] = _cpuArch_
      instance[:cpuFeatures] = _cpuFeatures_
      instance[:coreCount] = _coreCount_
      instance[:threadCount] = _threadCount_
      instance[:threadStackSize] = _threadStackSize_
      instance[:removed] = _removed_
      instance[:allocationGranularity] = _allocationGranularity_
      instance[:reserved] = _reserved_
      instance
    end
  end

  class BLRuntimeResourceInfo < FFI::Struct
    layout(
      :vmUsed, :ulong,
      :vmReserved, :ulong,
      :vmOverhead, :ulong,
      :vmBlockCount, :ulong,
      :zmUsed, :ulong,
      :zmReserved, :ulong,
      :zmOverhead, :ulong,
      :zmBlockCount, :ulong,
      :dynamicPipelineCount, :ulong,
      :reserved, [:ulong, 7],
    )
    def vmUsed = self[:vmUsed]
    def vmUsed=(v) self[:vmUsed] = v end
    def vmReserved = self[:vmReserved]
    def vmReserved=(v) self[:vmReserved] = v end
    def vmOverhead = self[:vmOverhead]
    def vmOverhead=(v) self[:vmOverhead] = v end
    def vmBlockCount = self[:vmBlockCount]
    def vmBlockCount=(v) self[:vmBlockCount] = v end
    def zmUsed = self[:zmUsed]
    def zmUsed=(v) self[:zmUsed] = v end
    def zmReserved = self[:zmReserved]
    def zmReserved=(v) self[:zmReserved] = v end
    def zmOverhead = self[:zmOverhead]
    def zmOverhead=(v) self[:zmOverhead] = v end
    def zmBlockCount = self[:zmBlockCount]
    def zmBlockCount=(v) self[:zmBlockCount] = v end
    def dynamicPipelineCount = self[:dynamicPipelineCount]
    def dynamicPipelineCount=(v) self[:dynamicPipelineCount] = v end
    def reserved = self[:reserved]
    def reserved=(v) self[:reserved] = v end
    def self.create_as(_vmUsed_, _vmReserved_, _vmOverhead_, _vmBlockCount_, _zmUsed_, _zmReserved_, _zmOverhead_, _zmBlockCount_, _dynamicPipelineCount_, _reserved_)
      instance = BLRuntimeResourceInfo.new
      instance[:vmUsed] = _vmUsed_
      instance[:vmReserved] = _vmReserved_
      instance[:vmOverhead] = _vmOverhead_
      instance[:vmBlockCount] = _vmBlockCount_
      instance[:zmUsed] = _zmUsed_
      instance[:zmReserved] = _zmReserved_
      instance[:zmOverhead] = _zmOverhead_
      instance[:zmBlockCount] = _zmBlockCount_
      instance[:dynamicPipelineCount] = _dynamicPipelineCount_
      instance[:reserved] = _reserved_
      instance
    end
  end


  # Function

  def self.setup_runtime_symbols(output_error = false)
    symbols = [
      :blRuntimeInit,
      :blRuntimeShutdown,
      :blRuntimeCleanup,
      :blRuntimeQueryInfo,
      :blRuntimeMessageOut,
      :blRuntimeMessageFmt,
      :blRuntimeMessageVFmt,
      :blResultFromPosixError,
    ]
    apis = {
      :blRuntimeInit => :blRuntimeInit,
      :blRuntimeShutdown => :blRuntimeShutdown,
      :blRuntimeCleanup => :blRuntimeCleanup,
      :blRuntimeQueryInfo => :blRuntimeQueryInfo,
      :blRuntimeMessageOut => :blRuntimeMessageOut,
      :blRuntimeMessageFmt => :blRuntimeMessageFmt,
      :blRuntimeMessageVFmt => :blRuntimeMessageVFmt,
      :blResultFromPosixError => :blResultFromPosixError,
    }
    args = {
      :blRuntimeInit => [],
      :blRuntimeShutdown => [],
      :blRuntimeCleanup => [:int],
      :blRuntimeQueryInfo => [:int, :pointer],
      :blRuntimeMessageOut => [:pointer],
      :blRuntimeMessageFmt => [:pointer],
      :blRuntimeMessageVFmt => [:pointer, :int],
      :blResultFromPosixError => [:int],
    }
    retvals = {
      :blRuntimeInit => :uint,
      :blRuntimeShutdown => :uint,
      :blRuntimeCleanup => :uint,
      :blRuntimeQueryInfo => :uint,
      :blRuntimeMessageOut => :uint,
      :blRuntimeMessageFmt => :uint,
      :blRuntimeMessageVFmt => :uint,
      :blResultFromPosixError => :uint,
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

