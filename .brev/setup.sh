sudo apt-get install zsh -y
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
echo "zsh" >> ~/.bashrc

mkdir -p /home/brev/.local/share/code-server/User
cp .vscode/settings.json /home/brev/.local/share/code-server/User/settings.json

code-server --install-extension esbenp.prettier-vscode
code-server --install-extension eamodio.gitlens
code-server --install-extension coolbear.systemd-unit-file
code-server --install-extension pkief.material-icon-theme
# code-server --install-extension vscodevim.vim
code-server --install-extension github.vscode-pull-request-github

export SERVICE_URL=https://open-vsx.org/vscode/gallery
export ITEM_URL=https://open-vsx.org/vscode/item
code-server --install-extension gitduck.code-streaming

git config --global pull.ff only
