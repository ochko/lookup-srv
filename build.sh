#!/bin/bash

docker run --rm -v "$PWD":/usr/src/lookup-srv -w /usr/src/lookup-srv golang:1.8 go build -v \
    && mv lookup-srv lookup-srv-linux-amd64
