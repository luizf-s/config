#!/usr/bin/sh


st_dir=$HOME/progs/st # simple terminal directory

update() {
    sudo apt update
}

install_zsh() {
    sudo apt install -y zsh

    cp -v zsh.config $HOME/.zshrc
}

install_git() {
    sudo apt install -y git
}

install_i3() {
    sudo apt install -y i3-wm dmenu

    cp -v i3.config $HOME/.config/i3/config
}

install_tmux() {
    sudo apt install -y tmux

    cp -v tmux.config $HOME/.tmux.conf
}

install_zathura() {
    sudo apt install -y zathura
}

install_jq() {
    sudo apt install -y jq
}

install_vim() {
    sudo apt install -y vim

    if [ ! -d $HOME/.vim/colors ]; then
        echo "creating $HOME/.vim/colors directory"
        mkdir -p $HOME/.vim/colors
    fi

    cp -v catppuccin_mocha.vim $HOME/.vim/colors
    cp -v vim.rc $HOME/.vimrc
}

install_st() {
    if [ ! -d $st_dir ]; then
        mkdir -p $st_dir
    fi

    git clone https://git.suckless.org/st --depth=1 $st_dir

    sudo apt install -y libxft-dev

    cp -v st_config.h $st_dir/config.h
    cd $st_dir
    make

    sudo ln -s $st_dir/st /usr/bin/st

    cd -
}

shell_config() {
    cp -v shell.profile $HOME/.profile
}

install_hackfont() {
    unzip hack-ttf.zip -d h

    if [! -d $HOME/.local/share/fonts]; then
        mkdir -p $HOME/.local/share/fonts
    fi

    mv h/ttf/* $HOME/.local/share/fonts/

    fc-cache -f -v > /dev/null
    rm -rf h

    if [ -n "$(fc-list | grep -i hack)" ]; then
        echo "Hack font installed successfuly"
    fi
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

update
install_zsh
install_git
install_i3
install_tmux
install_zathura
install_jq
install_vim
install_hackfont
install_st
shell_config
