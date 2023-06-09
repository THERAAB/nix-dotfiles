#!/bin/sh

update_channel() {
    pushd /nix/persist/nix-dotfiles
    sudo nix flake update --extra-experimental-features nix-command --extra-experimental-features flakes
    popd
}

update_flake() {
    pushd /nix/persist/nix-dotfiles
    git pull
    sudo nixos-rebuild switch --flake .#
    popd
}

update_dotfiles_git() {
    pushd /nix/persist/nix-dotfiles
    git pull
    git add .
    git commit -m "automated commit"
    git push
    popd
}

update_full() {
    update_dotfiles_git
    update_channel
    update_flake
}

gc() {
    nix-collect-garbage -d
}

case "$1" in
    update_channel)
        update_channel;;
    update_flake)
        update_flake;;
    update_dotfiles_git)
        update_dotfiles_git;;
    update_full)
        update_full;;
    gc)
        gc;;
esac
