#!/bin/bash
set -e

if [ $# -eq 0 ]; then
  echo 1>&2 "$0 <version>"
  exit
fi

VERSION="wp-$1"

echo "Building Version: $VERSION"

IMAGE_BASE=wp-statless-base
IMAGE_CLI=wp-statless-cli
IMAGE_NGINX=wp-statless-nginx

cd base

docker build -t $IMAGE_BASE:$VERSION .

cd ../cli
sed "s/$IMAGE_BASE:.*/$IMAGE_BASE:$VERSION/" -i Dockerfile
docker build -t $IMAGE_CLI:$VERSION .

cd ../nginx
sed "s/$IMAGE_BASE:.*/$IMAGE_BASE:$VERSION/" -i Dockerfile
docker build -t $IMAGE_NGINX:$VERSION .

echo "Done"
