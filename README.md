# DevOps Toolset Ansible Operator

## Supported Tools

The following list of tools is deployable from this operator.

- [Gogs](https://gogs.io)
- [Jenkins](https://jenkins.io)
- [SonarQube](https://www.sonarqube.org)
- [CodeReady Workspaces](https://developers.redhat.com/products/codeready-workspaces/overview)
- [RHAMT](https://developers.redhat.com/products/rhamt/overview)
- [PathFinder](https://github.com/redhat-cop/pathfinder)

## Tested Environemnt

The implementation is currently tested on OpenShift 3.11 and 4.1.

## Installation

### Build the operator image

At First, you must build the container image of this operator.

```bash
$ oc new-project <toolchain-project>
$ ./build.sh
```

You can find the ImageStream named `devops-tools-operator`.

```bash
$ oc get is
NAME                    DOCKER REPO                                                     TAGS     UPDATED
devops-tools-operator   docker-registry.default.svc:5000/devops/devops-tools-operator   latest   4 hours ago
```

### Deploy the operator

After successfully built the image, you can deploy thie operator.

```bash
$ ./deploy.sh
```
Check if the operator pod is running.

```bash
$ oc get pod
NAME                                     READY STATUS    RESTARTS AGE
devops-tools-operator-1-build             0/1  Completed 0        9m
devops-tools-operator-6b76ccd774-l8gxn    2/2  Running   0        33s
```

### Optional works

#### Deploy CodeReady Workspaces Operator

If you want this operator to manage deployment of CodeReady Workspaces, install the CodeReady Workspaces Operator in the same project with devops-tools-operator.

#### Customize Project Request Template

If you want to create distinct OpenShift project for each workspace, it is recommended to assign `admin` role or `edit` role to Service Account `che-workspaces`. Otherwise, any additional pods cannot be created in the workspace.

In order to automate, Project Request Template is useful. In case of OpenShift 4.1, you can use the utility sh script as follows:

```bash
$ prereqs/customize-request-project.sh
```

### Deployment of toolchain

Now you can review and customize Custom Resource `toolset-crs.yaml`. Create the CRs in the project where `devops-tools-operator` is running.

```bash
$ oc apply -f toolset-crs.yaml
```

## Uninstallation

### Undeploy toolchain

Delete all custom resources.

```bash
$ oc delete -f toolset-crs.yaml
```

### Undeploy the operator

Use the utility sh script.

```bash
$ undeploy.sh
```