{
  pkgs,
  lib,
  config,
  ...
}:
let
  acp = pkgs.writeText "acp.json" (
    builtins.toJSON {
      default_mcp_settings = {};
      agent_servers = {
        antigravity-acp = {
          type = "custom";
          command = "${lib.getExe config.ali.packages.antigravity-acp}"; # /run/current-system/sw/bin/agy_acp_server
          args = [ "--uid=" ];
          env = { };
        };
      };
    }
  );
in
{
  home.activation.jetbrainsAcpSettings = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    target="${config.home.homeDirectory}/.jetbrains/acp.json"
    if [ ! -e "$target" ]; then
      install -D --mode=644 --owner=${config.home.username} --group=users ${acp} "$target"
    fi
  '';
}
