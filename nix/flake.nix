{
  description = "dairnarth nix-darwin config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs }:
  let
    configuration = { pkgs, config, ... }: {
      environment.systemPackages = [
        pkgs.abcm2ps
        pkgs.abcmidi
        pkgs.bat
        pkgs.betterdisplay
        pkgs.btop
        pkgs.cmake
        pkgs.eza
        pkgs.ghostscript
        #pkgs.ghostty
        pkgs.gimp
        pkgs.git
        pkgs.kitty
        pkgs.mkalias
        pkgs.mpv
        pkgs.neovim
        pkgs.raycast
        pkgs.sqlitebrowser
        pkgs.stow
        pkgs.texliveFull
        pkgs.tmux
        pkgs.zathura
        pkgs.zig
      ];

      fonts.packages = [
        pkgs.anonymousPro
      ];

      programs.fish.enable = true;
      nixpkgs.config.allowUnfree = true;
      nix.settings.experimental-features = "nix-command flakes";

      system.primaryUser = "dcairnshowarth";
      system = {
        defaults = {
          dock.autohide = true;
          finder = {
            AppleShowAllExtensions = true;
            FXPreferredViewStyle = "clmv";
          };
          LaunchServices.LSQuarantine = false;
          loginwindow.GuestEnabled = false;
          menuExtraClock = {
            Show24Hour = true;
            ShowDate = 1;
            ShowSeconds = true;
          };
          trackpad = {
            Clicking = true;
            Dragging = true;
            TrackpadRightClick = true;
          };
          NSGlobalDomain = {
            AppleICUForce24HourTime = true;
            AppleInterfaceStyle = "Dark";
            KeyRepeat = 2;
          };
        };
        keyboard = {
          enableKeyMapping = true;
          remapCapsLockToEscape = true;
        };
        configurationRevision = self.rev or self.dirtyRev or null;
        stateVersion = 5;
        activationScripts.applications.text = let
          env = pkgs.buildEnv {
            name = "system-applications";
            paths = config.environment.systemPackages;
            pathsToLink = "/Applications";
          };
        in
          pkgs.lib.mkForce ''
            # Set up applications.
            echo "setting up /Applications..." >&2
            rm -rf /Applications/Nix\ Apps
            mkdir -p /Applications/Nix\ Apps
            find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
            while read -r src; do
              app_name=$(basename "$src")
              echo "copying $src" >&2
              ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
            done
          '';
        };
    };
    intel = { ... }: {
      nixpkgs.hostPlatform = "x86_64-darwin";
    };
    arm = { ... }: {
      nixpkgs.hostPlatform = "aarch64-darwin";
    };
  in
  {
    darwinConfigurations."Dylans-Mac-mini" = nix-darwin.lib.darwinSystem {
      modules = [ configuration intel ];
    };
  };
}
