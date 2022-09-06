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

curl -fsSL https://tailscale.com/install.sh | sh

### docker ###
# https://docs.docker.com/engine/install/ubuntu/
sudo apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --yes --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
# https://docs.docker.com/engine/install/linux-postinstall/
sudo systemctl enable docker.service
sudo systemctl enable containerd.service
sudo usermod -aG docker $USER

sudo apt-get install -y make build-essential zip
