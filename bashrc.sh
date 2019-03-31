export RUBY_GC_MALLOC_LIMIT=90000000
export RUBY_FREE_MIN=200000
export RUBY_GC_HEAP_FREE_SLOTS=200000

if [ -s `brew --prefix`/bin/rbenv ]; then
    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"
elif [ -s "$HOME/.rvm/scripts/rvm" ]; then
    source "$HOME/.rvm/scripts/rvm"
fi