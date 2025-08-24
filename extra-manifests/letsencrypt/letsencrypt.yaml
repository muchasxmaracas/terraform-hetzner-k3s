apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  name: route53-tokenrequest
  namespace: cert-manager
rules:
  - apiGroups: ['']
    resources: ['serviceaccounts/token']
    resourceNames: ['route53']
    verbs: ['create']
---
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: cert-manager-route53-tokenrequest
  namespace: cert-manager
subjects:
  - kind: ServiceAccount
    name: cert-manager
    namespace: cert-manager
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: Role
  name: route53-tokenrequest
---
apiVersion: cert-manager.io/v1
kind: ClusterIssuer
metadata:
  name: letsencrypt-prod
spec:
  acme:
    # The ACME server URL
    server: https://acme-v02.api.letsencrypt.org/directory
    # Email address used for ACME registration
    email: sandromarton95@gmail.com
    # Name of a secret used to store the ACME account private key
    privateKeySecretRef:
      name: letsencrypt-prod
    solvers:
      - selector:
          dnsZones:
            - gallowhead.com
            - baphomet.cloud
        dns01:
          route53:
            region: us-east-1
            accessKeyIDSecretRef:
              name: route53-acme-secret
              key: aws_access_key_id
            secretAccessKeySecretRef:
              name: route53-acme-secret
              key: aws_secret_access_key
---
# See doc: https://devops.supportsages.com/kubesecure-mastering-lets-encrypt-ssl-with-kubernetes-and-route53-b6fb54889fb5

apiVersion: cert-manager.io/v1
kind: ClusterIssuer
metadata:
  name: letsencrypt-staging
spec:
  acme:
    # The ACME server URL
    server: https://acme-staging-v02.api.letsencrypt.org/directory
    # Email address used for ACME registration
    email: sandromarton95@gmail.com
    # Name of a secret used to store the ACME account private key
    privateKeySecretRef:
      name: letsencrypt-staging
    solvers:
      - selector:
          dnsZones:
            - gallowhead.com
            - baphomet.cloud
        dns01:
          route53:
            region: us-east-1
            accessKeyIDSecretRef:
              name: route53-acme-secret
              key: aws_access_key_id
            secretAccessKeySecretRef:
              name: route53-acme-secret
              key: aws_secret_access_key
---
# See doc: https://devops.supportsages.com/kubesecure-mastering-lets-encrypt-ssl-with-kubernetes-and-route53-b6fb54889fb5

apiVersion: cert-manager.io/v1
kind: ClusterIssuer
metadata:
  name: rancher
spec:
  acme:
    # The ACME server URL
    server: https://acme-v02.api.letsencrypt.org/directory
    # Email address used for ACME registration
    email: sandromarton95@gmail.com
    # Name of a secret used to store the ACME account private key
    privateKeySecretRef:
      name: rancher
    solvers:
      - selector:
          dnsZones:
            - baphomet.cloud
        dns01:
          route53:
            region: us-east-1
            accessKeyIDSecretRef:
              name: route53-acme-secret
              key: aws_access_key_id
            secretAccessKeySecretRef:
              name: route53-acme-secret
              key: aws_secret_access_key
---
# See doc: https://devops.supportsages.com/kubesecure-mastering-lets-encrypt-ssl-with-kubernetes-and-route53-b6fb54889fb5

apiVersion: cert-manager.io/v1
kind: Issuer
metadata:
  name: letsencrypt-prod
spec:
  acme:
    # The ACME server URL
    server: https://acme-v02.api.letsencrypt.org/directory
    # Email address used for ACME registration
    email: sandromarton95@gmail.com
    privateKeySecretRef:
      name: letsencrypt-prod
    solvers:
      - selector:
          dnsZones:
            - gallowhead.com
            - baphomet.cloud
        dns01:
          route53:
            region: us-east-1
            accessKeyIDSecretRef:
              name: route53-acme-secret
              key: aws_access_key_id
            secretAccessKeySecretRef:
              name: route53-acme-secret
              key: aws_secret_access_key
---
# See doc: https://devops.supportsages.com/kubesecure-mastering-lets-encrypt-ssl-with-kubernetes-and-route53-b6fb54889fb5

apiVersion: cert-manager.io/v1
kind: Issuer
metadata:
  name: letsencrypt-staging
spec:
  acme:
    # The ACME server URL
    server: https://acme-staging-v02.api.letsencrypt.org/directory
    # Email address used for ACME registration
    email: sandromarton95@gmail.com
    privateKeySecretRef:
      name: letsencrypt-staging
    solvers:
      - selector:
          dnsZones:
            - gallowhead.com
            - baphomet.cloud
        dns01:
          route53:
            region: us-east-1
            accessKeyIDSecretRef:
              name: route53-acme-secret
              key: aws_access_key_id
            secretAccessKeySecretRef:
              name: route53-acme-secret
              key: aws_secret_access_key
---
# See doc: https://devops.supportsages.com/kubesecure-mastering-lets-encrypt-ssl-with-kubernetes-and-route53-b6fb54889fb5

apiVersion: cert-manager.io/v1
kind: Issuer
metadata:
  name: rancher
  namespace: cattle-system
spec:
  acme:
    # The ACME server URL
    server: https://acme-v02.api.letsencrypt.org/directory
    # Email address used for ACME registration
    email: sandromarton95@gmail.com
    privateKeySecretRef:
      name: rancher
    solvers:
      - selector:
          dnsZones:
            - baphomet.cloud
        dns01:
          route53:
            region: us-east-1
            accessKeyIDSecretRef:
              name: route53-acme-secret
              key: aws_access_key_id
            secretAccessKeySecretRef:
              name: route53-acme-secret
              key: aws_secret_access_key
