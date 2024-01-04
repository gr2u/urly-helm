{{- define "urly.api-server" -}}
    {{- printf "%s-api-server" (include "urly.fullname" .) -}}
{{- end -}}

{{- define "urly.api-server.labels" -}}
{{ include "urly.labels" . }}
app.kubernetes.io/component: api-server
app.kubernetes.io/tier: backend
{{- end -}}

{{- define "urly.api-server.appHost" -}}
    {{- .Values.urlyApiServer.appHost -}}
{{- end -}}

