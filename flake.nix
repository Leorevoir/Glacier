{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };
      in
      with pkgs; {
        devShells.default = mkShell {
          buildInputs = [
            # pkg-config
            bash
            # gcc
            # gnumake
            crystal
            # libgmpris
            # gmp
            # libGL
            # libGLU
            glm
            glfw
            glew
            mesa
          ];

          shellHook = ''
            export PKG_CONFIG_PATH=${pkgs.lib.makeLibraryPath [
              # libGL
              # libGLU
              glm
              glfw3
              mesa
            ]}:$PKG_CONFIG_PATH

            export LD_LIBRARY_PATH=${pkgs.lib.makeLibraryPath [
              # libGL
              # libGLU
              glm
              glfw
              mesa
            ]}:$LD_LIBRARY_PATH
          '';
        };
      });
}
