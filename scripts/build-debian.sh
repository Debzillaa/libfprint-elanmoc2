#!/bin/bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
BUILD_DIR="${ROOT}/.debian-build"

rm -rf "$BUILD_DIR"
mkdir -p "$BUILD_DIR"

cd "$BUILD_DIR"

curl -L \
  "https://gitlab.freedesktop.org/libfprint/libfprint/-/archive/v1.94.100/libfprint-v1.94.100.tar.gz" \
  -o libfprint-v1.94.100.tar.gz

tar -xzf libfprint-v1.94.100.tar.gz
mv libfprint-v1.94.100 source

mkdir -p source/debian/patches

cp "$ROOT/packaging/debian/control" source/debian/
cp "$ROOT/packaging/debian/rules" source/debian/
cp "$ROOT/packaging/debian/changelog" source/debian/
cp "$ROOT/packaging/debian/source-format" source/debian/
cp "$ROOT/packaging/debian/patches/series" source/debian/patches/
cp "$ROOT/packaging/debian/patches/0001-add-elanmoc2-04f3-0ca0.patch" \
   source/debian/patches/

cd source
dpkg-buildpackage -us -uc -b
