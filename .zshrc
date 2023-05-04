# Check if the OS is macOS and if Homebrew is installed
if [[ "$(uname)" == "Darwin" ]]; then
  if ! command -v brew >/dev/null 2>&1; then
    echo "Homebrew not found. Starting installation."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi

  # Check if oh-my-zsh is installed
  if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
    echo "oh-my-zsh not found. Starting installation."
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  fi

  # Check if nerd-fonts is installed, and install it using Homebrew if not found
  font_installed=$(fc-list | grep -i "Hack Nerd Font")
  if [ -z "${font_installed}" ]; then
    echo "nerd-fonts not found. Starting installation."
    brew tap homebrew/cask-fonts
    brew install --cask font-hack-nerd-font
  fi

  # Check if Neovim is installed, and install it using Homebrew if not found
  if ! command -v nvim >/dev/null 2>&1; then
    echo "Neovim not found. Starting installation using Homebrew."
    brew install neovim
    git clone https://github.com/kabinspace/AstroVim ~/.config/nvim
  fi

  # Check if tmux is installed, and install it using Homebrew if not found
  if ! command -v tmux >/dev/null 2>&1; then
    echo "tmux not found. Starting installation using Homebrew."
    brew install tmux
  fi
fi

# delete a command history which is identical to the previous one
setopt hist_ignore_dups
setopt hist_ignore_all_dups

# enable zsh to share command history with each of its session
setopt share_history

# the setting of the history command
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000

# increase the default number of history entries displayed
alias history='fc -l -100'

# fix commands' misspelling
setopt correct

# no beep
setopt no_beep

# directory stack
DIRSTACKSIZE=100
setopt AUTO_PUSHD

# environment variable
export LANG=en_US.UTF-8

# make vim properky detect 256 colors
export TERM=screen-256color

# git
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{magenta}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{yellow}+"
zstyle ':vcs_info:*' formats "%F{cyan}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }

# prompt custum
PROMPT='
[%B%F{red}%n@%m%f%b:%F{green}%~%f]%F{cyan}$vcs_info_msg_0_%f
%F{yellow}$%f '

# oh my zsh
export ZSH="$HOME/.oh-my-zsh"
plugins=(git zsh-autosuggestions web-search copyfile copypath copybuffer dirhistory)
source $ZSH/oh-my-zsh.sh

# auto completion
autoload -Uz compinit
compinit -u
if [ -e /usr/local/share/zsh-completions ]; then
  fpath=(/usr/local/share/zsh-completions $fpath)
fi
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
setopt list_packed
autoload colors
zstyle ':completion:*' list-colors ''

# exec tmux when the terminal is opend
if [ $SHLVL = 1 ]; then
  tmux
fi

# login in the same directory as the last time when exiting
export dirfile="$HOME/.who.$host.$tty"
export dirhfile="$HOME/.who.$host"
if [[ ! -f $dirfile  ]]; then
    if [[ ! -f $dirhfile  ]]; then
        dir=$HOME
    else
        dir=`cat $dirhfile`
    fi
else
    dir=`cat $dirfile`
    if [[ -d $dir  ]]; then
        cd $dir
    else
        dir=$HOME
    fi
fi
function pushd {
    builtin pushd "$@"
    echo $PWD > $dirfile
    echo $PWD > $dirhfile
}
function popd {
    builtin popd "$@"
    echo $PWD > $dirfile
    echo $PWD > $dirhfile
}
function cd {
    builtin cd "$@"
    echo $PWD > $dirfile
    echo $PWD > $dirhfile
}
