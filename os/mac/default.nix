{ ... }: {
  security.pam.enableSudoTouchIdAuth = true;
  system.defaults = { dock.autohide = true; };
}
