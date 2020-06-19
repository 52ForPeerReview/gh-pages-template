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
__DESCRIPTION__='Script to run after Forking template repository'


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
Example usage -> ./after-fork.sh 'account-name'
EOF
    (("${#_message}")) && {
        printf >&2 '\n## Error: %s\n' "${_message}"
    }
}


_account_name="${1}"
(("${#_account_name}")) || {
    usage 'No account name provided'
    exit 1
}


_files_to_modify=(
    '.github/README.md'
    '_config.yml'
)

for _file in ${_files_to_modify[@]}; do
    _abs_path="${__DIR__}/${_file}"
    [[ -f "${_abs_path}" ]] || {
        usage 'Cannot find file -> %s\n' "${_abs_path}"
        exit 1
    }
done


sed -i "/baseurl:/ { s#:[[:print:]]*#: \"${_account_name}\"#; }" "${__DIR__}/_config.yml"
sed -i "/github_username:/ { s#:[[:print:]]*#: ${_account_name}#; }" "${__DIR__}/_config.yml"

sed -i "/gh-pages-template/ { s##${_account_name}#g; }" "${__DIR__}/.github/README.md"

_now="$(date +'%Y-%m-%d %T %z')"
sed -i "/date:/ { s#:[[:print:]]*#: ${_now}#; }" "${__DIR__}/r000.md"
sed -i "/date:/ { s#:[[:print:]]*#: ${_now}#; }" "${__DIR__}/rounds/_r000/feed.atom"
sed -i "/date:/ { s#:[[:print:]]*#: ${_now}#; }" "${__DIR__}/rounds/_r000/feed.rss"

sed -i "/repository:/ { s#:[[:print:]]*#: ${_account_name}#; }" "${__DIR__}/_config_repository.yml"
