{
  description = "Networks client setups";
  outputs =
    { self, nixpkgs }:
    let

      gen = lib:
        ''
          echo '${builtins.toJSON lib}' > networks.autogenerated.json
        '';
    in
    rec {
      packages.x86_64-linux.default = nixpkgs.legacyPackages.x86_64-linux.writeShellScriptBin "default" (gen lib);
      packages.x86_64-darwin.default = nixpkgs.legacyPackages.x86_64-darwin.writeShellScriptBin "default" (gen lib);
      packages.aarch64-linux.default = nixpkgs.legacyPackages.aarch64-linux.writeShellScriptBin "default" (gen lib);
      packages.aarch64-darwin.default = nixpkgs.legacyPackages.aarch64-darwin.writeShellScriptBin "default" (gen lib);
      overlay = final: prev: {
        networksLib = lib;
      };
      lib = import ./networks.nix;
    };
}
