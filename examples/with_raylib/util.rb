def load_raylib()
  require 'raylib'

  s = Gem::Specification.find_by_name('raylib-bindings')
  shared_lib_path = s.full_gem_path + '/lib/'

  case RUBY_PLATFORM
  when /mswin|msys|mingw|cygwin/
    Raylib.load_lib(shared_lib_path + 'libraylib.dll')
  when /darwin/
    arch = RUBY_PLATFORM.split('-')[0]
    Raylib.load_lib(shared_lib_path + "libraylib.#{arch}.dylib")
  when /linux/
    arch = RUBY_PLATFORM.split('-')[0]
    Raylib.load_lib(shared_lib_path + "libraylib.#{arch}.so")
  else
    raise RuntimeError, "Unknown OS: #{RUBY_PLATFORM}"
  end
end

def load_blend2d()
  require_relative '../../lib/blend2d.rb'

  case RbConfig::CONFIG['host_os']
  when /mswin|msys|mingw/
    Blend2D.load_lib(Dir.pwd + '/../../lib/libblend2d.dll')
  when /darwin/
    arch = RUBY_PLATFORM.split('-')[0]
    Blend2D.load_lib("#{Dir.pwd}/../../lib/libblend2d.#{arch}.dylib")
  when /linux/
    arch = RUBY_PLATFORM.split('-')[0]
    Blend2D.load_lib("#{Dir.pwd}/../../lib/libblend2d.#{arch}.so")
  else
    raise RuntimeError, "Unknown OS: #{RUBY_PLATFORM}"
  end
end
