# yopass

![Version: 0.7.0](https://img.shields.io/badge/Version-0.7.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 11.5.1](https://img.shields.io/badge/AppVersion-11.5.1-informational?style=flat-square)

Secure sharing for secrets, passwords and files

## Source Code

* <https://github.com/rlex/helm-charts>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | memcached | 6.5.2 |
| https://charts.bitnami.com/bitnami | redis | 17.11.3 |

## Usage
Yopass supports redis and memcached databases. Which one it uses is controlled by yopass.database value 
By default, it will be deployed with memcached database (managed by bitnami/memcached subchart) 
If you want to use redis, set redis.enabled to "true', memcached.enabled to "false" and yopass.database to 'redis" 
You can also use redis or memcached instance not managed by this chart by setting both redis.enabled and memcached.enabled to "false" and using yopass redisUrl / yopass.memcachedUrl to point to database of your choice 
You can also customize redis and memcached subcharts by using redis and memcached values provided by bitnami/redis and bitnami/memcached charts 
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
| image.repository | string | `"jhaals/yopass"` | Image repository |
| image.tag | string | `"11.5.0"` | Overrides the image tag whose default is the chart appVersion. |
| imagePullSecrets | list | `[]` | specifies pull secrets for image repository |
| ingress.annotations | object | `{}` | additional annotations for ingress |
| ingress.className | string | `""` | specifies ingress class name (ie nginx) |
| ingress.enabled | bool | `false` | enables ingress |
| ingress.hosts[0].host | string | `"chart-example.local"` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| ingress.tls | list | `[]` |  |
| memcached.architecture | string | `"standalone"` | Memcached architecture. Allowed values: standalone or high-availability |
| memcached.enabled | bool | `true` | Enables memcached deployment with bitnami/memcached subchart |
| memcached.metrics.enabled | bool | `false` | enable memcached-exporter sidecard |
| memcached.metrics.serviceMonitor.enabled | bool | `false` | enable ServiceMonitor |
| memcached.persistence.accessModes | list | `["ReadWriteOnce"]` | Persistent Volume Access Mode |
| memcached.persistence.annotations | object | `{}` | Persistent Volume Claim annotations |
| memcached.persistence.enabled | bool | `false` | Enable persistence using PVC (Requires architecture: "high-availability") |
| memcached.persistence.size | string | `"8Gi"` | PVC Storage Request for Memcached volume |
| memcached.persistence.storageClass | string | `""` | PVC Storage Class for Memcached volume |
| nameOverride | string | `""` | overrides chart name |
| nodeSelector | object | `{}` | node selector for scheduling pods |
| podAnnotations | object | `{}` | annotations for pod |
| podSecurityContext | object | `{}` | security context for pod |
| redis.architecture | string | `"standalone"` | Memcached architecture. Allowed values: standalone or high-availability |
| redis.auth.enabled | bool | `false` | Enable password authentication. Disabled for now. |
| redis.enabled | bool | `false` | Enables redis deployment with bitnami/redis subchart |
| redis.master.persistence.accessModes | list | `["ReadWriteOnce"]` | Persistent Volume Access Mode |
| redis.master.persistence.annotations | object | `{}` | Persistent Volume Claim annotations |
| redis.master.persistence.enabled | bool | `false` | Enable persistence using PVC (Requires architecture: "high-availability") |
| redis.master.persistence.size | string | `"8Gi"` | PVC Storage Request for Memcached volume |
| redis.master.persistence.storageClass | string | `""` | PVC Storage Class for Memcached volume |
| redis.metrics.enabled | bool | `false` | enable memcached-exporter sidecard |
| redis.metrics.serviceMonitor.enabled | bool | `false` | enable ServiceMonitor |
| replicaCount | int | `1` | Amount of replicas to run |
| resources | object | `{"limits":{"cpu":"100m","memory":"128Mi"},"requests":{"cpu":"100m","memory":"128Mi"}}` | resource limits and requests |
| securityContext | object | `{}` | security context for pod |
| service.annotations | object | `{}` | additional annotations for service |
| service.port | int | `1337` | service port |
| service.type | string | `"ClusterIP"` | service type |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |
| tolerations | list | `[]` | tolerations for scheduling pods |
| yopass.database | string | `"memcached"` | database backend, memcached or redis |
| yopass.forceOnetimeSecrets | bool | `false` | reject non onetime secrets from being created |
| yopass.maxLength | int | `10000` | max length of secret |
| yopass.memcachedUrl | string | `"yopass-memcached:11211"` | memcached url. Default assumes default memcached settings |
| yopass.metrics.enabled | bool | `false` | enables yopass metrics |
| yopass.metrics.serviceMonitor.enabled | bool | `false` | enables yopass serviceMonitor. Requires metrics enabled |
| yopass.redisUrl | string | `"redis://yopass-redis-master:6379/0"` | redis url. Default assumes default redis settings |

## Upgrading

A major chart version change indicates that there is an incompatible breaking change needing manual actions.