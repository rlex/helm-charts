#!/bin/sh
set -e
set -o pipefail

WORKING_DIRECTORY="$PWD"

[ "$GITHUB_PAGES_REPO" ] || {
  echo "ERROR: Environment variable GITHUB_PAGES_REPO is required"
  exit 1
}
[ -z "$GITHUB_PAGES_BRANCH" ] && GITHUB_PAGES_BRANCH=gh-pages
[ -z "$HELM_CHARTS_SOURCE" ] && HELM_CHARTS_SOURCE="$WORKING_DIRECTORY/charts"
[ -d "$HELM_CHARTS_SOURCE" ] || {
  echo "ERROR: Could not find Helm chart in $HELM_CHARTS_SOURCE"
  exit 1
}
[ -z "$HELM_VERSION" ] && HELM_VERSION=3.1.0
[ -z "$KUBEVAL_VERSION" ] && KUBEVAL_VERSION=0.14.0
[ -z "$KUBERNETES_VERSION" ] && KUBERNETES_VERSION=1.16.0
[ "$CIRCLE_BRANCH" ] || {
  echo "ERROR: Environment variable CIRCLE_BRANCH is required"
  exit 1
}

echo "GITHUB_PAGES_REPO=$GITHUB_PAGES_REPO"
echo "GITHUB_PAGES_BRANCH=$GITHUB_PAGES_BRANCH"
echo "HELM_CHARTS_SOURCE=$HELM_CHARTS_SOURCE"
echo "HELM_VERSION=$HELM_VERSION"
echo "KUBERNETES_VERSION=$KUBERNETES_VERSION"
echo "KUBEVAL_VERSION=$KUBEVAL_VERSION"
echo "CIRCLE_BRANCH=$CIRCLE_BRANCH"
echo "PATH=$PATH"

echo '>> Prepare...'
mkdir -p /tmp/helm/bin
mkdir -p /tmp/helm/publish
mkdir -p /tmp/kubeval/bin
mkdir -p /tmp/kubeval/manifests

apk update
apk add ca-certificates git openssh bash curl

echo '>> Installing Helm...'
cd /tmp/helm/bin
wget "https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz"
tar -zxf "helm-v${HELM_VERSION}-linux-amd64.tar.gz"
chmod +x linux-amd64/helm
mv linux-amd64/helm /usr/local/bin/
# helm plugin install https://github.com/lrills/helm-unittest

echo '>> Installing kubeval...'
wget https://github.com/garethr/kubeval/releases/download/${KUBEVAL_VERSION}/kubeval-linux-amd64.tar.gz 
tar xzvf kubeval-linux-amd64.tar.gz
chmod u+x kubeval
mv kubeval /usr/local/bin


echo ">> Checking out $GITHUB_PAGES_BRANCH branch from $GITHUB_PAGES_REPO"
mkdir -p /tmp/helm/publish
cd /tmp/helm/publish
mkdir -p "$HOME/.ssh"
ssh-keyscan -H github.com >> "$HOME/.ssh/known_hosts"
git clone -b "$GITHUB_PAGES_BRANCH" "git@github.com:$GITHUB_PAGES_REPO.git" .

echo '>> Building charts...'
find "$HELM_CHARTS_SOURCE" -mindepth 1 -maxdepth 1 -type d | while read chart; do
  echo ">>> helm lint $chart"
  helm lint "$chart"

  echo ">>> kubeval $chart"
  /root/project/.circleci/prep-kubeval.sh
  mkdir -p "/tmp/kubeval/manifests/$chart_name"
  helm dep update $chart
  helm template $chart --output-dir "/tmp/kubeval/manifests/$chart_name"
  kubeval -d "/tmp/kubeval/manifests/$chart_name"
 
  #echo ">>> unittest $chart"
  #/root/project/.circleci/prep-unit-tests.sh  
  #helm unittest $chart 

  chart_name="`basename "$chart"`"
  echo ">>> helm package -d $chart_name $chart"
  mkdir -p "$chart_name"
  helm package -d "$chart_name" "$chart"
done
echo '>>> helm repo index'
helm repo index .

if [ "$CIRCLE_BRANCH" != "master" ]; then
  echo "Current branch is not master and do not publish"
  exit 0
fi

echo ">> Publishing to $GITHUB_PAGES_BRANCH branch of $GITHUB_PAGES_REPO"
git config user.email "$CIRCLE_USERNAME@users.noreply.github.com"
git config user.name "Circle CI"
git add .
git status
git commit -m "Published by Circle CI $CIRCLE_BUILD_URL"
git push origin "$GITHUB_PAGES_BRANCH"
