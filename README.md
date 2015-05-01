# PKGBUILDs for [Arch User Repository](https://aur.archlinux.com)

Control scripts for managing AUR packages (with support for AUR 4.0 repos).

Requires @falconindy's pkgbuild-introspection tools to auto-generate .SRCINFO

Use `./setup.sh modules` to pull AUR repos as submodules, and `./setup.sh hooks`
to add hooks for automatic generation of .SRCINFO and aurballs.
