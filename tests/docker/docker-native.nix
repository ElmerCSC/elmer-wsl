{
  imports = [
    <elmer-wsl/modules>
  ];

  wsl.enable = true;

  users.users.elmer.extraGroups = [ "docker" ];

  virtualisation.docker.enable = true;
}
