#!/bin/sh
BASEDIR=$(dirname $0)

PROJECT=$(oc project -q)
if [ "x${PROJECT}" == "x" ]; then
    echo "Not set target project. Use: oc project <devops-project>."
fi

oc process -f ${BASEDIR}/deploy.yaml \
    -p DEVOPS_NAMESPACE=${PROJECT} \
    | oc delete -f -
