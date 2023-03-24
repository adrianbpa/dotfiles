# BASHRC FOR ANOMALO, ALL OSs

export CONTEXT_DEV="arn:aws:eks:us-west-2:580663733917:cluster/anomalo-staging"
export CONTEXT_STAGING="arn:aws:eks:us-west-1:580663733917:cluster/anomalo-staging-us-west-1"
export CONTEXT_PROD="arn:aws:eks:us-west-1:580663733917:cluster/anomalo-production-us-west-1"

alias k9s_dev="k9s --context $CONTEXT_DEV"
alias k9s_staging="k9s --context $CONTEXT_STAGING"
alias k9s_prod="k9s --context $CONTEXT_PROD"
alias kcluster_demosandbox="kubectl --context arn:aws:eks:us-west-2:580663733917:cluster/anomalo-staging"
alias ksandbox="kcluster_demosandbox --namespace sandbox-a6h9"
alias kdemo="kcluster_demosandbox --namespace demo"
alias kcluster_staging="kubectl --context arn:aws:eks:us-west-1:580663733917:cluster/anomalo-staging-us-west-1"
alias kstaging="kcluster_staging --namespace staging-5fa9"
alias k="ksandbox"
alias ksandbox_all='clear && ksandbox get all,ing -o wide'
alias ksandbox_setcontext="kubectl config set-context arn:aws:eks:us-west-2:580663733917:cluster/anomalo-staging --namespace=sandbox-a6h9"
alias kstaging_all='clear && kstaging get all,ing -o wide'

chsh --shell /bin/bash
