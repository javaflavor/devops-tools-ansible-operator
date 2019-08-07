#!/bin/sh -v

IMAGE=docker-registry-default.apps.7c01.example.opentlc.com/openshift/devops-tools-operator
TAG=v0.0.2

operator-sdk build ${IMAGE}:${TAG}

docker push ${IMAGE}:${TAG}

oc tag openshift/devops-tools-operator:${TAG} openshift/devops-tools-operator:latest

