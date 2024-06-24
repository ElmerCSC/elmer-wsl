{
  runCommand,
  alejandra,
  ...
}:
runCommand "check-alejandra" {nativeBuildInputs = [alejandra];} ''
  alejandra --check ${./..}
  touch $out
''
