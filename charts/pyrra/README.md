# pyrra

Depreacted: The Helm chart was moved to https://github.com/pyrra-dev/helm-charts. Please open issues there.

![Version: 0.15.0](https://img.shields.io/badge/Version-0.15.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v0.8.1](https://img.shields.io/badge/AppVersion-v0.8.1-informational?style=flat-square)

SLO manager and alert generator

## Prometheus settings
Pyrra needs prometheus to work. You will need to specify that via prometheusUrl variable - default assumes you have default [kube-prometheus-stack](https://github.com/prometheus-community/helm-charts/tree/main/charts/kube-prometheus-stack) deployed to "monitoring" namespace.
Additionaly, you (most likely) will need to specify prometheusExternalUrl with URL to public-facing prometheus UI (ingress or whatever you're using), otherwise pyrra links to graphs will be broken

## Webhook Admissions Controller Validations (Optional)
Pyrra can be configured to validate SLOs and SLO groups using a webhook admission controller. This is an optional feature that can be enabled by setting the `validatingWebhookConfiguration.enabled` value to `true`. The webhook admission controller will validate SLOs when they are created or updated.
If the SLO object is invalid, the admission controller will reject the request and provide a reason for the failure. This requires cert-manager to be installed in the cluster. If cert-manager is not installed, the webhook admission controller will not be created.

## Grafana dashboards
Pyrra provides Grafana dashboards additionally to it's own UI.
The dashboards can be deployed using a ConfigMap and get's automatically [reloaded by a Grafana sidecar](https://github.com/grafana/helm-charts/tree/main/charts/grafana#sidecar-for-dashboards).

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| additionalLabels | object | `{}` |  |
| dashboards.annotations | object | `{}` |  |
| dashboards.enabled | bool | `false` | enables Grafana dashboards being deployed via configmap |
| dashboards.extraLabels | object | `{}` |  |
| dashboards.label | string | `"grafana_dashboard"` | default value from the Grafana chart |
| dashboards.labelValue | string | `"1"` | default value from the Grafana chart |
| dashboards.namespace | string | `nil` |  |
| extraApiArgs | list | `[]` | Extra args for Pyrra's API container |
| extraKubernetesArgs | list | `[]` | Extra args for Pyrra's Kubernetes container |
| fullnameOverride | string | `""` | Overrides helm-generated chart fullname |
| genericRules.enabled | bool | `false` | enables generate Pyrra generic recording rules. Pyrra generates metrics with the same name for each SLO. |
| image.pullPolicy | string | `"IfNotPresent"` | Overrides pullpolicy |
| image.repository | string | `"ghcr.io/pyrra-dev/pyrra"` | Overrides the image repository |
| image.tag | string | `"v0.8.1"` | Overrides the image tag |
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
| operatorMetricsAddress | string | `":8080"` | Address to expose operator metrics |
| podAnnotations | object | `{}` | additional annotations for server pod |
| podSecurityContext | object | `{}` | additional security context for server pod |
| prometheusExternalUrl | string | `""` | url to public-facing prometheus UI in case it differs from prometheusUrl |
| prometheusRule.enabled | bool | `false` | enables creation of PrometheusRules to monitor Pyrra |
| prometheusRule.labels | object | `{}` | Set labels that will be applied on all PrometheusRules (alerts) |
| prometheusRule.pyrraReconciliationError.severity | string | `"warning"` | Set severity for PyrraReconciliationError alert |
| prometheusUrl | string | `"http://prometheus-operated.monitoring.svc.cluster.local:9090"` | url to prometheus instance with metrics |
| resources | object | `{}` | resource limits and requests for server pod |
| routePrefix | string | `""` | Must start with a slash and not end with a slash. |
| securityContext | object | `{}` | additional security context for server |
| service.annotations | object | `{}` | Annotations to add to the service |
| service.nodePort | string | `""` | node port for HTTP, choose port between <30000-32767> |
| service.operatorMetricsPort | int | `8080` | service port for operator metrics |
| service.port | int | `9099` | service port for server |
| service.type | string | `"ClusterIP"` | service type for server |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | If not set and create is true, a name is generated using the fullname template |
| serviceMonitor.enabled | bool | `false` | enables servicemonitor for server monitoring |
| serviceMonitor.interval | string | `""` | Set interval for scraping metrics |
| serviceMonitor.jobLabel | string | `""` | provides the possibility to override the jobName if needed |
| serviceMonitor.labels | object | `{}` | Set labels for the ServiceMonitor, use this to define your scrape label for Prometheus Operator |
| serviceMonitor.metricRelabelings | list | `[]` | Set metric relabelings for the ServiceMonitor |
| serviceMonitor.relabelings | list | `[]` | Set relabelings for the ServiceMonitor |
| serviceMonitorOperator.enabled | bool | `false` | enables servicemonitor for operator monitoring |
| serviceMonitorOperator.interval | string | `""` | Set interval for scraping metrics |
| serviceMonitorOperator.jobLabel | string | `""` | provides the possibility to override the jobName if needed |
| serviceMonitorOperator.labels | object | `{}` | Set labels for the ServiceMonitor, use this to define your scrape label for Prometheus Operator |
| serviceMonitorOperator.metricRelabelings | list | `[]` | Set metric relabelings for the ServiceMonitor |
| serviceMonitorOperator.relabelings | list | `[]` | Set relabelings for the ServiceMonitor |
| tolerations | object | `{}` | tolerations for scheduling server pod |
| validatingWebhookConfiguration.enabled | bool | `false` | enables admission webhook for server to validate SLOs, this requires cert-manager to be installed |

## Upgrading

A major chart version change indicates that there is an incompatible breaking change needing manual actions.
