#!/bin/bash
SCRIPT_DIR="${0%/*}"
CONFIG_LOCATION="$(realpath ${SCRIPT_DIR})/config"
USERID=$(id -u)
GROUPID=$(id -g)

if [[ ! -f "${CONFIG_LOCATION}/praw.ini" ]]; then
    if [[ ! -d "${CONFIG_LOCATION}" ]]; then
        mkdir "${CONFIG_LOCATION}"
    fi
    docker run -u ${USERID}:${GROUPID} -v "${CONFIG_LOCATION}":/shreddit phenix66/shredditdocker:latest -g
    echo "Configuration files created. Add auth info to praw.ini and re-run"
else
    docker run -v "${CONFIG_LOCATION}":/shreddit phenix66/shredditdocker:latest
fi