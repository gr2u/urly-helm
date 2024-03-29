# urly

![Version: 1.0.15](https://img.shields.io/badge/Version-1.0.15-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.0.1](https://img.shields.io/badge/AppVersion-0.0.1-informational?style=flat-square)

A Helm chart for urly app

**Homepage:** <https://github.com/gr2u/urly-helm>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| cloudProvider | string | `"gcp"` | Cloud provider type (e.g., gcp, aws, azure) This parameter specifies which cloud provider to use; different providers use different settings for the Ingress controller. |
| fullnameOverride | string | `""` | Override the full name of the chart |
| gcp.annotations."cert-manager.io/issuer" | string | `"letsencrypt-production"` | Cert issuer |
| gcp.annotations."kubernetes.io/ingress.allow-http" | string | `"true"` |  |
| gcp.annotations."kubernetes.io/ingress.class" | string | `"gce"` | Using google ingress controller  |
| gcp.annotations."kubernetes.io/ingress.global-static-ip-name" | string | `"ingress-ip"` | Static IP name to use with ingress  |
| imagePullSecrets[0] | object | `{"name":"ghcr"}` | List of secret names to use for pulling images |
| mysql.annotations | object | `{}` |  |
| mysql.password | string | `""` | Password for the MySQL user |
| mysql.pullPolicy | string | `"IfNotPresent"` | Image pull policy for MySQL |
| mysql.rootPassword | string | `""` | Root password for MySQL |
| mysql.username | string | `""` | Username for MySQL |
| nameOverride | string | `""` | Override the name of the chart |
| redis.password | string | `""` | Password for Redis  |
| redis.pullPolicy | string | `"IfNotPresent"` | Image pull policy for Redis |
| urlyApiServer.appHost | string | `"gr2u.xyz"` | ingress host name and app_host for short url prefix hostname |
| urlyApiServer.image.pullPolicy | string | `"IfNotPresent"` | Image pull policy for the API server |
| urlyApiServer.image.repository | string | `"ghcr.io/gr2u/url-cut-api-server"` | API server image repository |
| urlyApiServer.image.tag | string | `"0.0.25-dev"` | API server image tag |
| urlyApiServer.replicas | int | `3` | Number of replicas for the API server |
| urlyWebServer.image.repository | string | `"ghcr.io/gr2u/url-cut-web-server"` | web server repo |
| urlyWebServer.image.tag | string | `"0.0.25-dev"` | web server  image tag |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.7.0](https://github.com/norwoodj/helm-docs/releases/v1.7.0)
