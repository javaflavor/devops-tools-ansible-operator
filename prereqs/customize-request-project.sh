#!/bin/sh -v
BASEDIR=$(dirname $0)

# Create project-request template, if any.
oc get template/project-request -n openshift-config 2>/dev/null || \
    oc adm create-bootstrap-project-template -o yaml | oc create -f - -n openshift-config

# Patch project-request template.
if [ $(oc get template/project-request -n openshift-config -o yaml | grep 'name: che-workspace-admin' | wc -l) == 0 ]; then
    oc patch template/project-request -n openshift-config \
        --type='json' \
        -p="$(cat ${BASEDIR}/project-request-patch.yaml)"
fi

# Patch project config CR.
oc patch project.config.openshift.io/cluster \
    --type=merge \
    -p '{"spec":{"projectRequestTemplate":{"name":"project-request"}}}'
