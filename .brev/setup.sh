echo $BREV_MANAGED_ENV_VARS

# add swap
sudo swapon --show
FILE=/swapfile
if [ -f "$FILE" ]; then
  echo "$FILE exists."
else 
  echo "$FILE does not exist."
  sudo fallocate -l 4G /swapfile
  sudo chmod 600 /swapfile
  sudo mkswap /swapfile
  sudo swapon /swapfile
  sudo sh -c 'echo "/swapfile swap swap defaults 0 0" >> /etc/fstab'
fi
sudo free -h

## install and configure oh-my-zsh headless for ubuntu 20.04
sudo apt update && sudo apt install -y zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended || true
# set default shell to zsh
sudo chsh -s /bin/zsh $USER

git config --global pull.ff only

curl -fsSL https://tailscale.com/install.sh | sh

sudo apt-get install -y make build-essential zip

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
sudo mkdir -p /etc/docker
sudo bash -c "echo '{ \"storage-driver\": \"vfs\" }' > /etc/docker/daemon.json" 

# https://docs.docker.com/engine/install/linux-postinstall/
sudo systemctl enable docker.service
sudo systemctl enable containerd.service
sudo usermod -aG docker $USER
