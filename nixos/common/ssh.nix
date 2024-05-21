{
  services.openssh = {
    enable = true;
    settings = {
      # hardening
      PasswordAuthentication = false;
      PermitRootLogin = "no";
      # automatically remove stale sockets
      StreamLocalBindUnlink = "yes";
    };
  };
}
