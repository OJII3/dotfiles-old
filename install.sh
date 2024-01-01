DOT_DIR="$HOME/dotfiles"

if [[ $(pwd) != $DOT_DIR ]] then
	echo -e "\nMove into dotfiles dir before installation!!\n"
	exit 1
fi

for f in .??*; do
	[[ "$f" == ".git" ]] && continue
	[[ "$f" == ".gitignore" ]] && continue
	[[ "$f" == ".DS_Store" ]] && continue
	[[ "$f" == "README.md" ]] && continue
	[[ "$f" == "install.sh" ]] && continue
	[[ "$f" == "update.sh" ]] && continue

  [[ -f $HOME/$f ]] && mv $HOME/$f $HOME/$f.bak
	ln -snf $DOT_DIR/$f $HOME/$f
	echo "Installed $f"
done
