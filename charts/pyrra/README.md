# pyrra

![Version: 0.3.1](https://img.shields.io/badge/Version-0.3.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.6.0](https://img.shields.io/badge/AppVersion-0.6.0-informational?style=flat-square)

SLO manager and alert generator

## Prometheus settings
Pyrra needs prometheus to work. You will need to specify that via prometheusUrl variable - default assumes you have default [kube-prometheus-stack](https://github.com/prometheus-community/helm-charts/tree/main/charts/kube-prometheus-stack) deployed to "monitoring" namespace.
Additionaly, you (most likely) will need to specify prometheusExternalUrl with URL to public-facing prometheus UI (ingress or whatever you're using), otherwise pyrra links to graphs will be broken

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| fullnameOverride | string | `""` | Overrides helm-generated chart fullname |
| genericRuler.enabled | boolean | `false` | Generats Pyrra generic recording rules |
| image.pullPolicy | string | `"IfNotPresent"` | Overrides pullpolicy |
| image.repository | string | `"ghcr.io/pyrra-dev/pyrra"` | Overrides the image repository |
| image.tag | string | `"v0.5.0"` | Overrides the image tag |
| imagePullSecrets | list | `[]` | specifies pull secrets for image repository |
| ingress.annotations | object | `{}` | additional annotations for ingress |
| ingress.className | string | `""` | specifies ingress class name (ie nginx) |
| ingress.enabled | bool | `false` | enables ingress for server UI |
| ingress.hosts[0].host | string | `"chart-example.local"` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| ingress.tls | list | `[]` |  |
| nameOverride | string | `""` | overrides chart name |
| nodeSelector | object | `{}` | node selector for scheduling server pod |
| podAnnotations | object | `{}` | additional annotations for server pod |
| podSecurityContext | object | `{}` | additional security context for server pod |
| prometheusExternalUrl | string | `""` | url to public-facing prometheus UI in case it differs from prometheusUrl |
| prometheusUrl | string | `"http://prometheus-operated.monitoring.svc.cluster.local:9090"` | url to prometheus instance with metrics |
| resources | object | `{"limits":{"cpu":"100m","memory":"30Mi"},"requests":{"cpu":"100m","memory":"20Mi"}}` | resource limits and requests for server pod |
| securityContext | object | `{}` | additional security context for server |
| service.nodePort | string | `""` | node port for HTTP, choose port between <30000-32767> |
| service.port | int | `9099` | service port for server |
| service.type | string | `"ClusterIP"` | service type for server |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | If not set and create is true, a name is generated using the fullname template |
| serviceMonitor.enabled | bool | `false` | enables servicemonitor for server monitoring |
| tolerations | object | `{}` | tolerations for scheduling server pod |

## Upgrading

A major chart version change indicates that there is an incompatible breaking change needing manual actions.