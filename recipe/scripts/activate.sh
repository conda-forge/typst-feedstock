if [ "${TYPST_PACKAGE_PATH+x}" ] ; then
  export TYPST_PACKAGE_PATH_CONDA_BACKUP="${TYPST_PACKAGE_PATH}"
fi
export TYPST_PACKAGE_PATH="${CONDA_PREFIX}/share/typst/packages"

if [ "${TYPST_FONT_PATHS+x}" ] ; then
  export TYPST_FONT_PATHS_CONDA_BACKUP="${TYPST_FONT_PATHS}"
else
  export TYPST_FONT_PATHS="${CONDA_PREFIX}/fonts"
fi
