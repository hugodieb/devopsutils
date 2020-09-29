#!/bin/bash
app=$1
version=$2
environ=$3

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
source $SCRIPTPATH/common.sh
source_app_env $app $environ

set -e
server_login
dkpull $app $version $environ
$SCRIPTPATH/pullconfig.sh $app $environ