# Some env vars
export EDITOR=nvim

# Import handy functions
export PATH="$HOME/bin:$PATH"
for f in ~/dotfiles/functions/*; do source $f; done

# Locales
export LC_ALL=en_GB.UTF-8
export LANG=en_GB.UTF-8

# Go config
export GOPATH=~/.golang
export PATH=$PATH:$GOPATH/bin

# K8s config
export KUBECONFIG=$HOME/.kube/config

if [ -f /opt/miniconda3/etc/profile.d/conda.sh ]; then
  source /opt/miniconda3/etc/profile.d/conda.sh
fi

# Jupyter Lab config
export JUPYTERLAB_DIR=$HOME/.local/share/jupyter/lab
