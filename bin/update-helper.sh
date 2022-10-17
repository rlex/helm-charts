#!/bin/bash
set -x
#ugly-ass script to bump version and regenerate docs
#maybe increment version automatically?
#maybe add it to PR pipeline?

if [[ ${1} == "" && ${2} == "" ]];
  then
  echo "Usage: update-helper.sh chart_name target_version"
  exit 0
fi

#so it works on both linux and OSX
sedlink() {
  if [[ "${OSTYPE}" == "linux-gnu"* ]]; then
    sed "$@"
  elif [[ "${OSTYPE}" == "darwin"* ]]; then
    gsed "$@"
  else
    sed "$@"
  fi
}

chart=${1}
version=${2}

sedlink -i "s/^version:.*$/version: ${version}/g" charts/${chart}/Chart.yaml
helm-docs
git add charts/${chart}/
git commit -m "[${chart}] bump to ${version}"
