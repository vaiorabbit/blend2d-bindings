require 'imgui'
require 'imgui_impl_raylib'

s = Gem::Specification.find_by_name('imgui-bindings')
shared_lib_path = s.full_gem_path + '/lib/'

case RUBY_PLATFORM
when /mswin|msys|mingw|cygwin/
  ImGui.load_lib(shared_lib_path + 'imgui.dll')
when /darwin/
  arch = RUBY_PLATFORM.split('-')[0]
  ImGui.load_lib(shared_lib_path + "imgui.#{arch}.dylib")
when /linux/
  arch = RUBY_PLATFORM.split('-')[0]
  ImGui.load_lib(shared_lib_path + "imgui.#{arch}.so")
else
  raise RuntimeError, "Unknown OS: #{RUBY_PLATFORM}"
end
