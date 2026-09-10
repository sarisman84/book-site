{
  description = "Angular + .Net dev enviroment";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs =
    { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; config.allowUnfree = true; };
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        packages = with pkgs; [
          nodejs
          dotnetCorePackages.sdk_9_0
          opencode
          opencode-desktop
          opencode-claude-auth
        ];
        shellHook = ''
          export DOTNET_ROOT="${pkgs.dotnetCorePackages.sdk_9_0}"
          export PATH="$DOTNET_ROOT:$PATH"
        '';
      };
    };
}
