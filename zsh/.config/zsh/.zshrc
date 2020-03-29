export LANG=en_US.UTF-8
export ZDOTDIR="$HOME/.config/zsh"
export HISTFILE="$HOME/.config/zsh/.zsh_history"
stty -ixon

#####################################
#               BASE16              #
#####################################
BASE16_SHELL="$HOME/dotfiles/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"


_has() {
  return $( whence $1 >/dev/null )
}



#####################################
#               ZGEN                #
#####################################
if [[ ! -d ~/.config/zgen ]];then
    git clone https://github.com/tarjoilija/zgen.git "${HOME}/.config/zgen"
fi
source "${HOME}/.config/zgen/zgen.zsh"

#theme
# zgen load bhilburn/powerlevel9k


#load base system
zgen oh-my-zsh
# faster git completion
zgen oh-my-zsh plugins/gitfast
# reload with src
zgen oh-my-zsh plugins/zsh_reload
# systemd alias
# zplug "plugins/systemd", from:oh-my-zsh
# aliases
zgen oh-my-zsh plugins/common-aliases
## Load completion library for those sweet [tab] squares
zgen oh-my-zsh lib/completion.zsh
zgen oh-my-zsh lib/history.zsh
zgen oh-my-zsh lib/key-bindings.zsh
zgen load zsh-users/zsh-autosuggestions
zgen load zsh-users/zsh-syntax-highlighting
#fzf plugin
if _has fzf; then
    zgen load junegunn/fzf shell/completion.zsh
    zgen load junegunn/fzf shell/key-bindings.zsh
fi
zgen load halfo/lambda-mod-zsh-theme lambda-mod.zsh-theme
#
#
#####################################
#               ALIAS               #
#####################################
#load local alias
source $ZDOTDIR/.zsh_alias
if [ -f ~/dotfiles/zsh_local_alias ]; then
    source ~/dotfiles/zsh_local_alias
fi



#####################################
#               FZF                 #
#####################################
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
export FZF_DEFAULT_COMMAND='fd --type f'
if _has fzf && _has ag; then
  export FZF_DEFAULT_COMMAND='ag --nocolor -g ""'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
fi


#####################################
#          ZSH CONFIG               #
#####################################
HISTORY_IGNORE='(*.git/hooks*)'
setopt interactivecomments
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_BEEP

# enable control-s and control-q
stty start undef
stty stop undef
setopt noflowcontrol


#complete with ...
expand-or-complete-with-dots() {
  echo -n "\e[31m......\e[0m"
  zle expand-or-complete
  zle redisplay
}
# zle -N expand-or-complete-with-dots
# bindkey "^I" expand-or-complete-with-dots


#####################################
#            Load NVM               #
#####################################
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}"  ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh"  ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

autoload -Uz compinit && compinit -i

#
#ssh?
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
    echo "Welcome stranger..."
#startx?
elif [ -z "$DISPLAY" ] && [ "$(fgconsole)" = "1" ]; then
   startx
   exit
#join the tmux club
elif [ -z $TMUX ]; then
    tmux ls 2> /dev/null 
    if [ $? -ne 0 ]; then
        echo "Press any to to cancel the tmux love..." 
        read -t 0.7 -n 1 -s -r 
        if [ $? -ne 0 ]; then
            tmux attach > /dev/null || tmux
        fi 
    else
        tmux attach 
    fi
fi
