{
  lib,
  pkgs,
  config,
  ...
}:
with lib;

let
  cfg = config.programs.aerospace;
  tomlFormat = pkgs.formats.toml { };
in
{
  options = {
    programs.aerospace = {
      enable = mkEnableOption "Aerospace";

      settings = mkOption {
        type = tomlFormat.type;
        default = { };
        description = ''Written to ~/.aeospace.toml'';
      };
    };
  };

  config = mkIf cfg.enable {
    xdg.configFile."aerospace/aerospace.toml" = lib.mkIf (cfg.settings != { }) {
      source = (tomlFormat.generate ".aerospace.toml" cfg.settings).overrideAttrs
        (finalAttrs: prevAttrs: {
          buildCommand = lib.concatStringsSep "\n" [
            prevAttrs.buildCommand
            # TODO: why is this needed? Is there a better way to retain escape sequences?
            "substituteInPlace $out --replace-quiet '\\\\' '\\'"
          ];
        });
    };
  };
}
