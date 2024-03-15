{pkgs, ...}: {
  environment.systemPackages = [
    (
      pkgs.writeScriptBin "nox" ''

        #!/bin/sh
        # nox: NixOs eXecute

        dir=/nix/persist/nix-dotfiles
        applyDir=/nix/persist/nix-homelab
        git=${pkgs.git}/bin/git

        inputs() {
            $git -C $dir pull
            sudo nix flake update $dir
        }
        rebuild() {
            $git -C $dir pull
            sudo nixos-rebuild switch --flake $dir#
        }
        commit() {
            $git -C $dir pull
            $git -C $dir add .
            $git -C $dir commit -m "automated commit"
            $git -C $dir push
        }
        status() {
            $git -C $dir status
        }
        update() {
            inputs
            rebuild
        }
        gc() {
            nix-collect-garbage -d
        }
        pull() {
            $git -C $dir pull
        }
        apply() {
            $git -C $applyDir pull
            sudo nix run $applyDir#apps.nixinate.$1
        }
        microvm() {
            $git -C $applyDir pull
            sudo ${pkgs.openssh}/bin/ssh -t raab@nix-hypervisor "sudo flock -w 60 /dev/shm/microvm-$1 microvm -Ru $1"
        }

        case "$1" in
            inputs) inputs;;
            rebuild) rebuild;;
            commit) commit;;
            update) update;;
            gc) gc;;
            status) status;;
            pull) pull;;
            apply) apply $2;;
            microvm) microvm $2;;
        esac
      ''
    )
  ];
}
