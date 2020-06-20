#!/usr/bin/env bash

## Find true directory script resides in, true name, and true path
__SOURCE__="${BASH_SOURCE[0]}"
while [[ -h "${__SOURCE__}" ]]; do
    __SOURCE__="$(find "${__SOURCE__}" -type l -ls | sed -n 's@^.* -> \(.*\)@\1@p')"
done
__DIR__="$(cd -P "$(dirname "${__SOURCE__}")" && pwd)"
__NAME__="${__SOURCE__##*/}"
__PATH__="${__DIR__}/${__NAME__}"
__AUTHOR__='S0AndS0'
__DESCRIPTION__='Re-initializes Git Submodules for templates'


__license__(){
    cat <<EOF
${__DESCRIPTION__}
Copyright (C) 2020 ${__AUTHOR__}

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as published
by the Free Software Foundation, version 3 of the License.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
EOF
}


usage() {
    local _message="${1}"
    cat <<EOF
Example usage -> ./${__NAME__} 'account-name'
EOF
    (("${#_message}")) && {
        printf >&2 '\n## Error: %s\n' "${_message}"
    }
}


parse_name() {
    awk '{
        gsub("(.* \")|(\"].*)", "", $0)
        print $0
    }' <<<"${1@Q}"
}

parse_value() {
    awk '{
        gsub("(.* = )", "", $0)
        gsub("('\''.*)", "", $0)
        print $0
    }' <<<"${1@Q}"
}


while read -r _line; do
    case "${_line@Q}" in
        *'[submodule "'*'"]'*)
            _name="$(parse_name "${_line@Q}")"
        ;;
        *'path = '*)
            _path="$(parse_value "${_line@Q}")"
        ;;
        *'url = '*)
            _url="$(parse_value "${_line@Q}")"
        ;;
        *'branch = '*)
            _branch="$(parse_value "${_line@Q}")"
        ;;
    esac

    (("${#_name}")) && (("${#_path}")) && (("${#_url}")) && (("${#_branch}")) && {
        _dir="${_path%/*}"
        [[ -d "${_dir}" ]] || {
            printf 'Making directory path -> %s\n' "${_dir}"
            mkdir -p "${_dir}"
        }

        [[ -d "${_path}" ]] && {
            printf >&2 'Git Submodule path already exists -> %s\n' "${_path}"
            continue
        } || {
            printf '_name -> %s\n' "${_name}"
            printf '_path -> %s\n' "${_path}"
            printf '_url -> %s\n' "${_url}"
            printf '_branch -> %s\n' "${_branch}"
            printf '_dir -> %s\n' "${_dir}"
            git submodule add --name "${_name}" -b "${_branch}" "${_url}" "${_path}"
            printf '___\n'
        }

        _name=''
        _path=''
        _url=''
        _branch=''
    }
done <"${__DIR__}/.gitmodules"
