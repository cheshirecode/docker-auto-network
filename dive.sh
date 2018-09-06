#!/usr/bin/env bash
# https://github.com/kojiromike/inception/blob/master/dinception
##
# Set this to the nesting level you want.
n="${n:- 0}"

##
# The dind image
dind="${dind:- 'cheshirecode/dind-with-compose'}"

##
# Run a docker command by arbitrarily nesting dind
# until I get bored and finally run your command.
c=0
dive() {
    if (( n-- > 0 )); then
        c=$((c+1))
        echo "$dind - level $c" 
        dive run --rm -it -v /var/run/docker.sock:/var/run/docker.sock --privileged=true "$dind" docker "$@"
    else
        exec docker "$@"
    fi
}

dive "$@"