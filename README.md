# Ansible Operator

Build Operator Image.

```bash
$ operator-sdk build docker-registry-default.apps.example.com/openshift/devops-tools-operator:v0.0.1
```

Push Operator Image.

```bash
$ docker push docker-registry-default.apps.example.com/openshift/devops-tools-operator:v0.0.1
```

Deploy Operator.

```bash
$ oc process -f deploy.yaml | oc create -f -
```

Create Custom Resource (CR) and start apps.

```bash
$ oc create -f cr.yaml
```

Undeploy apps.

```bash
$ oc delete -f cr.yaml
```

Undeploy Operator.

```bash
$ oc process -f deploy.yaml | oc delete -f -
```
