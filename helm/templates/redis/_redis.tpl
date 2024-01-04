
{{- define "urly.redis" -}}
    {{- printf "%s-redis" (include "urly.fullname" .) -}}
{{- end -}}

{{- define "urly.redis.image" -}}
image: "redis:5.0.0"
imagePullPolicy: {{ default "Always" .Values.redis.pullPolicy }}
{{- end -}}

{{- define "urly.redis.labels" -}}
{{ include "urly.labels" . }}
app.kubernetes.io/component: redis
app.kubernetes.io/tier: cache
part-of: urly
{{- end -}}

{{- define "urly.redis.host" -}}
    {{- template "urly.redis" . -}}
{{- end -}}

{{- define "urly.redis.port" -}}
    {{- printf "%s" "6379" -}}
{{- end -}}

{{- define "urly.redis.rawPassword" -}}
    {{- .Values.redis.password -}}
{{- end -}}

{{- define "urly.redis.encryptedPassword" -}}
    {{- include "urly.redis.rawPassword" . | b64enc | quote -}}
{{- end -}}

{{- define "urly.redis.escapedRawPassword" -}}
    {{- include "urly.redis.rawPassword" . | urlquery | replace "+" "%20" -}}
{{- end -}}

{{- define "urly.redis.url" -}}
redis://redis:{{ template "urly.redis.escapedRawPassword" . }}@{{ template "urly.redis.host" . }}:{{ "urly.redis.port" . }}
{{- end -}}
