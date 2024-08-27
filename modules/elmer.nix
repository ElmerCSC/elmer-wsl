{ lib, config, pkgs, ... }:
let
  inherit (lib) mkEnableOption mkIf;
in
{
  options.wsl.elmer.enable = mkEnableOption "ElmerFEM";
  config = mkIf config.wsl.elmer.enable {
    nix.settings = {
      extra-substituters = [
        "https://elmerfem.cachix.org"
      ];
      extra-trusted-public-keys = [
        "elmerfem.cachix.org-1:nWIb5JzEzC2/W6qiuaC0urJRG+S7KvTn9WatX43gkHk="
      ];
    };

    environment.systemPackages = with pkgs; [ elmer-gui mpi ];
  };
}
