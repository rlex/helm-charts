[flame homepage](https://github.com/pawelmalak/flame)

**Full readme TBD**

Helm chart for flame "server startpage"

Please note that flame stores settings in sqlite database and with default settings (persistance.enabled: false) it will lose all settings after pod restart

**Please note that by default flame will use password "password", please edit flame.password variable with your preferred password or upload secret with key PASSWORD and use flame.existingSecret to point flame to that secret**

Chart supports flame ingress discovery, you will need to enable kubernetes integration in settings (cog icon in lower left corner, "Other" setting menu) and add following annotations to your ingresses:
```yaml
- flame.pawelmalak/type=application # "app" works too
- flame.pawelmalak/name=My container
- flame.pawelmalak/url=https://example.com
- flame.pawelmalak/icon=icon-name # Optional, default is "kubernetes"
```

Sample values file, with ingress and persistence enabled with longhorn storageClass:
```yaml
ingress:
  enabled: true
  hosts:
    - host: flame.example.com
      paths:
        - path: /
          pathType: Prefix
  annotations:
    kubernetes.io/ingress.class: "nginx"
persistence:
  enabled: true
  size: 1Gi
  storageClassName: longhorn
flame:
  password: password
```