# !/bin/bash

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
