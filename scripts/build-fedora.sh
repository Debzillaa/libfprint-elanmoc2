#!/bin/bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TOPDIR="${ROOT}/.rpmbuild"
VERSION="1.94.100"

rm -rf "$TOPDIR"
mkdir -p "$TOPDIR"/{BUILD,BUILDROOT,RPMS,SOURCES,SPECS,SRPMS}

curl -L \
  "https://gitlab.freedesktop.org/libfprint/libfprint/-/archive/v${VERSION}/libfprint-v${VERSION}.tar.gz" \
  -o "$TOPDIR/SOURCES/libfprint-v${VERSION}.tar.gz"

cp "$ROOT/patches/0001-add-elanmoc2-04f3-0ca0.patch" \
   "$TOPDIR/SOURCES/"

cp "$ROOT/packaging/fedora/libfprint.spec" \
   "$TOPDIR/SPECS/"

rpmbuild \
  --define "_topdir $TOPDIR" \
  -ba "$TOPDIR/SPECS/libfprint.spec"
