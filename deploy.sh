#!/usr/bin/env bash
docker build -t frontend_test . \
&& docker stack deploy --compose-file docker-compose.yml app
