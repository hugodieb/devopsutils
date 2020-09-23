#!/bin/bash
host=$1

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
source $SCRIPTPATH/common.sh

set -e
ssh -o StrictHostKeyChecking=no $host mkdir -p devopsutils
rsync -L -av $SCRIPTPATH/../ $host:./devopsutils/
if [ -d ~/.devopsutils ]; then
    rsync -av ~/.devopsutils $host:./
fi