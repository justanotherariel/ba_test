#!/bin/sh

deployment_active () {
  POD=$(sudo kubectl get pods 2> /dev/null | grep "$1")
  if [ -n "$POD" ]
  then
    return 0
  else 
    return 1
  fi 
}

if deployment_active
then
  # Delete current Deployment
  sudo kubectl delete deployment $1

  # Check if deployment got deleted
  while deployment_active
  do
    echo 'Waiting for termination to finish...'
    sleep 5
  done
fi