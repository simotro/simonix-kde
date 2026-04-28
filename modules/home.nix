{ pkgs, ... }:

{
  home.username = "simone";
  home.homeDirectory = "/home/simone";

  home.stateVersion = "26.05";

  # Qui metterai i tuoi pacchetti utente
  home.packages = with pkgs; [
    firefox
    insync
    megasync
    proton-pass
    #vscodium
  ];

  # Abilita Home Manager a gestire se stesso
  programs.home-manager.enable = true;
}
