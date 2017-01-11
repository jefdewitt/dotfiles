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

_project_dir=$HOME/proj
_dotfiles_scripts_dir="$_project_dir/dotfiles/scripts"

_gen_dev_notes="$_project_dir/general-dev-notes"
_gen_dev_bash="$_gen_dev_notes/files/bash"

# random tidbits
  function dotfiles-update {
    $_project_dir/dotfiles/update-dotfiles.sh
  }

  function dotfiles-install {
    $_project_dir/dotfiles/install.sh
  }

  # outputs dirs/files only in the first directory argument
  function onlyindir1 {
    diff -rubq $1 $2 | grep $1 | grep -E '^Only in*' | sed -n 's/[^:]*: //p'
  }

# environments
  function nuke-local-env-mobile {
    $_dotfiles_scripts_dir/pre-nuke-local-env-mobile.sh
    # TODO: fix this issue in the script itself, sub-shell to change working directory
    (cd $_gen_dev_bash && time $_gen_dev_bash/mobile-dev-env-from-scratch.sh)
  }

# project helpers

  # mobile
  function widget-replace-emdot-single {
    time $_gen_dev_bash/mobile-dev-build-and-replace-widget.sh $1
  }

  function emdot-new-feature {
    time $_project_dir/dotfiles/scripts/mobile-start-new-feature.sh $1 $2
  }

  # desktop
  function widget-replace-desktop-all {
    time $_gen_dev_bash/desktop-dev-build-and-replace-widgets.sh
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
export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

export DEV_PROJECTS_ROOT="$HOME/proj"
