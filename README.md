# DevOps Toolset Ansible Operator

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
$ oc create -f toolset-crs.yaml
```

Undeploy apps.

```bash
$ oc delete -f toolset-crs.yaml
```

Undeploy Operator.

```bash
$ oc process -f deploy.yaml | oc delete -f -
```
