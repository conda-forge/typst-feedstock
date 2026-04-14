#!/usr/bin/env bash

if [[ "${target_platform}" == linux-* ]]; then
    export OPENSSL_DIR=$PREFIX
fi

cargo-bundle-licenses \
    --format yaml \
    --output THIRDPARTY_LICENSES.yaml

cargo install --no-track --locked --root "$PREFIX" --path crates/typst-cli

"$STRIP" "$PREFIX/bin/typst"

mkdir -p $PREFIX/etc/conda/env_vars.d
cat > $PREFIX/etc/conda/env_vars.d/typst.json << EOF
{
    "TYPST_PACKAGE_PATH": "$PREFIX/share/typst/packages",
    "TYPST_FONT_PATHS": "$PREFIX/fonts"
}
EOF
