#!/usr/bin/env bash

if [[ "${target_platform}" == linux-* ]]; then
    export OPENSSL_DIR=$PREFIX
fi

cargo-bundle-licenses \
    --format yaml \
    --output THIRDPARTY_LICENSES.yaml

cargo install --no-track --locked --root "$PREFIX" --path crates/typst-cli

"$STRIP" "$PREFIX/bin/typst"

# Copy the [de]activate scripts to $PREFIX/etc/conda/[de]activate.d.
# This will allow them to be run on environment activation.
for CHANGE in "activate" "deactivate"
do
    mkdir -p "${PREFIX}/etc/conda/${CHANGE}.d"
    cp "${RECIPE_DIR}/scripts/${CHANGE}.sh" "${PREFIX}/etc/conda/${CHANGE}.d/${PKG_NAME}_${CHANGE}.sh"
done