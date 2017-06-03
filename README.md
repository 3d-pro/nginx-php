# Nginx Mainline /w PHP 7.1 [![Build Status](https://travis-ci.org/3d-pro/nginx-php.svg?branch=master)](https://travis-ci.org/3d-pro/nginx-php)

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
