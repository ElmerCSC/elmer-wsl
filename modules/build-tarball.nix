{ config, pkgs, lib, ... }:
with builtins; with lib;
let
  cfg = config.wsl.tarball;

  defaultConfig = pkgs.writeText "default-configuration.nix" ''
    # Edit this configuration file to define what should be installed on
    # your system. Help is available in the configuration.nix(5) man page, on
    # https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

    # NixOS-WSL specific options are documented on the NixOS-WSL repository:
    # https://github.com/nix-community/NixOS-WSL

    { config, lib, pkgs, ... }:
    let
      elmerfem = import <elmerfem>;
    in
    {
      imports = [
        # include NixOS-WSL modules
        <elmer-wsl/modules>
      ];

      wsl.enable = true;
      wsl.defaultUser = "elmer";
      wsl.elmer.enable = true;
      ${lib.optionalString (!config.wsl.nativeSystemd) "wsl.nativeSystemd = false;"}

      nixpkgs.overlays = [ elmerfem.overlay ];

      # This value determines the NixOS release from which the default
      # settings for stateful data, like file locations and database versions
      # on your system were taken. It's perfectly fine and recommended to leave
      # this value at the release version of the first install of this system.
      # Before changing this value read the documentation for this option
      # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
      system.stateVersion = "${config.system.nixos.release}"; # Did you read the comment?
    }
  '';
in
{
  options.wsl.tarball = {
    configPath = mkOption {
      type = types.nullOr types.path;
      default = null;
      description = "Path to system configuration which is copied into the tarball";
    };
  };

  # These options make no sense without the wsl-distro module anyway
  config = mkIf config.wsl.enable {
    system.build.tarballBuilder = pkgs.writeShellApplication {
      name = "elmer-wsl-tarball-builder";

      runtimeInputs = [
        pkgs.coreutils
        pkgs.e2fsprogs
        pkgs.gnutar
        pkgs.nixos-install-tools
        pkgs.pigz
        config.nix.package
      ];

      text = ''
        if ! [ $EUID -eq 0 ]; then
          echo "This script must be run as root!"
          exit 1
        fi

        out=''${1:-elmer-wsl.tar.gz}

        root=$(mktemp -p "''${TMPDIR:-/tmp}" -d elmer-wsl-tarball.XXXXXXXXXX)
        # FIXME: fails in CI for some reason, but we don't really care because it's CI
        trap 'chattr -Rf -i "$root" || true && rm -rf "$root" || true' INT TERM EXIT

        chmod o+rx "$root"

        echo "[Elmer-WSL] Installing..."
        nixos-install \
          --root "$root" \
          --no-root-passwd \
          --system ${config.system.build.toplevel} \
          --substituters ""

        echo "[Elmer-WSL] Adding channels..."
        nixos-enter --root "$root" --command 'HOME=/root nix-channel --add https://github.com/ElmerCSC/Elmer-WSL/archive/refs/heads/main.tar.gz elmer-wsl'
        nixos-enter --root "$root" --command 'HOME=/root nix-channel --add https://github.com/ElmerCSC/elmerfem/archive/refs/heads/devel.tar.gz elmerfem'

        echo "[Elmer-WSL] Adding default config..."
        ${if cfg.configPath == null then ''
          install -Dm644 ${defaultConfig} "$root/etc/nixos/configuration.nix"
        '' else ''
          mkdir -p "$root/etc/nixos"
          cp -R ${lib.cleanSource cfg.configPath}/. "$root/etc/nixos"
          chmod -R u+w "$root/etc/nixos"
        ''}

        echo "[Elmer-WSL] Compressing..."
        tar -C "$root" \
          -c \
          --sort=name \
          --mtime='@1' \
          --owner=0 \
          --group=0 \
          --numeric-owner \
          . \
        | pigz > "$out"
      '';
    };
  };
}
