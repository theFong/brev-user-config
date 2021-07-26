sudo apt-get install zsh -y
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
echo "zsh" >> ~/.bashrc

mkdir -p /home/brev/.local/share/code-server/User
cp .vscode/settings.json /home/brev/.local/share/code-server/User/settings.json

code-server --install-extension esbenp.prettier-vscode
code-server --install-extension eamodio.gitlens
code-server --install-extension coolbear.systemd-unit-file
# code-server --install-extension vscode-icons-team.vscode-icons
code-server --install-extension pkief.material-icon-theme
# code-server --install-extension vscodevim.vim
