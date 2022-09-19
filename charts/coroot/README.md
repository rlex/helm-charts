# coroot

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.2.2](https://img.shields.io/badge/AppVersion-0.2.2-informational?style=flat-square)

A monitoring and troubleshooting tool for microservice architectures.

## Prometheus settings
Pyrra needs prometheus to work. You will need to specify that via prometheusUrl variable - default assumes you have default [kube-prometheus-stack](https://github.com/prometheus-community/helm-charts/tree/main/charts/kube-prometheus-stack) deployed to "monitoring" namespace.
Additionaly, you (most likely) will need to specify prometheusExternalUrl with URL to public-facing prometheus UI (ingress or whatever you're using), otherwise pyrra links to graphs will be broken

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | affinity for scheduling pods |
| fullnameOverride | string | `""` | Overrides helm-generated chart fullname |
| image.pullPolicy | string | `"IfNotPresent"` | Overrides pullpolicy |
| image.repository | string | `"ghcr.io/coroot/coroot"` | Overrides the image repository |
| image.tag | string | `"0.2.2"` | Overrides the image tag |
| imagePullSecrets | list | `[]` | specifies pull secrets for image repository |
| ingress.annotations | object | `{}` | additional annotations for ingress |
| ingress.className | string | `""` | specifies ingress class name (ie nginx) |
| ingress.enabled | bool | `false` | enables ingress for server UI |
| ingress.hosts | list | `[{"host":"chart-example.local","paths":[{"path":"/","pathType":"ImplementationSpecific"}]}]` | hosts for ingress |
| ingress.tls | list | `[]` | tls configuration for ingress |
| nameOverride | string | `""` | overrides chart name |
| nodeSelector | object | `{}` | node selector for scheduling pods |
| persistence.annotations | object | `{}` | pvc annotations |
| persistence.enabled | bool | `false` | enables persistence for coroot |
| persistence.size | string | `"1Gi"` | size of PV to request |
| persistence.storageClassName | string | `""` | storage class name |
| podAnnotations | object | `{}` | Additional annotations for pods |
| podSecurityContext | object | `{}` | Additional pod security context |
| replicaCount | int | `1` |  |
| resources | object | `{}` | resource limits and requests |
| securityContext | object | `{}` | Security context |
| service.port | int | `8080` | service port |
| service.type | string | `"ClusterIP"` | service type |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |
| tolerations | list | `[]` | node tolerations for scheduling pods |

## Upgrading

A major chart version change indicates that there is an incompatible breaking change needing manual actions.