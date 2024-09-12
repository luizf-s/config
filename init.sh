#!/usr/bin/sh


st_dir=~/progs/st # simple terminal directory

update() {
    sudo apt update
}

install_zsh() {
    sudo apt install -y zsh

    cp zsh.config ~/.zshrc
}

install_git() {
    sudo apt install -y git
}

install_i3() {
    sudo apt install -y i3-wm dmenu

    cp i3.config ~/.config/i3/config
}

install_tmux() {
    sudo apt install -y tmux

    cp tmux.config ~/.tmux.conf
}

install_zathura() {
    sudo apt install -y zathura
}

install_jq() {
    sudo apt install -y jq
}

install_vim() {
    sudo apt install -y vim
}

install_alacritty() {
    # TODO: install

    if [ ! -d ~/.config/alacritty ]; then
        mkdir -p ~/.config/alacritty
    fi

    cp -i ./alacritty.toml ~/.config/alacritty/alacritty.toml
}

install_st() {
    if [ ! -d $st_dir ]; then
        mkdir -p $st_dir
    fi

    git clone https://git.suckless.org/st --depth=1 $st_dir

    sudo apt install -y libxft-dev

    cp -i st_config.h $st_dir/config.h
    cd $st_dir
    make

    sudo ln -s $st_dir/st /usr/bin/st

    cd -
}

shell_config() {
    cp shell.profile ~/.profile
}

# https://docs.docker.com/engine/install/linux-postinstall/
install_docker() {
    sudo apt install -y docker.io docker

    # post install
    sudo groupadd docker
    sudo usermod -aG docker $USER

    sudo systemctl enable docker.service
    sudo systemctl enable containerd.service
}

# update
