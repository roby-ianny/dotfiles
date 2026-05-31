# Setup git - solo se non già autenticato
if ! gh auth status > /dev/null 2>&1; then
  gh auth login
fi

if ! git config --global credential.helper | grep -q gh; then
  gh auth setup-git
fi