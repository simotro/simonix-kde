{ pkgs, ... }: {
  home.stateVersion = "26.05";

  programs.plasma = {
    enable = true;
    workspace = {
      lookAndFeel = "org.kde.breezedark.desktop";
      colorScheme = "BreezeDark";
      cursorTheme = "Breeze_Snow";
    };

    panels = [{
      location = "bottom";
      height = 44;
      widgets = [
        "org.kde.plasma.kickoff"
        "org.kde.plasma.icontasks" # Le tue app pinnate andranno qui
        "org.kde.plasma.systemtray"
        "org.kde.plasma.digitalclock"
      ];
    }];
  };

  home.packages = with pkgs; [
    firefox
    insync
    megasync
    proton-pass
    vscodium
  ];
}
