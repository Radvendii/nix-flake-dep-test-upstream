{
  description = "A very basic flake";

  outputs = { self, nixpkgs }: {

    packages.x86_64-linux.default = nixpkgs.legacyPackages.x86_64-linux.runCommand "name" {} ''
      (
        echo "self: ${self}"
        echo "rev: ${self.rev or "none"}"
        echo "shortRev: ${self.shortRev or "none"}"
        echo "lastModified: ${builtins.toString self.lastModified}"
        echo "lastModifiedDate: ${self.lastModifiedDate}"
        echo "narHash: ${self.narHash}"
        echo "outPath: ${self.outPath}"
      ) > $out
    '';

    packages.x86_64-linux.foo = builtins.trace "${self}" (import "${self}/foo.nix" nixpkgs.legacyPackages.x86_64-linux);

  };
}
