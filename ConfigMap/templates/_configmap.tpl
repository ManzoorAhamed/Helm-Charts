{{- define "helm-base-chart.configmaps" -}}
{{- if .Values.application.configmaps }}
  {{- range $configMapName, $valueFile := .Values.application.configmaps }}
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ $configMapName }}
  annotations:
    meta.helm.sh/release-name: {{ $.Release.Name }}
    helm.sh/chart: {{ $.Values.application.release }}-{{ $.Chart.Version }}
  labels:
    app.kubernetes.io/version: {{ $.Chart.Version }}
data:
  {{- $configMapValue := $.Files.Get $valueFile | fromYaml }}
  {{- toYaml $configMapValue | nindent 2 }}
---
  {{- end }}
{{- end }}
{{- end }}

