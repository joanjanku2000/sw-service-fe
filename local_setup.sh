#!/bin/bash

docker build -f Dockerfile.local -t fe-app .
docker run -p 4200:4200 -d fe-app


