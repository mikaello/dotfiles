if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

curl -sSo comp https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash && source comp && rm comp