# Nginx Stable /w PHP 8.1 [![Build Status](https://github.com/3d-pro/nginx-php/actions/workflows/docker-build.yaml/badge.svg)](https://github.com/3d-pro/nginx-php/actions)

## Required Docker Images
- nginx

## Build
```
  docker build -t nginx-php:latest .
```
## Run
```
  docker run -d -p 8080:80 -p 4433:443 -h nginx-php --name nginx nginx-php:latest
```
