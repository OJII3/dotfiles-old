# !/bin/bash

# dotfiles directory
DOTFILES_DIR="$HOME/.dotfiles"

has() {
  type "$1" > /dev/null 2>&1
}

# Install dotfiles
if [ ! -d "$DOTFILES_DIR" ]; then
    if has "git"; then
        # ask if user wants to use https or ssh
        echo "Do you want to use https or ssh? (h/s)"
        read -r -n 1 response
        echo
        if [[ $response =~ ^[Ss]$ ]]; then
          git clone git@github.com:OJII3/dotfiles.git
        else if [[ $response =~ ^[Hh]$ ]]; then
          git clone https://github.com/OJII3/dotfiles.git
        else
          echo "Invalid input"
          exit 1
        fi
        fi
    else
        echo "git required"
        exit 1
    fi

    mkdir -p "$DOTFILES_DIR"
    cd "$DOTFILES_DIR"

    for f in *;
    do
       [[ "$f" == ".git" ]] && continue
       [[ "$f" == ".gitconfig" ]] && continue
       [[ "$f" == "install.sh" ]] && continue

      # if a file already exists in $HOME, move it into dotfiles.ba
      if [ -e "$HOME/.$f" ]; then
        echo ".$f already exists. Moving to $DOTFILES_DIR/dotfiles.bak/"
        mkdir -p "$DOTFILES_DIR/dotfiles.bak"
        mv "$HOME/.$f" "$DOTFILES_DIR/dotfiles.bak/"
      fi
      ln -s "$DOTFILES_DIR/$f" "$HOME/.$f"
    done
else
    echo "dotfiles already installed"
fi

exit 0
