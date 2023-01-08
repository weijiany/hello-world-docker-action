#!/bin/sh

exit_code=0

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
            exit_code=$(( ${exit_code} + ${$?} ))
        fi
    fi
}

for file_name in "${@}"
do
    check "${file_name}"
done

exit ${exit_code}
