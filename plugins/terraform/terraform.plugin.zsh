function tf_prompt_info() {
  # dont show 'default' workspace in home dir
  [[ "$PWD" != ~ ]] || return
  # check if in terraform dir and file exists
  [[ -d .terraform && -r .terraform/environment ]] || return

  local workspace="$(< .terraform/environment)"
  echo "${ZSH_THEME_TF_PROMPT_PREFIX-[}${workspace:gs/%/%%}${ZSH_THEME_TF_PROMPT_SUFFIX-]}"
}

alias tf='terraform'
alias tfa='terraform apply'
alias tfd='terraform destroy'
alias tff='terraform fmt'
alias tfi='terraform init'
alias tfo='terraform output'
alias tfp='terraform plan'
alias tfv='terraform validate'
alias tfw='terraform workspace'
alias tfwl='terraform workspace list'
alias tfwn='terraform workspace new'
alias tfwd='terraform workspace delete'
alias tfws='terraform workspace select'
alias tfwg='terraform workspace show'

if (( $+commands[terraform] )); then
  autoload -U +X bashcompinit && bashcompinit
  complete -o nospace -C terraform terraform
fi
