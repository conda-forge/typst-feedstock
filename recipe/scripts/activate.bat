@echo off
set "TYPST_PACKAGE_PATH_CONDA_BACKUP=%TYPST_PACKAGE_PATH%"
set "TYPST_PACKAGE_PATH=%CONDA_PREFIX%\share\typst\packages"

set "TYPST_FONT_PATHS_CONDA_BACKUP=%TYPST_FONT_PATHS%"
set "TYPST_FONT_PATHS=%CONDA_PREFIX%\fonts"
