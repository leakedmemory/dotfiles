#!/usr/bin/env bash

OFL_DIR="$HOME/repos/google-fonts/ofl"
APACHE_DIR="$HOME/repos/google-fonts/apache"
DEST_DIR="$HOME/.local/share/fonts/google-fonts"

copy_ttf_files() {
    local src_dir=$1
    local fontname=$2
    local dest_dir="$DEST_DIR/$fontname"

    mkdir -p "$dest_dir"
    cp "$src_dir/$fontname"/*.ttf "$dest_dir" 2>/dev/null
}

for fontname in $(ls "$OFL_DIR"); do
    copy_ttf_files "$OFL_DIR" "$fontname"
done

for fontname in $(ls "$APACHE_DIR"); do
    copy_ttf_files "$APACHE_DIR" "$fontname"
done
