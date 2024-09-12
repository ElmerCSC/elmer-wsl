# Installation

## System requirements

Elmer-WSL is tested with the Windows Store version of WSL 2, which is now available on all supported Windows releases (both 10 and 11).
Support for older "inbox" versions is best-effort.

## Install Elmer-WSL

First, [download the latest release](https://github.com/ElmerCSC/elmer-wsl/releases/latest).

Then open up a PowerShell and run:

```powershell
wsl --import Elmer --version 2 $env:USERPROFILE\Elmer-WSL\ elmer-wsl.tar.gz
```

Or for Command Prompt:

```cmd
wsl --import Elmer --version 2  %USERPROFILE%\Elmer-WSL\ elmer-wsl.tar.gz
```

This sets up a new WSL distribution `Elmer` that is installed in a directory called `Elmer-WSL` inside your user directory.
`elmer-wsl.tar.gz` is the path to the file you downloaded earlier.
You can adjust the installation path and distribution name to your liking.

To get a shell in your NixOS environment, use:

```powershell
wsl -d Elmer
```

If you chose a different name for your distro during import, adjust this command accordingly.

## Post-Install

After the initial installation, you need to update your channels once, to be able to use `nixos-rebuild`:

```sh
sudo nix-channel --update
```

If you want to make Elmer-WSL your default distribution, you can do so with

```powershell
wsl -s Elmer
```
