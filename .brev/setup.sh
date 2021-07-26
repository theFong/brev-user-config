sudo sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended

cp .vscode/settings.json /home/brev/.local/share/code-server/User/settings.json

code-server --install-extension esbenp.prettier-vscode
code-server --install-extension eamodio.gitlens
code-server --install-extension coolbear.systemd-unit-file