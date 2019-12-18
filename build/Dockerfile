FROM quay.io/operator-framework/ansible-operator:v0.13.0

USER root

ENV OC_VERSION=4.1.18

RUN curl -o openshift-client-linux-${OC_VERSION}.tar.gz https://mirror.openshift.com/pub/openshift-v4/clients/ocp/${OC_VERSION}/openshift-client-linux-${OC_VERSION}.tar.gz \
    && tar zxvf openshift-client-linux-${OC_VERSION}.tar.gz -C /usr/bin \
    && rm -f openshift-client-linux-${OC_VERSION}.tar.gz \
    && chmod +x /usr/bin/oc

USER 1001

COPY watches.yaml ${HOME}/watches.yaml

COPY roles/ ${HOME}/roles/
COPY playbooks/* ${HOME}/

