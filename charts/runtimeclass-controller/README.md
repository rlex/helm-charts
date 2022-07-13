# runtimeclass-controller

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: latest](https://img.shields.io/badge/AppVersion-latest-informational?style=flat-square)

A Helm chart for Kubernetes

## Source Code

* <https://github.com/jlclx/runtimeclass-controller>
* <https://github.com/rlex/helm-charts>

## Usage

Not every helm chart, executor, operator, etc supports runtimeClassName on object specs yet. This app allows you to mutate objects based on namespace labels.
To use it, after install label your namespace with runtimeclassname-default, ie

```
kubectl label namespace example runtimeclassname-default=gvisor --overwrite
```

And deploy your app

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | affinity for scheduling pods |
| autoscaling.enabled | bool | `false` |  |
| autoscaling.maxReplicas | int | `100` |  |
| autoscaling.minReplicas | int | `1` |  |
| autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| fullnameOverride | string | `""` | Overrides helm-generated chart fullname |
| image.pullPolicy | string | `"IfNotPresent"` | Image pull policy |
| image.repository | string | `"ghcr.io/jlclx/runtimeclass-controller"` | Image repository |
| image.tag | string | `"latest"` | Overrides the image tag whose default is the chart appVersion. |
| imagePullSecrets | list | `[]` | specifies pull secrets for image repository |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `""` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0].host | string | `"chart-example.local"` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| ingress.tls | list | `[]` |  |
| nameOverride | string | `""` | overrides chart name |
| nodeSelector | object | `{}` | node selector for scheduling pods |
| podAnnotations | object | `{}` | annotations for pod |
| podSecurityContext | object | `{}` | security context for pod |
| replicaCount | int | `1` | Amount of replicas to run |
| resources | object | `{"limits":{"cpu":"100m","memory":"128Mi"},"requests":{"cpu":"100m","memory":"128Mi"}}` | resource limits and requests |
| securityContext | object | `{}` | security context for pod |
| service.port | int | `443` | service port |
| service.type | string | `"ClusterIP"` | service type |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |
| tls.autogenerate | bool | `true` | Generate certs with helm |
| tls.certManagerIssuerRef | object | `{}` | Specifies cert-manager issuer ref |
| tls.certificateSecret | string | `""` | Specified if secret is pre-generated |
| tls.renew | bool | `false` | Set to renew certs |
| tolerations | list | `[]` | tolerations for scheduling pods |

## Upgrading

A major chart version change indicates that there is an incompatible breaking change needing manual actions.