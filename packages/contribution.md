This is just a checklist for myself before contributing to [nixpkgs](https://github.com/NixOS/nixpkgs).

  * GitHub adds an empty commit after each fork update. That's not accepted by nixpkgs guidlines.
  * Just the last commit is enough for cloning:
  ```
  git clone --depth 1 git@github.com:aliheidary1381/nixpkgs.git
  ```
  * Every commit message should follow the pattern `pkg: version -> version` or `pkg: init at version`.
  * Run `nix fmt` before **every** commit.
  * Run `nix-build -A pkg` just to make sure it builds.
  * Use `nixpkgs-review wip` to make sure that all packages depending on the updated one still build.
