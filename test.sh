#!/bin/bash
# #####
#
# Test port changes.
#
# version: 1.0
#
# #####

for portfile in `git diff --name-status master..HEAD | grep Portfile | awk '{ print $2 }'`; do

    dir_port=`dirname ${portfile}`

    echo "port lint ${dir_port}"
    port lint ${dir_port}

done
