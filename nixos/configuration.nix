{ config, lib, zen-browser, pkgs, ... }:
{
  imports =
    [ 
      ./hardware-configuration.nix
      ./udev.nix
      ./nvidia.nix
    ];

  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;

    extraModulePackages = [config.boot.kernelPackages.ddcci-driver];
    kernelModules =[ "i2c-dev" "ddcci_backlight" ];
    kernelParams = [
      "quiet"
      "loglevel=3"
      "usbcore.autosuspend=-1"
      "usbcore.quirks=1-2:k"
    ];

    loader = {
      # Hide the OS choice for bootloaders.
      # It's still possible to open the bootloader list by pressing any key
      # It will just not appear on screen unless a key is pressed
      # reference: https://github.com/RuanBuitendag42/nix-dotfiles/blob/5967dae00144103373a436d4ece04e641ac1b0e2/system/configuration.nix#L46-L50 
      timeout = 0;
      systemd-boot.configurationLimit = 5;
    };
  };


  /* 
  this breaks reproducability for this system according to chatgpt
  since I am using flakes now.
  system.copySystemConfiguration = true; */

  system.stateVersion = "24.11"; 

  networking.hostName = "nixos"; 
  networking.networkmanager.enable = true; 

  # Set your time zone.
  time.timeZone = "Asia/Kathmandu";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    packages = [pkgs.terminus_font];
    font = "${pkgs.terminus_font}/share/consolefonts/ter-v32n";
    keyMap = "us";
  };

  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
  };
  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;
  services.openssh.enable = true;
  services.logind.settings.Login = {
    HandleLidSwitch = "ignore";
  };

  environment.variables.EDITOR = "nvim";
  environment.variables.VISUAL = "nvim";
  environment.sessionVariables = {
    /* Wayland support. https://nixos.wiki/wiki/Wayland */
    NIXOS_OZONE_WL="1";
    MOZ_ENABLE_WAYLAND="1";
    XDG_SESSION_TYPE="wayland";
  };

  programs.firefox.enable = true;
  programs.tmux.enable = true;
  programs.zsh.enable = true;
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  # https://nixos.wiki/wiki/Mtr
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
    ];
  };

  users.users.saroj = {
    isNormalUser = true;
    # i2c group has permission to change display settings. and other i2c based
    # settings.
    extraGroups = [ "wheel" "networkmanager" "i2c"];
    shell = pkgs.zsh;
  };


  # List packages installed in system profile. To search, run:
  # $ nix search nixpkgs wget
  environment.systemPackages = with pkgs; [
    vim 
    wget
    ghostty
    kitty
    ranger
    neovim
    brave
    git
    jq
    fzf
    zsh
    lshw
    ani-cli
    gcc15
    cmake
    wofi
    wofi-emoji
    fnm
    nodejs_24
    bun
    swww
    zoxide
    btop
    brave
    traceroute
    pipewire
    go
    obsidian
    ddcutil
    wl-clipboard
    wl-clip-persist
    xdg-desktop-portal-hyprland

    # screenshot
    slurp
    swappy
    grim
    feh # image viewer. 
    mpv # the media player used by ani-cli.

    obs-studio

    # http://www.dest-unreach.org/socat/
    # used for bidirectional data transfer between two different socket. 
    # I am using it to listen to hdmi plug and unplug event using socket.
    socat

    usbutils

    zen-browser.packages.${pkgs.system}.default

    (import ./neovim.nix { inherit stdenv fetchFromGitHub pkgconfig cmake makeWrapper lib; })
  ];

  nix.settings.experimental-features = ["nix-command" "flakes"];

  hardware.graphics.enable = true;

  # Required to install unfree software such as nvidia-utils and obsidian
  nixpkgs.config.allowUnfree = true;

  # Automatically cleans the builds
  nix.gc = {
    automatic = true;
    dates = "daliy";
    options = "--delete-older-than +5";
  };
  # uses symlinks to existing store to optimize storage.
  /* nix.settings.auto-optimize-store = true; */

  networking.firewall.enable = false;
}
