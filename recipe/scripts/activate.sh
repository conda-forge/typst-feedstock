if [ "${TYPST_PACKAGE_PATH+x}" ] ; then
  export TYPST_PACKAGE_PATH_CONDA_BACKUP="${TYPST_PACKAGE_PATH}"
fi
export TYPST_PACKAGE_PATH="${CONDA_PREFIX}/share/typst/packages"