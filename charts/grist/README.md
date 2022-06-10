# grist

Work in progress, only basic features supported ATM

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.7.9](https://img.shields.io/badge/AppVersion-0.7.9-informational?style=flat-square)

Combine the flexibility of a spreadsheet with the robustness of a database to organize your data, your way.

### Usage

**Please read: this chart will not work with default settings!**

Due to how grist works, it needs proper URL setting. URL set in grist.url should be same as public-facing URL of Grist (ingress, etc). At minimum, you will need to set
```
grist:
  url: https://grist.example.org

ingress:
  enabled: true
  className: nginx
  hosts:
    - host: grist.example.org
      paths:
        - path: /
          pathType: ImplementationSpecific
```

Otherwise, grist will call it's API via non-existent URLs.

### Configuration

Use extraEnv variable to configure grist, full list of available variables [can be found here](https://github.com/gristlabs/grist-core#environment-variables)

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| autoscaling.enabled | bool | `false` |  |
| autoscaling.maxReplicas | int | `100` |  |
| autoscaling.minReplicas | int | `1` |  |
| autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| fullnameOverride | string | `""` |  |
| grist.url | string | `"https://example.local"` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"gristlabs/grist"` |  |
| image.tag | string | `"0.7.9"` |  |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `""` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0].host | string | `"example.local"` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| ingress.tls | list | `[]` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| persistence.annotations | object | `{}` |  |
| persistence.enabled | bool | `false` |  |
| persistence.existingClaim | string | `""` |  |
| persistence.size | string | `"1Gi"` |  |
| persistence.storageClassName | string | `""` |  |
| podAnnotations | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| securityContext | object | `{}` |  |
| service.port | int | `80` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| tolerations | list | `[]` |  |

## Upgrading

A major chart version change indicates that there is an incompatible breaking change needing manual actions.