{ homebrew, ... }: {
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      upgrade = true;
    };
    brews = homebrew.brews;
    casks = homebrew.casks;
    taps = homebrew.taps;
  };

}
