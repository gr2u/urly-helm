{{- define "urly.web-server" -}}
    {{- printf "%s-web-server" (include "urly.fullname" .) -}}
{{- end -}}


{{- define "urly.web-server.labels" -}}
{{ include "urly.labels" . }}
app.kubernetes.io/component: web-server
app.kubernetes.io/tier: frontend
{{- end -}}