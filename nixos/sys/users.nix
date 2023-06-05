{
  pkgs,
  defaultUser,
  ...
}: {
  # Ensure the plugdev group exists, so it could be used for udev rules
  users.groups.plugdev = {};

  users.users."${defaultUser}" = {
    shell = pkgs.fish;
    initialPassword = "";
    isNormalUser = true;
    extraGroups = ["wheel" "lxd" "podman" "docker" "plugdev" "libvirtd"];
  };

  users.users.martinnikov = {
    isNormalUser = true;
    description = "Martin Nikov";
    extraGroups = ["wheel"];
    hashedPassword = "$y$j9T$FCeKDh7VaDC30R.UiljAl.$akMNfiZH11z9q5Jr59fjHaDYDwFzWmyV9rciUz/HDK3";
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCsHIFfNE0an9Le5d+1N4qbSpuz/kJu0LM1DpIPl8tLKpS6lSx+vv7bAjI+e7FqKmKGJf+ydE6W7etiWxgpFi+oJmVQRV43zXdf6NAhbU1rRV30ymtNvdhv3/fPHYbRRibYaeH4mbUVI1VHr0o4brJsdL/k5qQFSOuUb3TsuAXEp9WWwlUUTlWTHOEaowIE2xUofJ7GxOFvfKYEky4ELpGgJjYGPtKdt4FnL09rnkBvA8QqU1yy/6SODkMjfsCKhvdmwddh1ys2ai6RvS6aDGas8w70R2rpz0qmyOnrmfzSFyLWZFDG2pa/R/qoY96kkctkxQaEwmSQnwdjsZT6K2uIZyD8T8xXm+C3l91HX53vuaS1XPDdc7dBfAX5qp8lT/CRNPdYS2ZgM7DK/830uYMUNUDyE542DeiMO0NhpTX7GcwH3NyxSv85bcNqGHezlEpQd6DVTK/hGld0gar3ouF8Aecntr8Smhryrk48Q8WTvzO1oss5DKjKuA1jvJ48240= martin@martinn-mclabs-desktop"
    ];
  };
}
