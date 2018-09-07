#!/usr/bin/env bash
# https://github.com/kojiromike/inception/blob/master/dinception
##
# Set this to the nesting level you want.
n="${n:- 0}"

##
# The dind image
dind="${dind:-cheshirecode/dind-with-compose}"

isDind="${isDind:-}"

##
# Run a docker command by arbitrarily nesting dind
# until I get bored and finally run your command.
c=0

# Docker-outside-Docker
diveDood() {
    if (( n-- > 0 )); then
        c=$((c+1))
        echo "DooD level $c" 
        diveDood run --rm -t -v /var/run/docker.sock:/var/run/docker.sock "$dind" docker "$@"
    else
        exec docker "$@"
    fi
}

# Docker-inside-Docker
diveDind() {
    echo "not yet working, need to collect container IDs in an array, execute and clean up"
    exit 0
    if (( n-- > 0 )); then
        c=$((c+1))
        echo "DinD level $c"
        # diveDind run --rm -t --privileged=true docker:dind
    else
        exec docker "$@"
    fi
}
[[ ! -z $isDind ]] && diveDind "$@" || diveDood "$@"
