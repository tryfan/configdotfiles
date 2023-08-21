git clone --depth 1 https://github.com/wbthomason/packer.nvim  ~/.local/share/nvim/site/pack/packer/start/packer.nvim
cp -R nvim/.config/nvim ~/.config/nvim
cp -R tmux/.config/tmux ~/.config/tmux
cp -R chatgpt/.config/chatgpt ~/.config/chatgpt

echo "Enter ChatGPT API Key:"
read userInput
echo "echo \"$userInput\"" > ~/.config/chatgpt/key.sh
echo "Input saved to ~/.config/chatgpt/key.sh"
chmod +x .config/chatgpt/key.sh

echo "Run nvim PackerSync"
echo "Run tmux <C-b>I"


