{ config, pkgs, inputs, ... }:

{
  imports =
    [
      ./hardware.nix # Importa le configurazioni hardware della macchina
      ../../common/default.nix # Importa le configurazioni comuni a tutti i PC
    ];

  # Bootloader UEFI
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "vm-test"; # Il nome del computer

  # Abilita il networking
  networking.networkmanager.enable = true;

  # --- CONFIGURAZIONE DESKTOP ---

  # Abilita il sistema grafico X11/Wayland
  services.xserver.enable = true;

  # Abilita KDE Plasma 6
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Abilita l'audio
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # --- UTENTE ---

  users.users.simone = {
    isNormalUser = true;
    description = "Il mio utente principale";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # --- IMPOSTAZIONI NIX ---

  # Abilita i Flakes e i nuovi comandi Nix
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Permetti software non-free (necessario per driver o app come Chrome/Discord)
  nixpkgs.config.allowUnfree = true;

  # Questa opzione definisce la versione di NixOS con cui hai iniziato.
  # NON cambiarla, serve per la compatibilità con i vecchi file di stato.
  system.stateVersion = "26.05";
}
