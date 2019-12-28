.PHONY: apply_yamls
apply_yamls:
	kubectl apply -f flaskappwithredis/app-ns.yaml
	kubectl apply -f flaskappwithredis/flaskapp-svc.yaml
	kubectl apply -f flaskappwithredis/flaskapp-rs.yaml

.PHONY: minikube
minikube:
	minikube service flaskapp -n flaskapp-dev
