#!/bin/sh -v
BASEDIR=$(dirname $0)

oc new-build --name=devops-tools-operator --binary --strategy=docker
oc patch bc/devops-tools-operator -p '{"spec":{"strategy":{"dockerStrategy":{"dockerfilePath":"build/Dockerfile"}}}}'
oc start-build devops-tools-operator --from-dir=${BASEDIR} --follow
