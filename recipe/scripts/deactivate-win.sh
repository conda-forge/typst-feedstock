export TYPST_PACKAGE_PATH="$TYPST_PACKAGE_PATH_CONDA_BACKUP"
unset TYPST_PACKAGE_PATH_CONDA_BACKUP
if [ -z $TYPST_PACKAGE_PATH ]; then
    unset TYPST_PACKAGE_PATH
fi

export TYPST_FONT_PATHS="$TYPST_FONT_PATHS_CONDA_BACKUP"
unset TYPST_FONT_PATHS_CONDA_BACKUP
if [ -z $TYPST_FONT_PATHS ]; then
    unset TYPST_FONT_PATHS
fi
