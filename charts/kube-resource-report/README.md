# kube-resource-report

![Version: 0.7.9](https://img.shields.io/badge/Version-0.7.9-informational?style=flat-square) ![AppVersion: 22.8.0](https://img.shields.io/badge/AppVersion-22.8.0-informational?style=flat-square)

Report Kubernetes cluster and pod resource requests vs usage and generate static HTML

Forked from [official but unsupported chart](https://codeberg.org/hjacobs/kube-resource-report/src/branch/main/unsupported/chart/kube-resource-report) with some fixes

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| additionalCostPerCluster | int | `0` |  |
| affinity | object | `{}` |  |
| container.port | int | `8080` |  |
| container.portName | string | `"http"` |  |
| container.portProtocol | string | `"TCP"` |  |
| customArgs | list | `[]` |  |
| customLinks.data | string | `"team:\n- href: \"https://people.mycorp.example.org/search?q=team:{id}\"\n  title: \"Search team {id} on people.mycorp\"\n  icon: search\n"` |  |
| customLinks.enabled | bool | `false` |  |
| env | object | `{}` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"hjacobs/kube-resource-report"` |  |
| image.tag | string | `"22.8.0"` |  |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `""` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0].host | string | `"chart-example.local"` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| ingress.tls | list | `[]` |  |
| nameOverride | string | `""` |  |
| nginx.image.repository | string | `"nginx"` |  |
| nginx.image.tag | string | `"alpine"` |  |
| nodeSelector | object | `{}` |  |
| pricing.data | string | `"dc-1,master,30.000\ndc-1,worker,500.000\n"` |  |
| pricing.enabled | bool | `false` |  |
| rbac.create | bool | `true` |  |
| replicaCount | int | `1` |  |
| resourcesApp.limits.memory | string | `"100Mi"` |  |
| resourcesApp.requests.cpu | string | `"5m"` |  |
| resourcesApp.requests.memory | string | `"50Mi"` |  |
| resourcesNginx.limits.memory | string | `"50Mi"` |  |
| resourcesNginx.requests.cpu | string | `"5m"` |  |
| resourcesNginx.requests.memory | string | `"20Mi"` |  |
| service.port | int | `80` |  |
| service.portName | string | `"http"` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `nil` |  |
| tolerations | list | `[]` |  |
| updateInterval | int | `1` |  |

## Upgrading

A major chart version change indicates that there is an incompatible breaking change needing manual actions.