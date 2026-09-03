#!/bin/bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TOPDIR="${ROOT}/.rpmbuild"

rm -rf "$TOPDIR"
mkdir -p "$TOPDIR"/{BUILD,BUILDROOT,RPMS,SOURCES,SPECS,SRPMS}

cp "$ROOT/packaging/fedora/libfprint.spec" "$TOPDIR/SPECS/"
cp "$ROOT/patches/0001-add-elanmoc2-04f3-0ca0.patch" "$TOPDIR/SOURCES/"

rpmbuild \
  --define "_topdir $TOPDIR" \
  -ba "$TOPDIR/SPECS/libfprint.spec"
