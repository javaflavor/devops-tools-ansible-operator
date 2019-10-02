#!/bin/sh
BASEDIR=$(dirname $0)

PROJECT=$(oc project -q)
if [ "x${PROJECT}" == "x" ]; then
    echo "Not set target project. Use: oc project <devops-project>."
fi

IMAGE_REGISTRY=$(oc get is devops-tools-operator --no-headers | awk '{print $2}')
if [ "x${IMAGE_REGISTRY}" == "x" ]; then
    echo "Not found ImageStream devops-tools-ansible-operator. Please build operator image using build.sh."
fi

oc process -f ${BASEDIR}/deploy.yaml \
    -p DEVOPS_NAMESPACE=${PROJECT} \
    -p OPERATOR_IMAGE_REGISTORY=${IMAGE_REGISTRY} | oc apply -f -