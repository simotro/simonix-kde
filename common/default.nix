{ pkgs, ... }:

{
  # Tutto ciò che è "comune" a tutti i miei computer
  time.timeZone = "Europe/Rome";
  i18n.defaultLocale = "it_IT.UTF-8";

  # Configurazione tastiera italiana ovunque
  services.xserver.xkb.layout = "it";
  console.keyMap = "it2";

  # Servizi base
  services.printing.enable = true; # Stampanti
  services.pipewire.enable = true; # Audio

  # Software che deve esserci per forza (senza interfaccia grafica)
  environment.systemPackages = with pkgs; [
    micro
    git
    curl
    wget
    fastfetch
    unzip
  ];

  # Ottimizzazione automatica del sistema (pulizia file vecchi ogni settimana)
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };
}
