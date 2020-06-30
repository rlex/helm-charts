### FreeTAKServer

Helm chart for freetakserver. WIP, since upstream project is WIP too. Take a look at values.yaml to get the idea of what's going on

Should be enough to run 
```
helm repo add rlex https://rlex.github.io/helm-charts/
helm install freetakserver rlex/freetakserver
```

However, if your pod have private IP, you need to specify external, public-facing IP (loadbalancer, etc) with 

```
helm install freetakserver rlex/freetakserver --set freetakserver.datapackage_server_ip=1.2.3.4
```
