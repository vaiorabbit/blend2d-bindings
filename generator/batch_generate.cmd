@echo off
setlocal enabledelayedexpansion
set PYTHONPATH=.\clang

python generate_rgba.py > ..\lib\blend2d_rgba.rb
python generate_object.py > ..\lib\blend2d_object.rb
python generate_array.py > ..\lib\blend2d_array.rb
python generate_bitarray.py > ..\lib\blend2d_bitarray.rb
python generate_bitset.py > ..\lib\blend2d_bitset.rb
python generate_filesystem.py > ..\lib\blend2d_filesystem.rb
python generate_format.py > ..\lib\blend2d_format.rb
python generate_geometry.py > ..\lib\blend2d_geometry.rb
python generate_string.py > ..\lib\blend2d_string.rb
python generate_imagecodec.py > ..\lib\blend2d_imagecodec.rb
python generate_image.py > ..\lib\blend2d_image.rb
python generate_random.py > ..\lib\blend2d_random.rb
python generate_fontdefs.py > ..\lib\blend2d_fontdefs.rb
python generate_fontdata.py > ..\lib\blend2d_fontdata.rb
python generate_glyphrun.py > ..\lib\blend2d_glyphrun.rb
python generate_glyphrun.py > ..\lib\blend2d_glyphrun.rb
python generate_glyphbuffer.py > ..\lib\blend2d_glyphbuffer.rb
python generate_path.py > ..\lib\blend2d_path.rb
python generate_fontface.py > ..\lib\blend2d_fontface.rb
python generate_fontfeaturesettings.py > ..\lib\blend2d_fontfeaturesettings.rb
python generate_fontvariationsettings.py > ..\lib\blend2d_fontvariationsettings.rb
python generate_font.py > ..\lib\blend2d_font.rb
python generate_fontmanager.py > ..\lib\blend2d_fontmanager.rb
python generate_matrix.py > ..\lib\blend2d_matrix.rb
python generate_gradient.py > ..\lib\blend2d_gradient.rb
python generate_imagedecoder.py > ..\lib\blend2d_imagedecoder.rb
python generate_imageencoder.py > ..\lib\blend2d_imageencoder.rb
python generate_pattern.py > ..\lib\blend2d_pattern.rb
python generate_pixelconverter.py > ..\lib\blend2d_pixelconverter.rb
python generate_runtime.py > ..\lib\blend2d_runtime.rb
python generate_var.py > ..\lib\blend2d_var.rb
python generate_context.py > ..\lib\blend2d_context.rb
python generate_api.py > ..\lib\blend2d_api.rb
