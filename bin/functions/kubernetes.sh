#! /usr/bin/env bash 

function k8sContexts() {
    # List Services Sorted by Name
    kubectl get services --sort-by=.metadata.name
}

function k8sServices() {
    # List Services Sorted by Name
    kubectl get services --sort-by=.metadata.name
}

function k8sRestartCounts() {
    # List pods Sorted by Restart Count
    kubectl get pods --sort-by='.status.containerStatuses[0].restartCount'
}

function k8sRexAppVersion() {
    # Get the version label of all pods with label app=cassandra
    kubectl get pods --selector=app=rex-app rc -o \
          jsonpath='{.items[*].metadata.labels.version}'
}

function k8sWorkerNodes() {
    # Get all worker nodes (use a selector to exclude results that have a label
    # named 'node-role.kubernetes.io/master')
    kubectl get node --selector='!node-role.kubernetes.io/master'
}

function k8sPodRunning() {
    # Get all running pods in the namespace
    kubectl get pods --field-selector=status.phase=Running
}

function k8sNodeExternalIPs() {
    # Get ExternalIPs of all nodes
    for item in $(kubectl get nodes -o jsonpath='{.items[*].status.addresses[?(@.type=="ExternalIP")].address}'); do printf "%s" "$item"; printf "\n"; done
}

function k8sPodsInRC() {
    # List Names of Pods that belong to Particular RC
    # "jq" command useful for transformations that are too complex for jsonpath, it can be found at https://stedolan.github.io/jq/
    sel=${$(kubectl get rc my-rc --output=json | jq -j '.spec.selector | to_entries | .[] | "\(.key)=\(.value),"')%?}
    echo $(kubectl get pods --selector=$sel --output=jsonpath={.items..metadata.name})
}

function k8sPodLabelsPretty() {
    # Show labels for all pods (or any other Kubernetes object that supports labelling)
    # Also uses "jq"
    for item in $( kubectl get pod --output=name); do printf "Labels for %s\n" "$item" | grep --color -E '[^/]+$' && kubectl get "$item" --output=json | jq -r -S '.metadata.labels | to_entries | .[] | " \(.key)=\(.value)"' 2>/dev/null; printf "\n"; done
}


function k8sPodAnnotations() {
    # Show labels for all pods (or any other Kubernetes object that supports labelling)
    # Also uses "jq"
    for item in $( kubectl get pod --output=name); do printf "Versions for %s\n" "$item" | grep --color -E '[^/]+$' && kubectl get "$item" --output=json | jq -r -S '.metadata.annotations | to_entries | .[] | " \(.key)=\(.value)"' 2>/dev/null; printf "\n"; done
}

function k8sPodLabels() {
    # Or this command can be used as well to get all the labels associated with pods
    kubectl get pods --show-labels
}

function k8sNodesReady() {
    # Check which nodes are ready
    JSONPATH='{range .items[*]}{@.metadata.name}:{range @.status.conditions[*]}{@.type}={@.status};{end}{end}' \
         && kubectl get nodes -o jsonpath="$JSONPATH" | grep "Ready=True"
 }

function k8sPodSecrets() {
    # List all Secrets currently in use by a pod
    kubectl get pods -o json | jq '.items[].spec.containers[].env[]?.valueFrom.secretKeyRef.name' | grep -v null | sort | uniq
}

function k8sEvents() {
    # List Events sorted by timestamp
    kubectl get events --sort-by=.metadata.creationTimestamp
}

function klogs() {
    kubectl logs -f "$@"
}
