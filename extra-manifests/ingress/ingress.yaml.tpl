apiVersion: networking.k8s.io/v1 
kind: Ingress
metadata:
  name: kube-ingress
  annotations:
    cert-manager.io/issuer: "letsencrypt-prod"
spec:
  ingressClassName: traefik
  tls:
  - hosts:
    - cp-1.baphomet.cloud
    - cp-2.baphomet.cloud
    - cp-3.baphomet.cloud
    secretName: cp-baphomet-cloud-cert
  rules:
  - host: cp.baphomet.cloud
    http:
      paths:
      - path: /
        pathType: Prefix
        backend:
          service:
            name: kubernetes
            port:
              number: 443