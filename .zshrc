export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="obraun"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"


# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="mm/dd/yyyy"

plugins=(git zsh-syntax-highlighting z thefuck history history-substring-search npm brew)

source $ZSH/oh-my-zsh.sh

export ANDROID_HOME=/usr/local/opt/android-sdk
export JAVA_HOME=$(/usr/libexec/java_home)

export DEV_PROJECTS_ROOT="$HOME/proj"
# ${DEV_PROJECTS_ROOT:?"Need to set DEV_PROJECTS_ROOT"}

projects=$DEV_PROJECTS_ROOT
dotfiles="$projects/dotfiles"
dotfile_scripts="$projects/dotfiles/scripts/projects"

_gen_dev_notes="$projects/general-dev-notes"
_gen_dev_bash="$_gen_dev_notes/files/bash"

# random tidbits
  function dotfiles-update {
    $projects/dotfiles/install.sh
    $projects/dotfiles/update-dotfiles.sh
    zsh
  }

  function dotfiles-install {
    $projects/dotfiles/install.sh
  }

  # outputs dirs/files only in the first directory argument
  function onlyindir1 {
    diff -rubq $1 $2 | grep $1 | grep -E '^Only in*' | sed -n 's/[^:]*: //p'
  }

# environments
  function nuke-local-env-mobile {
    # $dotfile_scripts/mobile/pre-nuke-local-env.sh
    # TODO: fix this issue in the script itself, sub-shell to change working directory
    (cd $dotfile_scripts/mobile && time $dotfile_scripts/mobile/dev-env-from-scratch.sh)
  }

# project helpers

  # builds 
  function build-tsui {
    time $dotfile_scripts/tsui/build.sh
  }

  function build-tux {
    time $dotfile_scripts/tux/build.sh
  }

  # mobile
  function widget-replace-emdot-single {
    time $dotfile_scripts/mobile/build-and-replace-widget.sh $1
  }

  function emdot-new-feature {
    time $dotfile_scripts/mobile/start-new-feature.sh $1 $2
  }

  function emdot-update-feature-with-master {
    time $dotfile_scripts/mobile/update-feature-with-master.sh $1
  }

  function emdot-build-all {
    time $dotfile_scripts/mobile/build-all.sh $1
  }

  # desktop
  function widget-replace-desktop-all {
    time $dotfile_scripts/desktop/build-and-replace-widgets.sh
  }

  function widget-replace-desktop-single {
    echo "Not a thing yet, maybe you should make it a thing."
  }

# z navigation
. `brew --prefix`/etc/profile.d/z.sh

# vscode
function code {
    if [[ $# = 0 ]]
    then
        open -a "Visual Studio Code"
    else
        local argPath="$1"
        [[ $1 = /* ]] && argPath="$1" || argPath="$PWD/${1#./}"
        open -a "Visual Studio Code" "$argPath"
    fi
}

# node-version-manager
# export NVM_DIR="$HOME/.nvm"
# . "/usr/local/opt/nvm/nvm.sh"

export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).
