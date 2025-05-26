# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      <home-manager/nixos>
      <musnix>
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernel.sysctl = {
    "kernel.yama.ptrace_scope" = 0;
    "kernel.perf_event_paranoid" = -1;
  };

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
  # systemd.network.wait-online.enable = false;
  # boot.initrd.systemd.network.wait-online.enable = false;

  # VPN
  services.mullvad-vpn.enable = true;
  services.mullvad-vpn.package = pkgs.mullvad-vpn;

  # Set your time zone.
  time.timeZone = "Europe/Stockholm";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "sv_SE.UTF-8";
    LC_IDENTIFICATION = "sv_SE.UTF-8";
    LC_MEASUREMENT = "sv_SE.UTF-8";
    LC_MONETARY = "sv_SE.UTF-8";
    LC_NAME = "sv_SE.UTF-8";
    LC_NUMERIC = "sv_SE.UTF-8";
    LC_PAPER = "sv_SE.UTF-8";
    LC_TELEPHONE = "sv_SE.UTF-8";
    LC_TIME = "sv_SE.UTF-8";
  };

  location.longitude = 18.08;
  location.latitude = 59.32;

  services.redshift = {
    enable = true;
    brightness = {
      day = "1";
      night = "1";
    };
    temperature = {
      day = 5500;
      night = 3700;
    };
  };

  nixpkgs.config.allowUnfree = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the XFCE Desktop Environment.
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.desktopManager.xfce.enable = true;

  hardware.opengl.enable = true;
  hardware.opengl.extraPackages = [ pkgs.mesa.drivers ];

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "se";
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "sv-latin1";

  # Enable CUPS to print documents.
  services.printing.enable = true;
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  # @audio
  musnix.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  users.users.ludviggl = {
    isNormalUser = true;
    description = "Ludvig Gunne Lindström";
    extraGroups = [ "networkmanager" "wheel" "audio" "docker" ];
    shell = pkgs.bash;
    useDefaultShell = true;
    packages = with pkgs; [
      gdb
      ccache
    ];
  };

  services.nixseparatedebuginfod.enable = true;

  # @home
  home-manager.users.ludviggl = {
    home.stateVersion = "24.05";
    home.packages = import ./hm-packages.nix { inherit pkgs; };

    # @extra
    xdg.configFile."ghostty/config".source = ./extra/ghostty-config;
    xdg.configFile."helix/config.toml".source = ./extra/helix-config.toml;
    # xdg.configFile."helix/themes/monochrome.toml".source = ./extra/helix-monochrome.toml;
    xdg.configFile."helix/themes/base16_transparent-patch.toml".source = ./extra/helix-base16_transparent-patch.toml;
    home.file.".gdbinit".text = import ./gdbinit.nix { inherit pkgs; };
    home.file.".bashrc".source = ./extra/bashrc;
    home.file.".bash_profile".source = ./extra/bash_profile;

    # @programs
    programs.git = import ./git.nix;
    programs.tmux = import ./tmux.nix;
    programs.bat = import ./bat.nix;
    programs.gpg = import ./gpg.nix;
    programs.direnv = import ./direnv.nix;

    # @services
    services.gpg-agent = import ./gpg-agent.nix { inherit pkgs; };
  };

  # @fonts
  fonts.packages = import ./fonts.nix { inherit pkgs; };

  environment.systemPackages = with pkgs; [ ntfs3g ];

  documentation.dev.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # virtualisation.virtualbox.host.enable = true;
  # users.extraGroups.vboxusers.members = [ "ludviggl" ];

  virtualisation.docker.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
