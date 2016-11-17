# export SSH_AUTH_SOCK=$TMPDIR/ssh-agent-$USER.sock
# if ! ps -cu $USER | grep ssh-agent &> /dev/null; then
#   ssh-agent -a $SSH_AUTH_SOCK &> /dev/null
# fi
# alias rekey='killall ssh-agent; ssh-agent -a $SSH_AUTH_SOCK &> /dev/null; ssh-add -s /usr/local/lib/opensc-pkcs11.so'

. /usr/local/etc/bash_completion.d/git-completion.bash
. /usr/local/etc/bash_completion.d/git-prompt.sh

set -o vi

PATH="$PATH:/usr/local/share/python"
export JAVA7_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_75.jdk/Contents/Home
export JAVA8_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_51.jdk/Contents/Home
export JAVA_HOME=$JAVA8_HOME
export PATH=$JAVA_HOME/bin:$PATH
export AWS=.inst.aws.airbnb.com

# For fzf to exclude gitignore files and directories
export FZF_DEFAULT_COMMAND='ag -l -g ""'
export FZF_CTRL_T_COMMAND='ag -l -g ""'

bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

# This is bad
# alias vim="/usr/local/Cellar/vim/7.4.1795/bin/vim"

alias rekey="ssh-add -e /usr/local/lib/opensc-pkcs11.so; ssh-add -s /usr/local/lib/opensc-pkcs11.so -t 28800"
#alias rk="ssh-add -e /usr/local/lib/opensc-pkcs11.so; ssh-add -s /usr/local/lib/opensc-pkcs11.so -t 28800"
alias rk="yk"
alias vem="vim app/mailers/engagement_mailer.rb"
alias h="history"
alias br=". ~/.bash_profile"
alias gp='git push'
alias gpf='git push -f'
alias ga.='git add .'
alias gca='git commit --amend'
alias gs="git status"
alias gd="git diff"
alias gb="git branch"
alias gl="git log"
alias gdm="git diff master"
alias gcm="git checkout master"
alias gcp="git checkout production"
alias gpom="git pull --rebase origin master"
alias gpop="git pull --rebase origin production"
alias grom="git checkout master && git pull --rebase && git checkout - && git rebase master"
alias grm="git rebase master"
alias grc="git rebase --continue"
alias gacp="git add . && git commit --amend && git push -f"
alias gg="git checkout master && git pull --rebase origin master"
alias gc-="git checkout -"
alias gc.="git checkout ."
alias less='less -R'
alias r='cd ~/airlab/repos/rookery'
alias a='cd ~/airlab/repos/airbnb'
alias vs='cd ~/airlab/repos/airbnb && vagrant ssh && cd -'
alias vr='cd ~/airlab/repos/airbnb && vagrant reload'
alias vp='cd ~/airlab/repos/airbnb && vagrant provision'
alias vu='cd ~/airlab/repos/airbnb && vagrant up'
alias m='cd ~/airlab/repos/mochi'
alias d='cd ~/airlab/repos/data'
alias c='cd ~/repos/chef'
alias di='cd ~/repos/data-infra'
alias vae='vim airflow/metrics_repo/config/active_experiments.yaml'
alias scpdata='scp ~/repos/data/airflow/engagement_emails/engagement_emails.py $USER@gw2.silver.musta.ch:~/data/airflow/engagement_emails/engagement_emails.py && scp ~/repos/data/hive/queries/engagement/* $USER@gw2.silver.musta.ch:~/data/hive/queries/engagement/'
alias vbp='vim ~/.bash_profile'
alias vrc='vim ~/.vimrc'
alias vrca='vim ~/.vimrc.after'
alias gsl='git stash list'
alias gsp='git stash pop'
alias test='npm run --silent sanity-check'
alias gcb=gitcheckoutallenbranch
gitcheckoutallenbranch() {
  git checkout -b allen/$1
}
alias grm=gitRevertMaster
gitRevertMaster() {
  git checkout origin/master $1
}
alias gcmsg=gitCommitMessage
gitCommitMessage() {
  git commit -m "$1"
}

export DATA_INFRA_DIR=/Users/$(whoami)/repos/data-infra
export ROOKERY_DIR=/Users/$(whoami)/repos/rookery
export MOCHI_DIR=/Users/$(whoami)/repos/mochi
export PS1="\[\033[01;32m\]\w\$(__git_ps1)\[\033[00m\]\$ "
# export PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
# For optica
export PATH="$PATH:$HOME/repos/sysops/one_offs"

cd ~/airlab/repos

HISTFILESIZE=50000

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

upload_silver1() {
    cd ~/repos/treehouse/projects/discover/hermes
    gradle shadowJar
    scp build/libs/hermes-all.jar allen_wu@gw2.silver.musta.ch:~
}

removeBranchesWithPrefix() {
  git for-each-ref --format="%(refname:short)" refs/heads/$1\* | xargs git branch -d
}

#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
#
#[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh  # This loads NVM
#
#test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
vimf() {
  IFS='
'
  local declare files=($(fzf-tmux --query="$1" --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
  unset IFS
}

# fda - including hidden directories
cdf() {
  local dir
  dir=$(find ${1:-.} -type d 2> /dev/null | fzf +m) && cd "$dir"
}

# fh - repeat history
hf() {
  eval $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}

# fkill - kill process
killf() {
  pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

  if [ "x$pid" != "x" ]
  then
    kill -${1:-9} $pid
  fi
}

# fbr - checkout git branch
gcf() {
  local branches branch
  branches=$(git branch -vv) &&
  branch=$(echo "$branches" | fzf +m) &&
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

# fcs - get git commit sha
# example usage: git rebase -i `fcs`
gcsf() {
  local commits commit
  commits=$(git log --color=always --pretty=oneline --abbrev-commit --reverse) &&
  commit=$(echo "$commits" | fzf --tac +s +m -e --ansi --reverse) &&
  echo -n $(echo "$commit" | sed "s/ .*//")
}

# ftpane - switch pane (@george-b)
ft() {
  local panes current_window current_pane target target_window target_pane
  panes=$(tmux list-panes -s -F '#I:#P - #{pane_current_path} #{pane_current_command}')
  current_pane=$(tmux display-message -p '#I:#P')
  current_window=$(tmux display-message -p '#I')

  target=$(echo "$panes" | grep -v "$current_pane" | fzf +m --reverse) || return

  target_window=$(echo $target | awk 'BEGIN{FS=":|-"} {print$1}')
  target_pane=$(echo $target | awk 'BEGIN{FS=":|-"} {print$2}' | cut -c 1)

  if [[ $current_window -eq $target_window ]]; then
    tmux select-pane -t ${target_window}.${target_pane}
  else
    tmux select-pane -t ${target_window}.${target_pane} &&
    tmux select-window -t $target_window
  fi
}
