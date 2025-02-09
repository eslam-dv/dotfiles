{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];
  
  # use systemd-boot
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  
  # setup hostname and NetworkManager
  networking.hostName = "hp";
  networking.networkmanager.enable = true;
  
  # set timezone
  time.timeZone = "Africa/Cairo";
  
  # enable xserver ( for xwayland )
  services.xserver = {
    enable = true;
    excludePackages = with pkgs; [
      lightdm
      xterm
    ];
    displayManager.lightdm.enable = false;
    desktopManager = {
      xterm.enable = false;
    };
  };
  # Sound with pipewire
  services.pipewire = {
    enable = true;
    audio.enable = true;
    pulse.enable = true;
    jack.enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
  };
  
  # Define a user account
  users.users.eslam = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "video" "audio" ];
  };
  
  # Environment variables
  environment.sessionVariables = {
    WLR_MO_HARDWARE_CURSOR = "1";
    NIXOS_OZONE_WL = "1";
  };
  
  # Hyperland 
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  
  # Firefox
  programs.firefox.enable = true;

  hardware.bluetooth.enable = true; # enables support for Bluetooth
  services.blueman.enable = true;
  
  # XDG portal
  xdg.portal.enable = true;
  xdg.portal.extraPortals = with pkgs; [
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
  ];
  
  # Allow unfree
  nixpkgs.config.allowUnfree = true;
  
  # System packages
  environment.systemPackages = with pkgs; [
    wget
    dconf
    git
    nodejs
    ripgrep
    unzip
    zip
    curl
    neovim		# Text editor
    wezterm		# Terminal
    wl-clipboard
    wofi		# App runner
    waybar		# Status bar
    zathura		# PDF viewer
    vlc			# Media player
    xfce.thunar	        # File manager
    xfce.thunar-volman
    xfce.thunar-archive-plugin
    xfce.tumbler
    xfce.ristretto	# Image viewer
    xarchiver		# Archiver manager
    ffmpeg
    brightnessctl
    libsForQt5.qt5ct
    nwg-look		# Theme manager
    pavucontrol		# Sound manager
    hyprpaper		# Background manager
    gcc
    lua-language-server
    stylua
    zoxide
    eza
    libreoffice
    filezilla
    bluez
    bluez-tools
    blueman
    stow
  ];

  fonts.packages = with pkgs; [
    liberation_ttf
    noto-fonts-emoji
  ];

  # Enable touchpad support
  services.libinput.enable = true;

  services.gvfs.enable = true;

  services.openssh.enable = true;

  services.dbus.enable = true;

  networking.firewall.enable = false;

  security.polkit.enable = true;

  qt = {
    enable = true;
    platformTheme = "gtk2";
    style = "gtk2";
  };

  system.stateVersion = "24.11";
}
