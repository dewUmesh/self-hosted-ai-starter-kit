#!/bin/bash
# Run all services using docker-compose

docker-compose --profile cpu up -d --build
