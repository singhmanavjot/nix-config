{ lib, ... }:
with lib.hm.gvariant;
{
  dconf.settings = {
    "ca/desrt/dconf-editor" = {
      show-warning = false;
    };
    "org/virt-manager/virt-manager/connections" = {
    autoconnect = ["qemu:///system"];
    uris = ["qemu:///system"];
  };
  };
}
