#!/bin/bash

set -e

rm -f /var/run/apache2/apache2.pid

exec apache2 -D FOREGROUND
