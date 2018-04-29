#!/bin/bash
#
# Build the server and client component

set -eu

pushd client
npm install
popd

pushd server
mvn clean package -B
popd
