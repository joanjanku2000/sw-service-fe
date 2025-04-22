#!/bin/bash
docker stop fe-app
docker rm fe-app
docker build -f Dockerfile.local -t fe-app .
docker run --name fe-app -p 4200:4200 -d fe-app


