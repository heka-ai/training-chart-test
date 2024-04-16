apiVersion: networking.istio.io/v1beta1
kind: VirtualService
metadata:
  name: {{ include "code-server.fullname" $ }}
  labels:
  {{- include "code-server.labels" $ | nindent 4 }}
  {{- with .labels }}
    {{- toYaml . | nindent 4 }}
  {{- end }}
spec:
  gateways:
  - {{ $.Release.Namespace }}/{{ include "code-server.fullname" $ }}
  hosts:
  - {{ include "code-server.hostname" $ }}
  http:
  - name: "code-server"
    route:
      - destination: 
          host: {{ include "code-server.fullname" $ }}
          port: 
            number: {{ .Values.service.port }}
