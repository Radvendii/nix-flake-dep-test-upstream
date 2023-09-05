{
  description = "A very basic flake";

  outputs = { self, nixpkgs }: {

    packages.x86_64-linux.default = nixpkgs.legacyPackages.x86_64-linux.runCommand {} ''
      echo ${self.shortRev} > $out
    '';

  };
}
