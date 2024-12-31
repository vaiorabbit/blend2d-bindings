def blend2d_bindings_gem_available?
  Gem::Specification.find_by_name('blend2d-bindings')
rescue Gem::LoadError
  false
rescue
  Gem.available?('blend2d-bindings')
end

if blend2d_bindings_gem_available?
  # puts("Loading from Gem system path.")
  require 'blend2d'

  s = Gem::Specification.find_by_name('blend2d-bindings')
  shared_lib_path = s.full_gem_path + '/lib/'

  case RUBY_PLATFORM
  when /mswin|msys|mingw|cygwin/
    Blend2D.load_lib(shared_lib_path + 'libblend2d.dll')
  when /darwin/
    arch = RUBY_PLATFORM.split('-')[0]
    Blend2D.load_lib(shared_lib_path + "libblend2d.#{arch}.dylib")
  when /linux/
    arch = RUBY_PLATFORM.split('-')[0]
    Blend2D.load_lib(shared_lib_path + "libblend2d.#{arch}.so")
  else
    raise RuntimeError, "setup_dll.rb : Unknown OS: #{RUBY_PLATFORM}"
  end
else
  # puts("Loaging from local path.")
  require '../lib/blend2d'

  case RUBY_PLATFORM
  when /mswin|msys|mingw|cygwin/
    Blend2D.load_lib(Dir.pwd + '/../lib/' + 'libblend2d.dll')
  when /darwin/
    arch = RUBY_PLATFORM.split('-')[0]
    Blend2D.load_lib(Dir.pwd + '/../lib/' + "libblend2d.#{arch}.dylib")
  when /linux/
    arch = RUBY_PLATFORM.split('-')[0]
    Blend2D.load_lib(Dir.pwd + '/../lib/' + "libblend2d.#{arch}.so")
  else
    raise RuntimeError, "setup_dll.rb : Unknown OS: #{RUBY_PLATFORM}"
  end
end

include Blend2D
