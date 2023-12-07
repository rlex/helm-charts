# k8s-resources

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

Helm chart to create any type of k8s resource

This is a very simple chart to create any type of kubernetes resources with helm.<br>
Since not every chart offers something like extraResources parameter, i use this chart to deploy some stuff along with application - for example, VerticalPodAutoscaler CRs.<br>
Example usage with all supported parameters:
```yaml
resources:
  - name: vpa-loki-ingester
    # override generated resource name
    fullnameOverride: "vpa-loki-ingester"
    # add annotations
    annotations:
      annotation: value
    # add annotations
    labels:
      some-label: value
    # apiVersion of resource
    apiVersion: autoscaling.k8s.io/v1
    # kind of resource
    kind: VerticalPodAutoscaler
    # resource spec
    spec:
      targetRef:
        apiVersion: "apps/v1"
        kind: Deployment
        name: loki-ingester
      updatePolicy:
        updateMode: "Off"
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| fullnameOverride | string | `""` | Overrides helm-generated chart fullname |
| nameOverride | string | `""` | overrides chart name |
| resources | object | `{}` | dict with user-provided resources |

## Upgrading

A major chart version change indicates that there is an incompatible breaking change needing manual actions.