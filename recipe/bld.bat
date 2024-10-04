cargo-bundle-licenses ^
    --format yaml ^
    --output THIRDPARTY_LICENSES.yaml || goto :error

cargo install --no-track --locked --root "%PREFIX%" --path .\crates\typst-cli || goto :error

setlocal EnableDelayedExpansion

:: Copy the [de]activate scripts to %PREFIX%\etc\conda\[de]activate.d.
:: This will allow them to be run on environment activation.
for %%F in (activate deactivate) DO (
    if not exist %PREFIX%\etc\conda\%%F.d mkdir %PREFIX%\etc\conda\%%F.d
    copy %RECIPE_DIR%\%%F.bat %PREFIX%\etc\conda\%%F.d\%PKG_NAME%_%%F.bat || goto :error
    :: Copy unix shell activation scripts, needed by Windows Bash users
    copy %RECIPE_DIR%\%%F-win.sh %PREFIX%\etc\conda\%%F.d\%PKG_NAME%_%%F.sh || goto :error
)

goto :EOF

:error
echo Failed with error #%errorlevel%.
exit 1
