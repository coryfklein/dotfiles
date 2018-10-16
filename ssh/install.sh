# The Brewfile handles Homebrew-based app and library installs, but there may
# still be updates and installables in the Mac App Store. There's a nifty
# command line interface to it that we can use to just install everything, so
# yeah, let's do that.

user () {
  printf "\r  [ \033[0;33m??\033[0m ] $1\n"
}

user ' - What is your work email?'
user ' - Run eval "$(ssh-agent -s)" in another tab'
cp config ~/.ssh/
user ' - Run ssh-add -K ~/.ssh/id_rsa in another tab'
read -e work_email
user " - Add this key to GitHub: $(cat ~/.ssh/id_rsa.pub"

ssh-keygen -t rsa -b 4096 -C "$work_email"
