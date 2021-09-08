# Commands

1. Update [`env-secrets.yaml`](env-secrets.yaml) and [`configs.yaml`](configs.yaml) values.
2. Create `namespace`, if not exists
   1. `kubectl apply -f namespace.yaml`
3. Swtch Context
   1. `kubectl config set-context --current --namespace=sync-elasticsearch-mysql-ns`
4. Deploy Configs
   1. `kubectl apply -n sync-elasticsearch-mysql-ns -f configs.yaml`
5. Deploy ENV Secrets
   1. `kubectl apply -n sync-elasticsearch-mysql-ns -f env-secrets.yaml`
6. Deploy Sync ElasticSearch MySQL Logstash Plugin
   1. `kubectl apply -n sync-elasticsearch-mysql-ns -f deployment.yaml`
