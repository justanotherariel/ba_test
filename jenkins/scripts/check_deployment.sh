DEP=$(sudo kubectl get deployments 2> /dev/null || true | grep "$1")
POD=$(sudo kubectl get pods 2> /dev/null || true | grep "$1")

if [  -n "$DEP" ]; then
  sudo kubectl delete deployment $1
  echo 'Deleting...'
  while [ -n "$POD" ]; do
    echo 'Not deleted! Continue...'
    sleep 5
    POD=$(sudo kubectl get pods 2> /dev/null || true | grep "$1")
  done
fi