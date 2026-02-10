{pkgs,config, ...}:

let
  nvidia-offload = pkgs.writeShellScriptBin "nvidia-offload" ''
    export __NV_PRIME_RENDER_OFFLOAD=1
    export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0
    export __GLX_VENDOR_LIBRARY_NAME=nvidia
    export __VK_LAYER_NV_optimus=NVIDIA_only
    exec "$@"
    '';
in {
  # Somehow even if I am using wayland this is required, nvidia packages were not installed
  # when this was not set.
  services.xserver.videoDrivers = ["nvidia"];

  environment.sessionVariables = {
    /* https://wiki.hypr.land/0.52.0/Nvidia/#environment-variables */
    LIBVA_DRIVER_NAME = "nvidia";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
  };

  environment.systemPackages = with pkgs; [
    nvidia-offload
  ];

  hardware.nvidia = {
    modesetting.enable = true;

    powerManagement = {
      enable = true; 
      finegrained = true;
    };

    # Use the NVidia open source kernel module (not to be confused with the
    # independent third-party "nouveau" open source driver).
    # Support is limited to the Turing and later architectures. Full list of 
    open = true;

    nvidiaSettings = true;

    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };
      intelBusId = "PCI:0:0:2";
      nvidiaBusId = "PCI:0:1:0";
    };

    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
}
