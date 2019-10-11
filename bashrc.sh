export RUBY_GC_MALLOC_LIMIT=90000000
export RUBY_FREE_MIN=200000
export RUBY_GC_HEAP_FREE_SLOTS=200000

# Sets the DOTFILES environment variable to the directory containing dotfiles
if [ -n "$(type -t realpath)" ]; then
    export DOTFILES="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"
else
    export DOTFILES="$(ruby -e "p = File.dirname(File.realdirpath('${BASH_SOURCE[0]}')) rescue nil; puts Array(p)")"
fi

if [ -n "$(type -t brew)" ]; then
    export BREW_PREFIX="$(brew --prefix)"
fi

if [ -n "$(type -t rbenv)" ]; then
    export PATH="$(rbenv root):$PATH"
    eval "$(rbenv init -)"
elif [ -t "$HOME/.rvm/scripts/rvm" ]; then
    source "$HOME/.rvm/scripts/rvm"
fi
export PATH=".git/safe/../../bin:~/bin:$PATH"

if [ -d "$HOME/.yarn/bin" ]; then
    export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
fi
