def load_blend2d_lib()
  case RbConfig::CONFIG['host_os']
  when /mswin|msys|mingw/
    Blend2D.load_lib(Dir.pwd + '/../lib/libblend2d.dll')
  when /darwin/
    arch = RUBY_PLATFORM.split('-')[0]
    Blend2D.load_lib("#{Dir.pwd}/../lib/libblend2d.#{arch}.dylib")
  when /linux/
    arch = RUBY_PLATFORM.split('-')[0]
    Blend2D.load_lib("#{Dir.pwd}/../lib/libblend2d.#{arch}.so")
  else
    raise RuntimeError, "Unsupported platform."
  end
end
