#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
public_dir="${repo_root}/public"

cd "${repo_root}"

hugo --gc --minify --environment production --cleanDestinationDir

if [[ ! -d "${public_dir}" ]]; then
    echo "public directory not found after build" >&2
    exit 1
fi

mapfile -d '' files < <(find "${public_dir}" -type f \
    \( -name '*.html' -o -name '*.css' -o -name '*.js' -o -name '*.mjs' -o -name '*.txt' -o -name '*.xml' -o -name '*.json' -o -name '*.svg' -o -name '*.webmanifest' \) \
    -print0)

if ((${#files[@]} == 0)); then
    echo "No compressible files found in ${public_dir}"
    exit 0
fi

if command -v brotli >/dev/null 2>&1; then
    for file in "${files[@]}"; do
        brotli --force --quality=11 --keep "${file}"
    done
else
    echo "brotli not installed; skipping .br sidecars" >&2
fi

if command -v zstd >/dev/null 2>&1; then
    for file in "${files[@]}"; do
        zstd --quiet --force --ultra -19 -o "${file}.zst" "${file}"
    done
else
    echo "zstd not installed; skipping .zst sidecars" >&2
fi

if command -v gzip >/dev/null 2>&1; then
    for file in "${files[@]}"; do
        gzip --best --force --keep "${file}"
    done
else
    echo "gzip not installed; skipping .gz sidecars" >&2
fi

echo "Production build complete: ${public_dir}"
