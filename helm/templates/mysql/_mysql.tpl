

{{- define "urly.mysql" -}}
    {{- printf "%s-mysql" (include "urly.fullname" .) -}}
{{- end -}}

{{- define "urly.mysql.labels" -}}
{{ include "urly.labels" . }}
app.kubernetes.io/component: mysql
app.kubernetes.io/tier: database
{{- end -}}

{{- define "urly.mysql.image" -}}
image: "mysql:5.7"
imagePullPolicy: {{ default "Always" .Values.mysql.pullPolicy }}
{{- end -}}

{{- define "urly.mysql.host" -}}
    {{- template "urly.mysql" . -}}
{{- end -}}

{{- define "urly.mysql.username" -}}
    {{- .Values.mysql.username -}}
{{- end -}}

{{- define "urly.mysql.port" -}}
    {{- printf "%s" "3306" -}}
{{- end -}}

{{- define "urly.mysql.database" -}}
    {{- printf "%s" "urly-db" -}}
{{- end -}}

{{- define "urly.mysql.rawRootPassword" -}}
    {{- .Values.mysql.rootPassword -}}
{{- end -}}

{{- define "urly.mysql.encryptedRootPassword" -}}
    {{- include "urly.mysql.rawRootPassword" . | b64enc | quote -}}
{{- end -}}

{{- define "urly.mysql.rawPassword" -}}
    {{- .Values.mysql.password -}}
{{- end -}}

{{- define "urly.mysql.encryptedPassword" -}}
    {{- include "urly.mysql.rawPassword" . | b64enc | quote -}}
{{- end -}}

{{- define "urly.mysql.escapedRawPassword" -}}
    {{- include "urly.mysql.rawPassword" . | urlquery | replace "+" "%20" -}}
{{- end -}}

{{- define "urly.mysql.url" -}}
mysql://{{ template "urly.mysql.username" . }}:{{ template "urly.mysql.escapedRawPassword" . }}@{{ template "urly.mysql.host" . }}:{{ template "urly.mysql.port" . }}/{{ template "urly.mysql.database" . }}
{{- end -}}
