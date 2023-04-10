#!/bin/sh

# A script for building with Flatpak, which creates a local repo for testing.
# Remember to commit your changes with git, or they won't get built.

case "$1" in
  --install|-i)
    INSTALL=yes
    ;;
  --bundle|-b)
    BUNDLE=yes
    ;;
  --help|-h)
    echo "Usage: $0 [OPTION]"
    echo ""
    echo "    --install, -i	Build and install locally"
    echo "    --bundle, -b	Build a .flatpak bundle"
    echo "    --help, -h  	Show this help message and exit"
    exit 0
    ;;
  -*)
    echo "Unknown command $1"
    exit 1
    ;;
esac

FLATPAK="$(command -v flatpak)"
BUILDER="$(command -v flatpak-builder)"
if [ -z "$FLATPAK" ]; then
  echo "flatpak not installed!"
  exit 1
elif [ -z "$BUILDER" ]; then
  echo "flatpak-builder not installed!"
  exit 1
fi

cd "$(command dirname -- "$0")"

echo "Creating XEphem Flatpak..."
echo "Using $(command pwd)/repo"
echo ""

"$BUILDER" --repo=repo --force-clean staging io.github.xephem.yml || exit $?

if [ "$INSTALL" == "yes" ]; then
  "$FLATPAK" remote-add --user --if-not-exists --no-gpg-verify xephem-local repo && \
  "$FLATPAK" install --user --or-update -y xephem-local io.github.xephem
fi
if [ "$BUNDLE" == "yes" ]; then
  echo "Exporting bundle..."
  "$FLATPAK" build-bundle repo io.github.xephem.flatpak io.github.xephem && \
  echo "Exported application to $(pwd)/io.github.xephem.flatpak"
fi

exit $?
