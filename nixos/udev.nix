{pkgs, ...}:

{
  services.udev.extraRules = ''
      SUBSYSTEM=="i2c-dev", KERNEL=="i2c-[0-9]*", ATTRS{class}=="0x030000", TAG+="uaccess"
      SUBSYSTEM=="dri", KERNEL=="card[0-9]*", TAG+="uaccess"
      ACTION=="add", SUBSYSTEM=="usb", KERNEL=="1-2", RUN+="/bin/sh -c 'echo -n $kernel > /sys/bus/usb/drivers/usb/unbind'"
  '';
}
