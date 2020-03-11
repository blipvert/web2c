#!/bin/bash

set -e

if [ ! -e source/.git ]; then
    git config --replace-all submodule.source.update '!true'
    git submodule update --init --progress -- source
fi

if [ "$(git config --get submodule.source.update)" == '!true' ]; then
    git config --unset-all submodule.source.update
fi

git_dir="$( cd source && git rev-parse --git-dir )"
if [ ! -d "$git_dir" ]; then
    echo "Bad source/.git directory" >&2
    exit 1
fi

if [ ! -f "$git_dir/info/sparse-checkout" ]; then
    cp sparse-checkout.list "$git_dir/info/sparse-checkout"
    ( cd source && git sparse-checkout init )
fi

( cd source && ./reautoconf )
