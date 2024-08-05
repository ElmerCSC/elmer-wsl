# Elmer-WSL

ElmerFEM in WSL

Fork of [NixOS-WSL](https://github.com/nix-community/NixOS-WSL)

## Quick Start

1. Enable WSL if you haven't done already:

- ```powershell
  wsl --install --no-distribution
  ```

2. Download `elmer-wsl.tar.gz` from [the latest release](https://github.com/ElmerCSC/elmer-wsl/releases/latest).

3. Import the tarball into WSL:

- ```powershell
  wsl --import Elmer $env:USERPROFILE\Elmer-WSL\ elmer-wsl.tar.gz
  ```

4. You can now run NixOS:

- ```powershell
  wsl -d Elmer
  ```

## License

Apache License, Version 2.0. See `LICENSE` or <http://www.apache.org/licenses/LICENSE-2.0.html> for details.
