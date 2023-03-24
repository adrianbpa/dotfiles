# BASHRC FOR ANOMALO, ALL OSs

export CONTEXT_DEV="arn:aws:eks:us-west-2:580663733917:cluster/anomalo-staging"
export CONTEXT_STAGING="arn:aws:eks:us-west-1:580663733917:cluster/anomalo-staging-us-west-1"
export CONTEXT_PROD="arn:aws:eks:us-west-1:580663733917:cluster/anomalo-production-us-west-1"
export NAMESPACE_SANDBOX_ADRIAN="sandbox-adrian"
export NAMESPACE_STAGING="staging-5fa9"

alias k9s_dev="k9s --context $CONTEXT_DEV"
alias k9s_staging="k9s --context $CONTEXT_STAGING"
alias k9s_prod="k9s --context $CONTEXT_PROD"

alias kdev="kubectl --context $CONTEXT_DEV"
alias kstaging="kubectl --context $CONTEXT_STAGING"

alias kdev_sandbox="kdev --namespace $NAMESPACE_SANDBOX_ADRIAN"
alias kstaging_staging="kstaging --namespace $NAMESPACE_STAGING"

alias kdev_all='clear && kdev get all,ing -o wide'
alias kdev_sandbox_all='clear && kdev_sandbox get all,ing -o wide'
alias kstaging_all='clear && kstaging get all,ing -o wide'

git config --global user.email 104385186+adrianbpa@users.noreply.github.com

chsh --shell /bin/bash
