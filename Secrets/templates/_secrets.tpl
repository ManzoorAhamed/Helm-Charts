{{- define "helm-base-chart.secret" -}}
{{ if .Values.application.secrets }}
  {{- range $secretName, $secretValue := .Values.application.secrets }}
  ## $secretName Variable = uname & $secretValue variable = values/dev/uname.yaml
apiVersion: v1
kind: Secret
metadata:
  name: {{ $secretName }}
data:
  {{- $secretFileValue := $.Files.Get $secretValue | fromYaml }}
  {{- toYaml $secretFileValue | nindent 2 }}
---
  {{- end -}}
{{- end -}}
{{- end -}}