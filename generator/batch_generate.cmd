@echo off
setlocal enabledelayedexpansion
set PYTHONPATH=%LOCALAPPDATA%\Programs\Python\Python311\Lib\site-packages
set PYTHONEXE=%LOCALAPPDATA%\Programs\Python\Python311\python.exe

%PYTHONEXE% generate_rgba.py > ..\lib\blend2d_rgba.rb
%PYTHONEXE% generate_object.py > ..\lib\blend2d_object.rb
%PYTHONEXE% generate_array.py > ..\lib\blend2d_array.rb
%PYTHONEXE% generate_bitarray.py > ..\lib\blend2d_bitarray.rb
%PYTHONEXE% generate_bitset.py > ..\lib\blend2d_bitset.rb
%PYTHONEXE% generate_filesystem.py > ..\lib\blend2d_filesystem.rb
%PYTHONEXE% generate_format.py > ..\lib\blend2d_format.rb
%PYTHONEXE% generate_geometry.py > ..\lib\blend2d_geometry.rb
%PYTHONEXE% generate_string.py > ..\lib\blend2d_string.rb
%PYTHONEXE% generate_imagecodec.py > ..\lib\blend2d_imagecodec.rb
%PYTHONEXE% generate_image.py > ..\lib\blend2d_image.rb
%PYTHONEXE% generate_random.py > ..\lib\blend2d_random.rb
%PYTHONEXE% generate_fontdefs.py > ..\lib\blend2d_fontdefs.rb
%PYTHONEXE% generate_fontdata.py > ..\lib\blend2d_fontdata.rb
%PYTHONEXE% generate_glyphrun.py > ..\lib\blend2d_glyphrun.rb
%PYTHONEXE% generate_glyphrun.py > ..\lib\blend2d_glyphrun.rb
%PYTHONEXE% generate_glyphbuffer.py > ..\lib\blend2d_glyphbuffer.rb
%PYTHONEXE% generate_path.py > ..\lib\blend2d_path.rb
%PYTHONEXE% generate_fontface.py > ..\lib\blend2d_fontface.rb
%PYTHONEXE% generate_fontfeaturesettings.py > ..\lib\blend2d_fontfeaturesettings.rb
%PYTHONEXE% generate_fontvariationsettings.py > ..\lib\blend2d_fontvariationsettings.rb
%PYTHONEXE% generate_font.py > ..\lib\blend2d_font.rb
%PYTHONEXE% generate_fontmanager.py > ..\lib\blend2d_fontmanager.rb
%PYTHONEXE% generate_matrix.py > ..\lib\blend2d_matrix.rb
%PYTHONEXE% generate_gradient.py > ..\lib\blend2d_gradient.rb
%PYTHONEXE% generate_imagedecoder.py > ..\lib\blend2d_imagedecoder.rb
%PYTHONEXE% generate_imageencoder.py > ..\lib\blend2d_imageencoder.rb
%PYTHONEXE% generate_pattern.py > ..\lib\blend2d_pattern.rb
%PYTHONEXE% generate_pixelconverter.py > ..\lib\blend2d_pixelconverter.rb
%PYTHONEXE% generate_runtime.py > ..\lib\blend2d_runtime.rb
%PYTHONEXE% generate_var.py > ..\lib\blend2d_var.rb
%PYTHONEXE% generate_context.py > ..\lib\blend2d_context.rb
%PYTHONEXE% generate_api.py > ..\lib\blend2d_api.rb
