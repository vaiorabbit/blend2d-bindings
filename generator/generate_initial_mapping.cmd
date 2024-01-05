@echo off
setlocal enabledelayedexpansion
set PYTHONPATH=%LOCALAPPDATA%\Programs\Python\Python311\Lib\site-packages
set PYTHONEXE=%LOCALAPPDATA%\Programs\Python\Python311\python.exe

%PYTHONEXE% generate_initial_cindex_mapping.py > blend2d_cindex_mapping.json
%PYTHONEXE% generate_initial_define_mapping.py > blend2d_define_mapping.json
