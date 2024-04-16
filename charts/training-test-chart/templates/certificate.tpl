apiVersion: cert-manager.io/v1
kind: Certificate
metadata:
  name: {{ include "code-server.hostname" $ }}
  namespace: istio-system
spec:
  dnsNames:
  - {{ include "code-server.hostname" $ }}
  - "*.{{ include "code-server.hostname" $ }}"
  issuerRef:
    kind: ClusterIssuer
    name: primary-acme-issuer
  secretName: {{ include "code-server.hostname" $ }}
  secretTemplate:
    annotations:
      reflector.v1.k8s.emberstack.com/reflection-allowed: "true"
      reflector.v1.k8s.emberstack.com/reflection-allowed-namespaces: istio-system
      reflector.v1.k8s.emberstack.com/reflection-auto-enabled: "true"
      reflector.v1.k8s.emberstack.com/reflection-auto-namespaces: istio-system

