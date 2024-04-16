{{- if not .Values.existingSecret }}
apiVersion: v1
kind: Secret
metadata:
  name: {{ include "code-server.fullname" . }}
  annotations:
    "helm.sh/hook": "pre-install"
  labels:
    app.kubernetes.io/name: {{ include "code-server.name" . }}
    helm.sh/chart: {{ include "code-server.chart" . }}
    app.kubernetes.io/instance: {{ .Release.Name }}
    app.kubernetes.io/managed-by: {{ .Release.Service }}
type: Opaque
data:
  {{- if .Values.password }}
  password: "{{ .Values.password | b64enc }}"
  {{- else }}
  password: "{{ randAlphaNum 24 | b64enc }}"
  {{- end }}
{{- end }}
