export HISTFILESIZE=120000
export HISTSIZE=30000
export HISTCONTROL=erasedups
shopt -s histappend
shopt -s histreedit

if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

export RUBYMINE=/Applications/RubyMine.app
export RUBYLIB="$RUBYMINE/rb/testing/patch/common:$RUBYMINE/rb/testing/patch/bdd"

export NODE_PATH=/usr/local/lib/node_modules

export RUBY_GC_MALLOC_LIMIT=90000000
export RUBY_FREE_MIN=200000
export RUBY_GC_HEAP_FREE_SLOTS=200000

# Git aliases
alias gco='git checkout'
alias grm='git rebase master'
alias grc='git rebase --continue'

# Makes bash completion work with the gco alias.
__git_complete gco _git_checkout

# Most recent Rails migration
alias lm='ls db/migrate/*.rb | tail -n 1'

# Zeus aliases
alias zrspec='zeus rspec -fd --order default --no-profile'
alias zconsole='zeus console'
alias zstart='zeus start'
alias zrake='zeus rake'
alias zgenerate='zeus generate'

alias xrspec='xargs zeus rspec -fd --order default --no-profile'

source ~/.profile
source ~/.git-prompt.sh

export PATH="/usr/local/bin:${PATH//\/usr\/local\/bin:/}"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
