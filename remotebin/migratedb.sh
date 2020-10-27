#!/bin/bash
app=$1
version=$2
environ=$3

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
source $SCRIPTPATH/common.sh
source_app_env $app $environ

dkmigratedb(){
    containername=${app}_${environ}_migratedb
    image=$app:$environ
    envfile=~/${app}.env
    docker run --rm --name=$containername --env-file=$envfile $image migratedb.sh
    exitcode=$?
    return $exitcode
}

set -e
dkpull $app $version $environ
dkmigratedb
