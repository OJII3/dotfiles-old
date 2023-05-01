# !/bin/bash

# check if you are at $HOME
if [ "$PWD" != "$HOME" ]; then
  echo "You are not at $HOME"
  exit 1
fi

git add .
git status

# ask if user wants to commit
read -p "Continue? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    # commit
    read -p "Commit message: " commitMessage
    git commit -m "$commitMessage"
    git push
    echo "Done!"
else
  echo "Aborted."
fi
