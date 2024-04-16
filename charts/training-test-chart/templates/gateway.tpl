apiVersion: networking.istio.io/v1beta1
kind: Gateway
metadata:
  name: {{ include "code-server.fullname" $ }}
  labels: 
  {{- include "code-server.labels" $ | nindent 4 }}
  {{- with .labels }}
    {{- toYaml . | nindent 4 }}
  {{- end }}
spec:
  selector:
    istio: ingressgateway
  servers:
  - hosts:
    - {{ include "code-server.hostname" $ }}
    port:
      name: https
      number: 443
      protocol: HTTPS
    tls: 
      mode: "SIMPLE"
      credentialName: {{ include "code-server.hostname" $}}
