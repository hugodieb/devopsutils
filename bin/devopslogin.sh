app=$1
environ=$2

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
source $SCRIPTPATH/common.sh
source_app_env $app $environ

echo "Estou no devopslogin"

set -e
# dklogin