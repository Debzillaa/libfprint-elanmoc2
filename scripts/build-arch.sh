#!/bin/bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

cd "$ROOT/packaging/arch"

cp "$ROOT/patches/0001-add-elanmoc2-04f3-0ca0.patch" .

makepkg -sf
