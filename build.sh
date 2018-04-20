#!/bin/bash
#
# Build the server and client component

set -eu

pushd client
npm install
popd

mkdir server/src/main/resources/public
cp -r client/app/* server/src/main/resources/public

pushd server
mvn package -B
popd
