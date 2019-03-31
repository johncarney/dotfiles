[[ -s "$HOME/.bashrc" ]] && source "$HOME/.bashrc"

export HISTFILESIZE=120000
export HISTSIZE=30000
export HISTCONTROL=erasedups:ignorespace
shopt -s histappend

if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

alias ls="ls -Alh"

# Git aliases
alias gco="git checkout"
alias gcb="git checkout -b"
alias grm="git rebase master"
alias grc="git rebase --continue"
alias gls="git ls-files"
alias glm="git ls-files --modified | uniq"
alias gfa="git fetch --all --prune --tags"
alias gri="git rebase --interactive"


# Makes bash completion work with gco and gri aliases.
__git_complete gco _git_checkout
__git_complete gri _git_rebase

# ---------------------------------------------------
# Most recent Rails migration(s)
#
# Examples:
#
#  lmigrate
#  # => db/migrate/20140813044534_my_migration.rb
#
#  lmigrate 2
#  # => db/migrate/20140807051212_older_migration.rb
#  # => db/migrate/20140813044534_my_migration.rb
#
function lmigrate {
    if [ -n "$1" ] ; then
        N="$1"
    else
        N="1"
    fi
    ls -1 db/migrate/*.rb | tail -n "$N"
}

# Rails aliases
alias console="rails console"
alias generate="rails generate"
alias server="rails server"

# Generate a migration and open it in Sublime Text
function migrate {
    rails generate migration "$1"
    if [ $? -eq 0 ] ; then
        sublime `lmigrate`
    fi
}

# Strip terminal codes from text
function stripcolour {
    ssed -R -e "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[mGK]//g" "$@"
}

# List failing rspec tests
function failing-tests {
    RE='spec/.*?_spec\.rb(?::\d+|\[\d+(?::\d+)*\])'
    grep -P $RE tmp/rspec-example-status.txt | grep ' failed ' | ssed -R -e 's!^.*?('"$RE"').*$!\1!'
}

function failing-files {
    failing-tests | ssed -R -e 's/^(.*?)(:\d+|\[\d+(?::\d+)*\])$/\1/' | sort -u
}

function failing-specs {
    failing-files | grep -P '_spec\.rb$'
}
