source /etc/bash_completion.d/*

if command -v exa &> /dev/null; then
  alias l="exa -BlahgHS -s time --time-style long-iso --group-directories-first"
else
  alias l="ls -ltura --color=auto"
fi

alias fd="fdfind"

alias gitclean="git branch --merged | egrep -v \"(^\*|main|master|dev|production)\" | xargs git branch -d"
alias conflicts="ag \"<<<<<<< HEAD\" \$(git rev-parse --show-toplevel)"

# Format Kotlin code
alias ktlintf='mvn com.github.gantsign.maven:ktlint-maven-plugin:1.16.0:format'

# List all your projects with a shortcut command "p" and start VS Code with selection
function p() {
  base=/home/projects
  project=$(ls $base | fzf)
  test -z $project || code $base/$project
}
export -f p

# Inspect certificate for a host and port, usage "gcert vg.no 443"
function gcert() {
  echo "echo -n | openssl s_client -connect $1:$2 | openssl x509 -text -noout"
  echo -n | openssl s_client -connect $1:$2 | openssl x509 -text -noout
}
export -f gcert

alias d='docker'
alias k='kubectl'
source <(kubectl completion bash)
# Enable kubectl autocompletion for k alias
complete -F __start_kubectl k
# Enable docker autocompletion for d alias
complete -F _docker d


#setxkbmap -layout no -variant dvorak -model pc105 # change keyboard layout to Dvorak
#setxkbmap -option caps:escape # map capslock to escape (handy for Vim users)
