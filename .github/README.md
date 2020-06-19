# GitHub Pages Template
[heading__top]:
  #github-pages-template
  "&#x2B06; GitHub Pages Template repository for 52 For Code Review challenge"


GitHub Pages Template repository for 52 For Code Review challenge


## [![Byte size of GitHub Pages Template][badge__master__gh_pages_template__source_code]][gh_pages_template__master__source_code] [![Open Issues][badge__issues__gh_pages_template]][issues__gh_pages_template] [![Open Pull Requests][badge__pull_requests__gh_pages_template]][pull_requests__gh_pages_template] [![Latest commits][badge__commits__gh_pages_template__master]][commits__gh_pages_template__master] [![gh-pages-template Demos][badge__gh_pages__gh_pages_template]][gh_pages__gh_pages_template]



------


- [:arrow_up: Top of Document][heading__top]

- [:building_construction: Requirements][heading__requirements]

- [:zap: Quick Start][heading__quick_start]

- [&#x1F9F0; Usage][heading__usage]

- [&#x1F5D2; Notes][heading__notes]

- [:card_index: Attribution][heading__attribution]

- [:balance_scale: Licensing][heading__license]


------



## Requirements
[heading__requirements]:
  #requirements
  "&#x1F3D7; Prerequisites and/or dependencies that this project needs to function properly"


This repository makes use of Git Submodules to track dependencies, to avoid incomplete downloads clone with the `--recurse-submodules` option...


```Bash
git clone --recurse-submodules git@github.com:52ForPeerReview/gh-pages-template.git
```


To update tracked Git Submodules issue the following commands...


```Bash
git pull

git submodule update --init --merge --recursive
```


To force upgrade of Git Submodules...


```Bash
git submodule update --init --merge --recursive --remote
```


> Note, forcing and update of Git Submodule tracked dependencies may cause instabilities and/or merge conflicts; if however everything operates as expected after an update please consider submitting a Pull Request.


This repository makes use of [Jekyll][jekyllrb__home] for building website files from MarkDown and other source files. GitHub Pages automatically builds these files, however, for local/private tests/builds it may be easier to utilize the [Jekyll Admin][jekyll_admin__source] project.


___


## Quick Start
[heading__quick_start]:
  #quick-start
  "&#9889; Perhaps as easy as one, 2.0,..."


To setup your own blog within the `52ForPeerReview` sub-domain, please review the posts found on the [Home Page][52forpeerreview__gh_pages__home] for this Organization.


If you have made a Fork of the `gh-pages-template` repository then please modify this file and the `_config.yml` file, first via the `after-fork.sh` script, eg...


**Syntax Example**


```Bash
./after-fork.sh 'account-name'
```


**Usage Example**


```Bash
./after-fork.sh 'S0AndS0'
```


... then, make any other edits and/or additions via your favorite text editor.


## Usage
[heading__usage]:
  #usage
  "&#x1F9F0;"


Each week add a new post about a project that you are publishing that week, there is a `new-post.sh` script that may be used to generate new post files with the correct FrontMatter...


**Syntax Example**


```Bash
./new-post.sh '<title>' '<short description>'
```


**Usage Example**


```Bash
./new-post.sh 'Awk Sorted Unique Count' 'A script to sort and count unique lines or columns'
```


**Example Post `rounds/_r000/awk-sorted-unique-count.md`**


```MarkDown
---
layout: post
title: "Awk Sorted Unique Count"
description: "A script to sort and count unique lines or columns"
date: 2020-06-15 13:52:36 -0700
# date_updated:  ## Optional, formatted like `date` above
time_to_live: 1800
---



Published new project, [<repository-name>][repository__source] that does stuff...


{% highlight awk %}
git clone git@github.com:<organization>/<repository>.git
{% endhighlight %}


... describe what this project does, and how to utilize it.


Then describe any bits that:


- you believe could be improved
- you'd like help with
- and/or questions that arose during development
- etc...


[repository__source]: https://github.com/<organization>/<repository>
```


___


## Notes
[heading__notes]:
  #notes
  "&#x1F5D2; Additional things to keep in mind when developing"


This repository may not be feature complete and/or fully functional, Pull Requests that add features or fix bugs are certainly welcomed.


- [Fork][gh_pages_template__fork_it] this repository to an account that you have write permissions for.

- Add remote for fork URL. The URL syntax is _`git@github.com:<NAME>/<REPO>.git`_...


```Bash
cd ~/git/hub/52ForPeerReview/gh-pages-template

git remote add fork git@github.com:<NAME>/gh-pages-template.git
```


- Commit your changes and push to your Fork, eg. to fix an issue...


```Bash
cd ~/git/hub/52ForPeerReview/gh-pages-template


git commit -F- <<'EOF'
:bug: Fixes #42 Issue


**Edits**


- `<SCRIPT-NAME>` script, fixes some bug reported in Issue #42
EOF


git push fork master
```


> Note, the `-u` option may be used to set `fork` as the default remote, eg. _`git push -u fork master`_ however, this will also default the `fork` remote for pulling from too! Meaning that pulling updates from `origin` must be done explicitly, eg. _`git pull orgin master`_


- Then on GitHub submit a Pull Request through the Web-UI, the URL syntax is _`https://github.com/<NAME>/<REPO>/pull/new/<BRANCH>`_


> Note; to decrease the chances of your Pull Request needing modifications before being accepted, please check the [dot-github](https://github.com/52ForPeerReview/.github) repository for detailed contributing guidelines.


___


## Attribution
[heading__attribution]:
  #attribution
  "&#x1F4C7; Resources that where helpful in building this project so far."


- [GitHub -- `github-utilities/make-readme`](https://github.com/github-utilities/make-readme)


___


## License
[heading__license]:
  #license
  "&#x2696; Legal side of Open Source"


```
GitHub Pages Template repository for 52 For Code Review challenge
Copyright (C) 2020 S0AndS0

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as published
by the Free Software Foundation, version 3 of the License.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
```


For further details review full length version of [AGPL-3.0][branch__current__license] License.



[branch__current__license]:
  /LICENSE
  "&#x2696; Full length version of AGPL-3.0 License"


[badge__commits__gh_pages_template__master]:
  https://img.shields.io/github/last-commit/52ForPeerReview/gh-pages-template/master.svg

[commits__gh_pages_template__master]:
  https://github.com/52ForPeerReview/gh-pages-template/commits/master
  "&#x1F4DD; History of changes on this branch"


[gh_pages_template__community]:
  https://github.com/52ForPeerReview/gh-pages-template/community
  "&#x1F331; Dedicated to functioning code"

[gh_pages_template__gh_pages]:
  https://github.com/52ForPeerReview/gh-pages-template/tree/
  "Source code examples hosted thanks to GitHub Pages!"

[badge__gh_pages__gh_pages_template]:
  https://img.shields.io/website/https/52ForPeerReview.github.io/gh-pages-template/index.html.svg?down_color=darkorange&down_message=Offline&label=Demo&logo=Demo%20Site&up_color=success&up_message=Online

[gh_pages__gh_pages_template]:
  https://52ForPeerReview.github.io/gh-pages-template/index.html
  "&#x1F52C; Check the example collection tests"

[issues__gh_pages_template]:
  https://github.com/52ForPeerReview/gh-pages-template/issues
  "&#x2622; Search for and _bump_ existing issues or open new issues for project maintainer to address."

[gh_pages_template__fork_it]:
  https://github.com/52ForPeerReview/gh-pages-template/
  "&#x1F531; Fork it!"

[pull_requests__gh_pages_template]:
  https://github.com/52ForPeerReview/gh-pages-template/pulls
  "&#x1F3D7; Pull Request friendly, though please check the Community guidelines"

[gh_pages_template__master__source_code]:
  https://github.com/52ForPeerReview/gh-pages-template/
  "&#x2328; Project source!"

[badge__issues__gh_pages_template]:
  https://img.shields.io/github/issues/52ForPeerReview/gh-pages-template.svg

[badge__pull_requests__gh_pages_template]:
  https://img.shields.io/github/issues-pr/52ForPeerReview/gh-pages-template.svg

[badge__master__gh_pages_template__source_code]:
  https://img.shields.io/github/repo-size/52ForPeerReview/gh-pages-template

[jekyllrb__home]:
  https://jekyllrb.com/
  "Home page for Jekyll documentation"

[jekyll_admin__source]:
  https://github.com/S0AndS0/Jekyll_Admin
  "Scripts for setting-up local/private Jekyll build environment"

[52forpeerreview__gh_pages__home]:
  https://52ForPeerReview.github.io/
  "Home page for the 52 For Peer Review challenge"
