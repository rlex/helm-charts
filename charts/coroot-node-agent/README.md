# coroot-node-agent

![Version: 0.6.0](https://img.shields.io/badge/Version-0.6.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.7.5](https://img.shields.io/badge/AppVersion-1.7.5-informational?style=flat-square)

A Prometheus exporter based on eBPF that gathers comprehensive container metrics

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | affinity for scheduling pods |
| fullnameOverride | string | `""` | Overrides helm-generated chart fullname |
| image.pullPolicy | string | `"IfNotPresent"` | Overrides pull policy |
| image.repository | string | `"ghcr.io/coroot/coroot-node-agent"` | Overrides the image repository |
| image.tag | string | `"1.7.5"` | Overrides the image tag |
| imagePullSecrets | list | `[]` | specifies pull secrets for image repository |
| nameOverride | string | `""` | overrides chart name |
| nodeSelector | object | `{}` | node selector for scheduling pods |
| podAnnotations | object | `{}` | Additional annotations for pods |
| podMonitor.enabled | bool | `false` | enables pod monitor for prometheus-operator to scrape metrics from coroot-node-agent daemonset |
| podSecurityContext | object | `{}` | Additional pod security context |
| resources | object | `{}` | resource limits and requests |
| securityContext | object | `{"privileged":true}` | Security context. Needs privileged to scrape host metrics |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |
| tolerations | list | `[]` | node tolerations for scheduling pods |

## Upgrading

A major chart version change indicates that there is an incompatible breaking change needing manual actions.