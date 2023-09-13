{
  description = "A very basic flake";

  inputs.super-upstream = {
    url = "github:radvendii/nix-flake-dep-test-super-upstream";
    flake = false;
  };

  outputs = { self, super-upstream, nixpkgs }: {

    packages.x86_64-linux.default = nixpkgs.legacyPackages.x86_64-linux.runCommand "name" {} ''
      echo super-upstream version: ${super-upstream.shortRev} > $out
    '';
  };
}
