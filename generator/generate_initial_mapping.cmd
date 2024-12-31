@echo off
setlocal enabledelayedexpansion
set PYTHONPATH=.\clang
python generate_initial_cindex_mapping.py > blend2d_cindex_mapping.json
python generate_initial_define_mapping.py > blend2d_define_mapping.json
