#!/bin/bash
kubens microservices
x="NotRunning"
while [[ "$x" != "Running" ]]; do 
    sleep 10
    echo "Waiting for rabbitmq to run 10 seconds..."
    x=$(kubectl get pods | awk 'BEGIN{ORS=""} {if(NR==2) print $3}')
    echo "$x"
done

echo "Rabbitmq is running"
