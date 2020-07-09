### prometheus-webhook-dingtalk

```
helm repo add rlex https://rlex.github.io/helm-charts/
helm install prometheus-webhook-dingtalk rlex/prometheus-webhook-dingtalk
```

Sample values for setting up dingtalk endpoint:
```
prometheus_webhook_dingtalk:
  config:
    targets:
      targets:
        webhook3:
          url: https://oapi.dingtalk.com/robot/send?access_token=_token__
          secret: _secret_
```