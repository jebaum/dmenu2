#!/bin/bash

make clean
make debug
if [ "$#" != "0" ]; then
    "$@"
else
    if hash locate 2>/dev/null; then
        locate "" | ./dmenu -s -centerx -centery -w 500 -l 20
    else
        ls -R /bin | ./dmenu -s -centerx -centery -w 500 -l 20
    fi
fi


gprof -l ./dmenu gmon.out > gprof_latest
rm gmon.out
less gprof_latest
