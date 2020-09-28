#! /bin/bash

log() {
    echo $1 >> ~/env-setup.log
}

install_docker() {
    echo -e '\e[0;33mSetting up docker\e[0m'

    sudo apt-get update
    sudo apt-get install \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg-agent \
        software-properties-common \
        -y

    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

    sudo add-apt-repository --yes \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable nightly test"

    sudo apt-get update
    sudo apt-get install docker-ce docker-ce-cli containerd.io -y
    
    sudo groupadd docker
    sudo usermod -aG docker $USER
    sudo /etc/init.d/docker start
}

install_git() {
    echo -e '\e[0;33mInstalling git\e[0m'

    sudo apt-get update
    sudo apt-get install git -y
    wget https://raw.githubusercontent.com/frycast/system-init/master/common/.gitconfig --output-document ~/.gitconfig
    git config --global core.autocrlf false

}

install_R() {
    echo -e '\e[0;33mInstalling R\e[0m'

    sudo apt update
    sudo apt -y upgrade
    sudo apt -y install r-base
}

install_julia() {

    wget https://julialang-s3.julialang.org/bin/linux/x64/1.5/julia-1.5.1-linux-x86_64.tar.gz
    tar zxvf julia-1.5.1-linux-x86_64.tar.gz
    export PATH="$PATH:~/julia-1.5.1/bin"
    
}

setup_python3() {
    echo -e '\e[0;33mInstalling Python 3\e[0m'

    sudo apt update
    sudo apt -y upgrade
    sudo apt-get install pylint

}


echo -e '\e[0;33mPreparing to setup a linux machine from a base install\e[0m'

tmpDir=~/tmp/setup-base

if [ ! -d "$tmpDir" ]; then
    mkdir --parents $tmpDir
fi

## General updates
sudo apt-get update
sudo apt-get upgrade -y

## Utilities
sudo apt-get install unzip curl jq mlocate -y

# Create standard github clone location
mkdir -p ~/code/github

install_git
install_docker
install_R
setup_python3
install_julia

rm -rf $tmpDir
