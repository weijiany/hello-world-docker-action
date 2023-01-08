#!/bin/sh

check() {
    # shellcheck disable=SC3043
    local name="${1}"
    if [ -d "${name}" ]; then
        for inner_file in "${name}"/*
        do
            check "${inner_file}"
        done
    else
        if [ -x "${name}" ]; then
            /bin/shellcheck -C "${name}"
        fi
    fi
}

for file_name in "${@}"
do
    check "${file_name}"
done
