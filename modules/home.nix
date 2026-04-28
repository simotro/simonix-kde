{ pkgs, ... }: {
  home.stateVersion = "26.05";
  };

  home.packages = with pkgs; [
    firefox
    insync
    megasync
    proton-pass
    vscodium
  ];
}
