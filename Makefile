apply-macos:
	minikube delete -p task
	minikube start -p task
	kubectl create namespace microservices
	kubectl apply -f ./configs
	kubectl apply -f ./rabbitmq
	time bash ./wait_rabbitmq.sh
	kubectl apply -f ./deployments
	kubectl apply -f ./services/rest-service-m1-macos.yaml

run-tunnel:
	minikube -p task tunnel

apply-linux:
	k3d create cluster task
	kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/static/provider/cloud/deploy.yaml
	kubectl create namespace microservices
	kubectl apply -f ./configs
	kubectl apply -f ./rabbitmq
	time bash ./wait_rabbitmq.sh
	kubectl apply -f ./deployments
	kubectl apply -f ./services/rest-service-linux.yaml
	kubectl apply -f ./ingress/rest-service-linux.yaml
