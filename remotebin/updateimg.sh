#!/bin/bash
app=$1
version=$2
environ=$3

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
echo "[DEBUG] Estou no updateimg ${app} / ${environ} / ${SCRIPTPATH}"
echo $PATH
source $SCRIPTPATH/common.sh
source_env_app $app $environ

set -e
server_login
dkpull $app $version $environ
#$SCRIPTPATH/pullconfig.sh $app $environ