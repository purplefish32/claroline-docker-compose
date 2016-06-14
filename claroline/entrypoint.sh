#!/bin/bash

rm -rf /var/www/html/claroline/app/cache/*
/bin/bash -l -c "$*"
