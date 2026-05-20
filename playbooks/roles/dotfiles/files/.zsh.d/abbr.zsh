## git
abbr -S --quiet g='git'
abbr -S --quiet gcl='git config -l'
abbr -S --quiet gb='git branch'
abbr -S --quiet gst='git status'
abbr -S --quiet gsw='git switch'

## docker
abbr -S --quiet d='docker'
abbr -S --quiet dc='docker compose'
abbr -S --quiet di='docker images'
abbr -S --quiet dp='docker ps'
abbr -S --quiet dv='docker volume ls'
abbr -S --quiet dspv='docker system prune --volumes'  # -fa
abbr -S --quiet dbp='docker builder prune'  # -fa

## terraform
abbr -S --quiet tfi='terraform init'
abbr -S --quiet tff='terraform fmt'
abbr -S --quiet tfp='terraform plan'
abbr -S --quiet tfa='terraform apply'
abbr -S --quiet tfim='terraform import'
abbr -S --quiet tfo='terraform output'
abbr -S --quiet tfd='terraform destroy'
abbr -S --quiet tfv='terraform validate'
abbr -S --quiet tfs='terraform state'
abbr -S --quiet tfr='terraform refresh'
abbr -S --quiet tfws='terraform workspace select '
abbr -S --quiet tfw='terraform workspace '
abbr -S --quiet tf='terraform '

## terragrunt
abbr -S --quiet tgf='terragrunt hclfmt'
abbr -S --quiet tgv='terragrunt hclvalidate'
abbr -S --quiet tgi='terragrunt init'
abbr -S --quiet tgp='terragrunt plan'
abbr -S --quiet tga='terragrunt apply'
abbr -S --quiet tgo='terragrunt output'
abbr -S --quiet tgd='terragrunt destroy'
abbr -S --quiet tg='terragrunt '

# awsume
alias awsume=". awsume"
abbr -S --quiet asuc='awsume -c'
abbr -S --quiet asuo='awsume -o ~/.aws/credentials'
abbr -S --quiet asso='aws sso login --profile'

# exec
abbr -S --quiet esl='exec $SHELL -l'

# cd
abbr -S --quiet m2='cd /Volumes/crucial-p5/m2-provisioner'
abbr -S --quiet key='cd ~/.ssh/.identity'

# ov
abbr -S --quiet ovps='ps -ef | ov --header 1 --column-width --column-rainbow'
abbr -S --quiet ovcsv='ov --column-delimiter "," --column-mode --column-rainbow '

# saml2aws
abbr -S --quiet s2a='saml2aws'

# bw (bitwarden cli)
abbr -S --quiet bws='export BW_SESSION=$(bw unlock --raw)'
abbr -S --quiet bw1p='bw list items --session $BW_SESSION --search 1pass | jq "[.[] | {id: .login.username, pw: .login.password}]"'

# op (one password cli)
abbr -S --quiet opl='op item list'
abbr -S --quiet opgo='op item get "$OP_AWSSSO_ITEM_TITLE" --otp'
abbr -S --quiet opgip='op item get "$OP_AWSSSO_ITEM_TITLE" --fields username,password --reveal'
