#!/bin/bash

if [[ -f "./deploy" ]]; then
    chmod +x ./deploy
    ./deploy &
    DEPLOY_PID=$!
else
    echo "Error: deploy file not found."
    exit 1
fi

echo -n "Deploying: ["
for i in {1..20}; do
    echo -n "#"
    sleep 0.5
done
echo "] 100% Complete"

wait $DEPLOY_PID
echo "Process finished successfully."
