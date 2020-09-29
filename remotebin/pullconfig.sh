#!/bin/bash
app=$1
environ=$2

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
source $SCRIPTPATH/common.sh
source_app_env $app $environ

set -e
scp -o StrictHostKeyChecking=no -i ~/.ssh/cfgstore.pem -r  "$CFGSTORE_HOST:configstore/${app}_${environ}/*" ~/
echo "pullconfig baixou configuracoes de $CFGSTORE_HOST:configstore/${app}_${environ}"
