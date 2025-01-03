# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "blend2d-bindings"
  spec.version       = "0.1.0"
  spec.authors       = ["vaiorabbit"]
  spec.email         = ["vaiorabbit@gmail.com"]
  spec.summary       = %q{Ruby bindings for Blend2d}
  spec.homepage      = "https://github.com/vaiorabbit/blend2d-bindings"
  spec.require_paths = ["lib"]
  spec.license       = "Zlib"
  spec.description   = <<-DESC
Ruby bindings for Blend2D ( https://github.com/blend2d/blend2d ).
  DESC

  spec.required_ruby_version = '>= 3.0.0'

  spec.add_runtime_dependency 'ffi', '~> 1.16'

  spec.files = Dir.glob("lib/*.rb") +
               ["README.md", "LICENSE.txt", "ChangeLog"] +
               ["examples/test.rb", "examples/util/setup_blend2d.rb"]

  if spec.platform == "ruby"
    spec.files += Dir.glob("lib/*")
  else
    case spec.platform.os
    when "linux"
      if spec.platform.cpu == "aarch64"
        spec.files += Dir.glob("lib/*.aarch64.so")
      elsif spec.platform.cpu == "x86_64"
        spec.files += Dir.glob("lib/*.x86_64.so")
      else
        raise ArgumentError
      end
    when "darwin"
      if spec.platform.cpu == "arm64"
        spec.files += Dir.glob("lib/*.arm64.dylib")
      elsif spec.platform.cpu == "x86_64"
        spec.files += Dir.glob("lib/*.x86_64.dylib")
      else
        raise ArgumentError
      end
    when "mingw"
      if spec.platform.cpu == "x64"
        spec.files += Dir.glob("lib/*.dll")
      else
        raise ArgumentError
      end
    else
      raise ArgumentError
    end
  end
end
