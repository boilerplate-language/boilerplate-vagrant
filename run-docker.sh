#!/bin/bash

pushd docker/$1
  . .env
  TAG=$TARGET_OS-local

  docker build . -t $TAG
  docker run -it --rm \
    -v $(pwd)/../../_share:/share:rw \
    -v $(pwd)/.env:/.env:rw \
    $TAG /bin/bash
popd
