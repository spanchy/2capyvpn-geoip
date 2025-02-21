#!/bin/bash

./geoip -c config-preparing.json &

wait -n

./geoip -c config-finalise.json &

wait -n

exit $?
