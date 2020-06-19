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
__DESCRIPTION__='Make new post for 52 For Peer Review challenge'


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
  cat <<EOF
Example usage -> ./new-post.sh 'Title of Post' 'Brief description'
EOF
}


_post_title="${1:?$(usage | head -n1)}"
_description="${2}"
(("${#_description}")) && [[ "${_description}" =~ ^'`' ]] && {
  [[ "${_description}" =~ "'" ]] && {
    _description="\"${_description}\""
  } || {
    _description="'${_description}'"
  }
}


_round_directory="$(ls "${__DIR__}/rounds" | awk '{
  if ($0 ~ "_r[0-9]{3}") {
    print $0
  }
}' | tail -n 1)"

_collection_directory="rounds/${_round_directory}"
[[ -d "${_collection_directory}" ]] || {
  printf >&2 'No directory at -> %s\n' "${_collection_directory}"
}
_post_list="$(ls -1 "${_collection_directory}"/*.md 2>/dev/null)"

_post_count='0'
(("${#_post_list}")) && {
  _post_count="$(wc -l <<<"${_post_list}")"
}


[[ "${_post_count}" -gt '52' ]] && {
  printf >&2 'Round for directory is finished!\n'
  exit 1
}


_post_number="$(printf '%03d' "${_post_count}")"

_post_slug="$(awk '{
  gsub(" ", "-", $0)
  gsub(/--*/, "-", $0)
  gsub(/[^a-zA-Z0-9\-]/, "", $0)
  print tolower($0)
}' <<<"${_post_title}")"

_post_name="${_post_number}_${_post_slug}"
_file_name="${_post_name}.md"


[[ -f "${_collection_directory}/${_file_name}" ]] && {
  printf >&2 'Post already exists\n'
  exit 1
}


printf 'Writing -> %s/%s\n' "${_collection_directory}" "${_file_name}"


tee -a "${_collection_directory}/${_file_name}" 1>/dev/null <<EOF
---
layout: post
title: ${_post_title}
description: ${_description}
date: $(date +'%Y-%m-%d %T %z')
# date_updated:  ## Optional, formatted like `date` above
time_to_live: 1800
---
EOF
