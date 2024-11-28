{ pkgs,... }:
{
  security.pam.enableSudoTouchIdAuth = true;
  system.defaults = {
    dock.autohide = true;
  };

  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
    nerd-fonts.droid-sans-mono
    # (nerdfonts.override {
    #   fonts = [
    #     "FiraCode"
    #     "DroidSansMono"
    #   ];
    # })
  ];
}
