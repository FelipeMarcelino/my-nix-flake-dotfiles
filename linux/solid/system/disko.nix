{
disko.devices = {
    disk = {
      disk0 = {
        device = "/dev/md126";
        type = "disk";
        content = {
          type = "gpt";
          partitions = {
            data = {
              size = "100%";
              content = {
                type = "filesystem";
                format = "ext4";
                mountpoint = "~/Data";
              };
            };
          };
        };
      };
    };
  };
}
