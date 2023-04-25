kind: ReplicationController
apiVersion: v1
metadata:
  name: bootrc
  namespace: dev
  labels:
    app: fe
spec:
  selector:
    app: bootapp
  replicas: 1
  template:  # PodTemplate
    metadata:
      name: mybootapp
      labels:
        app: bootapp  # labels to select
    spec:
      containers:
      - name: mybootapp
        image: olaoni/boot:1
        ports:
        - containerPort: 8080
---
kind: Service
apiVersion: v1
metadata:
  namespace: dev 
  name: bootsvc
spec:
  selector:
    app: bootapp
  type: NodePort
  ports:
  - targetPort: 8080
    nodePort: 31500  # 30000-32676
    port: 80
