
# configue git cli to use stored credentials
git config --global credential.helper 'store --file ../config/git-credentials'

# git comletion
source <(curl -s -L https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash )


# Insttall gh and configure authentication - to get open "pull request on git hub" support
sudo yum install -y https://github.com/cli/cli/releases/download/v0.6.2/gh_0.6.2_linux_amd64.rpm
mkdir  -p ~/.config/gh
cat ../config/git-credentials | sed -e 's#https://##' -e "s#@#:#" | awk -F: '{print $3":\n  - user: "$1"\n    oauth_token: "$2}' > ~/.config/gh/config.yml


