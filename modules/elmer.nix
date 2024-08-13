{ lib, config, inputs, pkgs, ... }:
let
  inherit (lib) mkEnableOption mkIf;
in
{
  options.wsl.elmer.enable = mkEnableOption "ElmerFEM";
  config = mkIf config.wsl.elmer.enable {
    environment.systemPackages = [ inputs.elmer.packages.x86_64-linux.gui pkgs.mpi ];
  };
}
