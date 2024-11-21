{ pkgs,... }:
{
  security.pam.enableSudoTouchIdAuth = true;
  system.defaults = {
    dock.autohide = true;
  };

  fonts.packages = with pkgs; [
    (nerdfonts.override {
      fonts = [
        "FiraCode"
        "DroidSansMono"
      ];
    })
  ];
}
