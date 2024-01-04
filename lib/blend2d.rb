# Ruby-Blend2D : Yet another Blend2D wrapper for Ruby
#
# * https://github.com/vaiorabbit/blend2d-bindings

require 'ffi'
require_relative 'blend2d_api.rb'
require_relative 'blend2d_array.rb'
require_relative 'blend2d_bitarray.rb'
require_relative 'blend2d_bitset.rb'
require_relative 'blend2d_context.rb'
require_relative 'blend2d_filesystem.rb'
require_relative 'blend2d_font.rb'
require_relative 'blend2d_fontdata.rb'
require_relative 'blend2d_fontdefs.rb'
require_relative 'blend2d_fontface.rb'
require_relative 'blend2d_fontfeaturesettings.rb'
require_relative 'blend2d_fontmanager.rb'
require_relative 'blend2d_fontvariationsettings.rb'
require_relative 'blend2d_format.rb'
require_relative 'blend2d_geometry.rb'
require_relative 'blend2d_glyphbuffer.rb'
require_relative 'blend2d_glyphrun.rb'
require_relative 'blend2d_gradient.rb'
require_relative 'blend2d_image.rb'
require_relative 'blend2d_imagecodec.rb'
require_relative 'blend2d_imagedecoder.rb'
require_relative 'blend2d_imageencoder.rb'
require_relative 'blend2d_matrix.rb'
require_relative 'blend2d_object.rb'
require_relative 'blend2d_path.rb'
require_relative 'blend2d_pattern.rb'
require_relative 'blend2d_pixelconverter.rb'
require_relative 'blend2d_random.rb'
require_relative 'blend2d_rgba.rb'
require_relative 'blend2d_runtime.rb'
require_relative 'blend2d_string.rb'
require_relative 'blend2d_var.rb'

module Blend2D
  extend FFI::Library

  @@blend2d_import_done = false
  def self.load_lib(libpath, output_error = false)

    unless @@blend2d_import_done
      # Ref.: Using Multiple and Alternate Libraries
      # https://github.com/ffi/ffi/wiki/Using-Multiple-and-Alternate-Libraries
      begin
        lib_paths = [libpath].compact
        ffi_lib_flags :now, :global
        ffi_lib *lib_paths
        setup_symbols(output_error)
      rescue => error
        $stderr.puts("[Warning] Failed to load libraries (#{error}).") if output_error
      end
    end

  end

  def self.setup_symbols(output_error = false)
    setup_api_symbols(output_error)
    setup_array_symbols(output_error)
    setup_bitarray_symbols(output_error)
    setup_bitset_symbols(output_error)
    setup_context_symbols(output_error)
    setup_filesystem_symbols(output_error)
    setup_font_symbols(output_error)
    setup_fontdata_symbols(output_error)
    setup_fontdefs_symbols(output_error)
    setup_fontface_symbols(output_error)
    setup_fontfeaturesettings_symbols(output_error)
    setup_fontmanager_symbols(output_error)
    setup_fontvariationsettings_symbols(output_error)
    setup_format_symbols(output_error)
    setup_geometry_symbols(output_error)
    setup_glyphbuffer_symbols(output_error)
    setup_glyphrun_symbols(output_error)
    setup_gradient_symbols(output_error)
    setup_image_symbols(output_error)
    setup_imagecodec_symbols(output_error)
    setup_imagedecoder_symbols(output_error)
    setup_imageencoder_symbols(output_error)
    setup_matrix_symbols(output_error)
    setup_object_symbols(output_error)
    setup_path_symbols(output_error)
    setup_pattern_symbols(output_error)
    setup_pixelconverter_symbols(output_error)
    setup_random_symbols(output_error)
    setup_rgba_symbols(output_error)
    setup_runtime_symbols(output_error)
    setup_string_symbols(output_error)
    setup_var_symbols(output_error)
  end

end
