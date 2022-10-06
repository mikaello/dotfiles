source /etc/bash_completion.d/*

if command -v exa &> /dev/null; then
  alias l="exa -BlahgHS -s time --time-style long-iso --group-directories-first"
else
  alias l="ls -ltura --color=auto"
fi

alias fd="fdfind"

alias gitclean="git branch --merged | egrep -v \"(^\*|main|master|dev|production)\" | xargs git branch -d"
alias conflicts="ag \"<<<<<<< HEAD\" \$(git rev-parse --show-toplevel)"

# Inspect certificate for a host and port, usage "gcert vg.no 443"
function gcert() {
  echo "echo -n | openssl s_client -connect $1:$2 | openssl x509 -text -noout"
  echo -n | openssl s_client -connect $1:$2 | openssl x509 -text -noout
}
export -f gcert

#setxkbmap -layout no -variant dvorak -model pc105 # change keyboard layout to Dvorak
#setxkbmap -option caps:escape # map capslock to escape (handy for Vim users)