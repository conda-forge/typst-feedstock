cargo-bundle-licenses ^
    --format yaml ^
    --output THIRDPARTY_LICENSES.yaml || goto :error

cargo install --no-track --locked --root "%LIBRARY_PREFIX%" --path .\crates\typst-cli || goto :error

if not exist %PREFIX%\etc\conda\env_vars.d mkdir %PREFIX%\etc\conda\env_vars.d
(
echo {
echo     "TYPST_PACKAGE_PATH": "%LIBRARY_PREFIX:\=/%/share/typst/packages",
echo     "TYPST_FONT_PATHS": "%LIBRARY_PREFIX:\=/%/fonts"
echo }
) > %PREFIX%\etc\conda\env_vars.d\typst.json

goto :EOF

:error
echo Failed with error #%errorlevel%.
exit 1
