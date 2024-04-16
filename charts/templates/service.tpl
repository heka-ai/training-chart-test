apiVersion: v1
kind: Service
metadata:
  name: {{ include "code-server.fullname" . }}
  labels:
    app.kubernetes.io/name: {{ include "code-server.name" . }}
    helm.sh/chart: {{ include "code-server.chart" . }}
    app.kubernetes.io/instance: {{ .Release.Name }}
    app.kubernetes.io/managed-by: {{ .Release.Service }}
spec:
  type: {{ .Values.service.type }}
  ports:
    - port: {{ .Values.service.port }}
      targetPort: http
      protocol: TCP
      name: http
  {{- range .Values.extraPorts }}
    - port: {{ .port }}
      targetPort: {{ .port }}
      protocol: {{ .protocol }}
      name: {{ .name }}
  {{- end }}
  selector:
    app.kubernetes.io/name: {{ include "code-server.name" . }}
    app.kubernetes.io/instance: {{ .Release.Name }}
