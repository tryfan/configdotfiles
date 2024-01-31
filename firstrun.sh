which dnf
DNF_PKG=$?
which apt-get
APT_PKG=$?

echo "Updating and installing packages"

if [ "$DNF_PKG" == "0" ]; then
	sudo dnf makecache
	sudo dnf -y install make automake gcc gcc-c++ kernel-devel ripgrep tmux git fd-find
	sudo dnf -y copr enable atim/lazygit
	sudo dnf -y install lazygit

elif [ "$APT_PKG" == "0" ]; then
	sudo apt-get update
	sudo apt-get install build-essential ripgrep git tmux fd-find
	LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
	curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
	tar xf lazygit.tar.gz lazygit
	sudo install lazygit /usr/local/bin
fi

if [ -e "~/.config/nvim/lazyvim.json" ]; then
	echo "LazyVim already installed"
else
	echo "Installing Lazyvim"
	git clone https://github.com/LazyVim/starter ~/.config/nvim
	rm -rf ~/.config/nvim/.git
fi

cp -R nvim/.config/nvim/lua/plugins/* ~/.config/nvim/lua/plugins/
cp -R tmux/.config/tmux ~/.config/tmux

echo "Run nvim :LazyHealth"
