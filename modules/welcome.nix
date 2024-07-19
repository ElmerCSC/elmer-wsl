{
  lib,
  pkgs,
  config,
  ...
}: let
  welcomeMessage = pkgs.writeText "nixos-wsl-welcome-message" ''
    [38;2;0;0;0m [0m[38;2;0;0;0m [0m[38;2;0;0;0m [0m[38;2;0;0;0m [0m[38;2;0;0;0m [0m[38;2;0;0;0m [0m[38;2;73;63;0m.[0m[38;2;126;89;0m;[0m[38;2;156;91;15m;[0m[38;2;182;91;39m:[0m[38;2;188;79;41m;[0m[38;2;197;85;28m:[0m[38;2;199;94;4m:[0m[38;2;199;126;0ml[0m[38;2;197;176;0mk[0m[38;2;150;196;0mk[0m[38;2;108;196;0mx[0m[38;2;90;196;12mx[0m[38;2;80;188;36md[0m[38;2;86;183;42md[0m[38;2;95;171;31md[0m[38;2;88;139;7mc[0m[38;2;92;109;0m;[0m[38;2;39;41;0m.[0m[38;2;0;0;0m [0m[38;2;0;0;0m [0m[38;2;0;0;0m [0m[38;2;0;0;0m [0m[38;2;0;0;0m [0m[38;2;0;0;0m [0m
    [38;2;0;0;0m [0m[38;2;0;0;0m [0m[38;2;0;0;0m [0m[38;2;42;37;0m.[0m[38;2;126;92;1m;[0m[38;2;174;95;46m:[0m[38;2;199;70;121m:[0m[38;2;200;66;154m:[0m[38;2;200;73;172m:[0m[38;2;200;42;180m,[0m[38;2;200;6;164m.[0m[38;2;200;0;105m.[0m[38;2;200;15;25m.[0m[38;2;200;82;0m:[0m[38;2;195;165;0mx[0m[38;2;122;197;0mk[0m[38;2;43;197;1md[0m[38;2;0;197;55md[0m[38;2;0;197;140md[0m[38;2;0;180;178mo[0m[38;2;0;153;178ml[0m[38;2;1;153;165mc[0m[38;2;33;172;140mo[0m[38;2;83;186;95mx[0m[38;2;88;147;22ml[0m[38;2;64;75;0m'[0m[38;2;0;0;0m [0m[38;2;0;0;0m [0m[38;2;0;0;0m [0m[38;2;0;0;0m [0m
    [38;2;0;0;0m [0m[38;2;0;0;0m [0m[38;2;104;86;0m,[0m[38;2;189;91;63m:[0m[38;2;200;57;144m;[0m[38;2;200;121;183mo[0m[38;2;200;170;189mO[0m[38;2;200;155;189mk[0m[38;2;200;103;187ml[0m[38;2;200;29;154m'[0m[38;2;200;25;98m'[0m[38;2;199;70;39m;[0m[38;2;197;122;2ml[0m[38;2;196;156;0md[0m[38;2;196;185;0mk[0m[38;2;173;193;0mk[0m[38;2;142;193;0mk[0m[38;2;104;195;13mx[0m[38;2;46;197;68mx[0m[38;2;8;192;131md[0m[38;2;0;155;174ml[0m[38;2;0;79;188m'[0m[38;2;0;32;189m.[0m[38;2;0;66;188m.[0m[38;2;3;143;168mc[0m[38;2;67;190;106mx[0m[38;2;98;158;20mo[0m[38;2;37;39;0m.[0m[38;2;0;0;0m [0m[38;2;0;0;0m [0m
    [38;2;27;27;0m [0m[38;2;153;116;0mc[0m[38;2;199;70;65m;[0m[38;2;200;67;176m:[0m[38;2;200;143;189mx[0m[38;2;200;162;189mk[0m[38;2;200;109;183mo[0m[38;2;200;45;146m,[0m[38;2;198;74;84m:[0m[38;2;162;152;12md[0m[38;2;126;183;42mx[0m[38;2;92;195;67mx[0m[38;2;69;197;48mx[0m[38;2;89;197;8mx[0m[38;2;164;192;0mk[0m[38;2;200;115;0ml[0m[38;2;200;71;28m;[0m[38;2;199;73;63m;[0m[38;2;194;108;58ml[0m[38;2;171;143;22mo[0m[38;2;126;180;38mx[0m[38;2;42;188;116md[0m[38;2;0;151;170mc[0m[38;2;0;86;188m'[0m[38;2;0;42;189m.[0m[38;2;0;101;188m,[0m[38;2;16;182;145md[0m[38;2;113;184;16mx[0m[38;2;77;85;0m'[0m[38;2;0;0;0m [0m
    [38;2;151;120;0mc[0m[38;2;199;59;28m,[0m[38;2;200;1;139m.[0m[38;2;200;58;188m;[0m[38;2;200;70;184m:[0m[38;2;200;40;157m,[0m[38;2;199;65;71m;[0m[38;2;169;156;6md[0m[38;2;86;194;61mx[0m[38;2;2;164;159ml[0m[38;2;0;134;183m:[0m[38;2;4;164;175ml[0m[38;2;69;195;94mx[0m[38;2;89;179;14md[0m[38;2;139;162;0md[0m[38;2;177;109;0mc[0m[38;2;192;79;48m:[0m[38;2;199;41;136m,[0m[38;2;200;68;185m:[0m[38;2;200;74;174m:[0m[38;2;200;40;126m,[0m[38;2;184;127;28ml[0m[38;2;114;190;30mx[0m[38;2;22;192;112md[0m[38;2;0;161;173ml[0m[38;2;0;140;187mc[0m[38;2;0;172;181mo[0m[38;2;14;197;76md[0m[38;2;120;189;1mx[0m[38;2;73;77;0m'[0m
    [38;2;194;125;0ml[0m[38;2;200;24;22m.[0m[38;2;200;1;79m.[0m[38;2;200;0;104m.[0m[38;2;200;13;75m.[0m[38;2;200;65;25m;[0m[38;2;165;177;0mx[0m[38;2;41;197;29md[0m[38;2;0;194;143md[0m[38;2;4;159;165ml[0m[38;2;78;179;106md[0m[38;2;71;127;24m:[0m[38;2;36;42;0m.[0m[38;2;0;0;0m [0m[38;2;0;0;0m [0m[38;2;0;0;0m [0m[38;2;0;0;0m [0m[38;2;80;58;1m.[0m[38;2;168;83;67m;[0m[38;2;199;62;143m;[0m[38;2;200;42;174m,[0m[38;2;200;6;91m.[0m[38;2;198;107;0mc[0m[38;2;141;191;4mk[0m[38;2;37;197;50md[0m[38;2;3;197;95md[0m[38;2;0;197;102md[0m[38;2;7;197;49md[0m[38;2;73;197;1mx[0m[38;2;150;171;0md[0m
    [38;2;200;160;0mx[0m[38;2;200;125;0ml[0m[38;2;199;111;0mc[0m[38;2;199;113;0ml[0m[38;2;200;129;0mo[0m[38;2;199;164;0mx[0m[38;2;160;196;0mk[0m[38;2;105;196;6mx[0m[38;2;87;196;36mx[0m[38;2;130;197;18mk[0m[38;2;75;84;0m'[0m[38;2;0;0;0m [0m[38;2;0;0;0m [0m[38;2;0;0;0m [0m[38;2;0;0;0m [0m[38;2;0;0;0m [0m[38;2;0;0;0m [0m[38;2;0;0;0m [0m[38;2;0;0;0m [0m[38;2;168;128;3ml[0m[38;2;199;94;35mc[0m[38;2;199;91;23m:[0m[38;2;199;127;0mo[0m[38;2;193;183;0mk[0m[38;2;148;197;0mk[0m[38;2;120;196;0mk[0m[38;2;112;196;0mx[0m[38;2;119;196;0mx[0m[38;2;142;197;0mk[0m[38;2;182;196;0mO[0m
    [38;2;155;197;0mk[0m[38;2;112;197;0mx[0m[38;2;95;197;3mx[0m[38;2;96;197;4mx[0m[38;2;114;197;0mx[0m[38;2;157;197;0mk[0m[38;2;199;151;0md[0m[38;2;200;86;11m:[0m[38;2;200;65;54m;[0m[38;2;200;110;35ml[0m[38;2;107;89;0m,[0m[38;2;0;0;0m [0m[38;2;0;0;0m [0m[38;2;0;0;0m [0m[38;2;0;0;0m [0m[38;2;0;0;0m [0m[38;2;0;0;0m [0m[38;2;0;0;0m [0m[38;2;33;34;0m [0m[38;2;123;171;11md[0m[38;2;76;197;57mx[0m[38;2;73;197;35mx[0m[38;2;116;197;0mx[0m[38;2;184;188;0mk[0m[38;2;200;132;0mo[0m[38;2;200;100;2mc[0m[38;2;200;92;6m:[0m[38;2;200;100;1mc[0m[38;2;200;128;0mo[0m[38;2;198;175;0mk[0m
    [38;2;126;188;0mx[0m[38;2;21;197;26md[0m[38;2;0;197;92md[0m[38;2;0;196;123md[0m[38;2;6;196;95md[0m[38;2;52;197;38mx[0m[38;2;172;170;0mx[0m[38;2;200;52;28m,[0m[38;2;200;5;143m.[0m[38;2;200;67;177m:[0m[38;2;197;77;126m:[0m[38;2;149;72;49m,[0m[38;2;81;64;0m.[0m[38;2;0;0;0m [0m[38;2;0;0;0m [0m[38;2;0;0;0m [0m[38;2;41;44;0m.[0m[38;2;67;104;9m;[0m[38;2;78;171;92md[0m[38;2;22;157;158ml[0m[38;2;0;163;180ml[0m[38;2;13;196;89md[0m[38;2;122;193;0mx[0m[38;2;196;125;9ml[0m[38;2;200;26;68m.[0m[38;2;200;1;116m.[0m[38;2;200;0;120m.[0m[38;2;200;3;58m.[0m[38;2;200;72;1m;[0m[38;2;163;139;0mo[0m
    [38;2;120;141;0ml[0m[38;2;73;196;24mx[0m[38;2;0;196;136md[0m[38;2;0;140;188mc[0m[38;2;0;130;187m:[0m[38;2;0;164;169ml[0m[38;2;47;194;91mx[0m[38;2;141;178;16mx[0m[38;2;192;108;44mc[0m[38;2;200;43;144m,[0m[38;2;200;73;174m:[0m[38;2;200;44;178m,[0m[38;2;199;41;102m,[0m[38;2;197;90;17m:[0m[38;2;179;146;0mo[0m[38;2;109;186;0mx[0m[38;2;66;195;53mx[0m[38;2;17;190;144md[0m[38;2;0;147;180mc[0m[38;2;1;159;161ml[0m[38;2;51;190;109md[0m[38;2;147;170;18md[0m[38;2;197;92;48mc[0m[38;2;200;27;130m'[0m[38;2;200;74;181m:[0m[38;2;200;84;188mc[0m[38;2;200;39;181m,[0m[38;2;200;22;71m.[0m[38;2;186;123;0ml[0m[38;2;63;58;0m.[0m
    [38;2;0;0;0m [0m[38;2;109;133;0mc[0m[38;2;89;195;50mx[0m[38;2;3;158;169ml[0m[38;2;0;66;189m.[0m[38;2;0;34;189m.[0m[38;2;0;101;187m,[0m[38;2;1;162;161ml[0m[38;2;49;192;107mx[0m[38;2;137;174;24mx[0m[38;2;173;143;19mo[0m[38;2;192;115;41ml[0m[38;2;199;94;31mc[0m[38;2;200;107;4mc[0m[38;2;195;167;0mx[0m[38;2;131;197;0mk[0m[38;2;96;196;16mx[0m[38;2;102;195;40mx[0m[38;2;131;181;31mx[0m[38;2;162;153;10md[0m[38;2;192;103;59mc[0m[38;2;200;42;135m,[0m[38;2;200;95;179ml[0m[38;2;200;154;189mx[0m[38;2;200;162;189mk[0m[38;2;200;99;186ml[0m[38;2;199;36;132m'[0m[38;2;177;115;9mc[0m[38;2;70;64;0m.[0m[38;2;0;0;0m [0m
    [38;2;0;0;0m [0m[38;2;0;0;0m [0m[38;2;65;74;0m'[0m[38;2;97;174;43md[0m[38;2;47;181;126md[0m[38;2;0;133;174m:[0m[38;2;0;61;188m.[0m[38;2;0;44;189m.[0m[38;2;0;94;188m,[0m[38;2;0;173;167mo[0m[38;2;10;196;116md[0m[38;2;46;197;52md[0m[38;2;102;196;6mx[0m[38;2;146;196;0mk[0m[38;2;184;194;0mO[0m[38;2;199;162;0mx[0m[38;2;199;122;0ml[0m[38;2;200;77;20m;[0m[38;2;200;24;85m.[0m[38;2;200;17;147m.[0m[38;2;200;70;182m:[0m[38;2;200;136;189md[0m[38;2;200;164;189mk[0m[38;2;200;142;186mx[0m[38;2;200;72;155m:[0m[38;2;197;87;84m:[0m[38;2;143;92;8m;[0m[38;2;0;0;0m [0m[38;2;0;0;0m [0m[38;2;0;0;0m [0m
    [38;2;0;0;0m [0m[38;2;0;0;0m [0m[38;2;0;0;0m [0m[38;2;0;0;0m [0m[38;2;85;102;0m;[0m[38;2;98;157;23mo[0m[38;2;81;186;100mx[0m[38;2;32;174;138mo[0m[38;2;1;163;159ml[0m[38;2;0;173;170mo[0m[38;2;0;194;156md[0m[38;2;0;197;101md[0m[38;2;15;197;24md[0m[38;2;83;197;0mx[0m[38;2;167;192;0mk[0m[38;2;200;119;0ml[0m[38;2;200;40;1m'[0m[38;2;200;0;54m.[0m[38;2;200;0;134m.[0m[38;2;200;21;168m'[0m[38;2;200;50;167m;[0m[38;2;200;55;150m;[0m[38;2;199;67;122m;[0m[38;2;183;88;71m:[0m[38;2;129;84;8m,[0m[38;2;49;44;0m.[0m[38;2;0;0;0m [0m[38;2;0;0;0m [0m[38;2;0;0;0m [0m[38;2;0;0;0m [0m
    [38;2;0;0;0m [0m[38;2;0;0;0m [0m[38;2;0;0;0m [0m[38;2;0;0;0m [0m[38;2;0;0;0m [0m[38;2;0;0;0m [0m[38;2;40;43;0m.[0m[38;2;101;115;0m:[0m[38;2;92;136;2mc[0m[38;2;95;166;18mo[0m[38;2;98;180;22md[0m[38;2;110;194;14mx[0m[38;2;114;196;1mx[0m[38;2;140;196;0mk[0m[38;2;181;194;0mO[0m[38;2;200;155;0md[0m[38;2;199;122;0ml[0m[38;2;199;108;6mc[0m[38;2;188;98;20mc[0m[38;2;178;98;22m:[0m[38;2;159;96;11m:[0m[38;2;122;87;0m,[0m[38;2;80;71;0m'[0m[38;2;0;0;0m [0m[38;2;0;0;0m [0m[38;2;0;0;0m [0m[38;2;0;0;0m [0m[38;2;0;0;0m [0m[38;2;0;0;0m [0m[38;2;0;0;0m [0m

      Welcome to the ElmerFEM WSL environment!

      Please run `sudo nix-channel --update` and `sudo nixos-rebuild switch` now, to ensure you're running the latest NixOS and NixOS-WSL versions.

      Note: this message will disappear after you rebuild your system. If you want to see it again, run `nixos-wsl-welcome`.
  '';
  welcome = pkgs.writeShellScriptBin "nixos-wsl-welcome" ''
    cat ${welcomeMessage}
  '';
in {
  config = lib.mkIf config.wsl.enable {
    environment.systemPackages = [welcome];
  };
}
