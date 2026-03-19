{pkgs, zen-browser, ...}: 
{
  # List packages installed in system profile. To search, run:
  # $ nix search nixpkgs wget
  environment.systemPackages = with pkgs; [
    vim 
    wget
    ghostty
    kitty
    ranger
    brave
    git
    jq
    fzf
    zsh
    lshw
    ani-cli
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
    ffmpeg

    # http://www.dest-unreach.org/socat/
    # used for bidirectional data transfer between two different socket. 
    # I am using it to listen to hdmi plug and unplug event using socket.
    socat

    usbutils

    zen-browser.packages.${pkgs.system}.default

    /* (import ./neovim.nix { inherit stdenv fetchFromGitHub pkgconfig cmake makeWrapper lib; }) */

    # c tools and utils
    gcc15
    cmake
    gnumake

    # rust tools and utils
    rustup

    # wasm toolchain
    emscripten
    wasilibc
    clang-tools
  ];
}
