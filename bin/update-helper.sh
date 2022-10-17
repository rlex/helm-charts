#!/bin/bash
set -x
#ugly-ass script to bump version and regenerate docs
#maybe increment version automatically?
#maybe add it to PR pipeline?

#assign vars from args
chart=${1}
patchlevel=${2}

#exit on no args
if [[ ${1} == "" && ${2} == "" ]];
  then
  echo "Usage: update-helper.sh chart_name patchlevel"
  echo "patchlevel can be either major, minor or patch"
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

#function to work with semver, source:
#https://github.com/fmahnke/shell-semver/blob/master/increment_version.sh
semver_increment() {
  case ${2} in
    major ) major=true;;
    minor ) minor=true;;
    patch ) patch=true;;
  esac

  shift $(($OPTIND - 1))

  version=$1

  # Build array from version string.

  a=( ${version//./ } )

  # If version string is missing or has the wrong number of members, show usage message.

  if [ ${#a[@]} -ne 3 ]
  then
    echo "usage: $(basename $0) [-Mmp] major.minor.patch"
    exit 1
  fi

  # Increment version numbers as requested.

  if [ ! -z $major ]
  then
    ((a[0]++))
    a[1]=0
    a[2]=0
  fi

  if [ ! -z $minor ]
  then
    ((a[1]++))
    a[2]=0
  fi

  if [ ! -z $patch ]
  then
    ((a[2]++))
  fi

  echo "${a[0]}.${a[1]}.${a[2]}"
}

#parse current version from Chart.yaml
current_version=$(grep version charts/${chart}/Chart.yaml | awk {'print $2'})
#set to version we need
target_version=$(semver_increment ${current_version} ${patchlevel})
#patch it around
sedlink -i "s/^version:.*$/version: ${target_version}/g" charts/${chart}/Chart.yaml
#regenerate docs
helm-docs
#add to git staging
git add charts/${chart}/
#commit
git commit -m "[${chart}] bump to ${target_version}"
