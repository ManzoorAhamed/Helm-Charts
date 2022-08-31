{{- define "helm-base-chart.secret" -}}
{{ if .Values.application.secrets }}
  {{- range $secretName, $secretValue := .Values.application.secrets }}
apiVersion: v1
kind: Secret
metadata:
  name: {{ $secretName }}
data:
  {{- $secretFileValue := $.Files.Get $secretValue | fromYaml }}
  {{- toYaml $secretFileValue | nindent 2 }}
  {{- end -}}
{{- end -}}
{{- end -}}
