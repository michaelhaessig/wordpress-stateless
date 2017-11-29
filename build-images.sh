#!/bin/bash
set -e

if [ $# -eq 0 ]; then
  echo 1>&2 "$0 <version>"
  exit
fi

VERSION="wp-$1"

echo "Building Version: $VERSION"

IMAGE_BASE=wp-stateless-base
IMAGE_CLI=wp-stateless-cli
IMAGE_NGINX=wp-stateless-nginx

cd base

docker build -t $IMAGE_BASE:$VERSION .

# sed needs backup file to work on osx

cd ../cli
sed -i'.bak' "s/$IMAGE_BASE:.*/$IMAGE_BASE:$VERSION/" Dockerfile
docker build -t $IMAGE_CLI:$VERSION .

cd ../nginx
sed -i'.bak' "s/$IMAGE_CLI:.*/$IMAGE_CLI:$VERSION/" Dockerfile
docker build -t $IMAGE_NGINX:$VERSION .

echo "Done"
