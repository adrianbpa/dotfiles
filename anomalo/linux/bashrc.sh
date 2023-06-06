# BASHRC FOR ANOMALO, LINUX

export PATH=$PATH:~/.local_path

# SETUP .NET ENVIRONMENT ON CODESPACES
# if [[ "${CODESPACES:-""}" == "true" ]]; then
#     export DOTNET_ROOT="/usr/share/dotnet"
#     [[ ! -d "$DOTNET_ROOT" ]] && echo "ERROR: Missing .NET in ${DOTNET_ROOT} - Please install from https://learn.microsoft.com/en-us/dotnet/core/install/linux-debian"
#     export PATH=$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools
# fi
