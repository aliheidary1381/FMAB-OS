import os
import socket

PROXY_HOST = "192.168.122.66"
PROXY_PORT = 18888


def proxy_is_up(host: str, port: int, timeout: float = 0.5) -> bool:
    try:
        with socket.create_connection((host, port), timeout=timeout):
            return True
    except OSError:
        return False


if proxy_is_up(PROXY_HOST, PROXY_PORT):
    proxy_url = f"socks5://{PROXY_HOST}:{PROXY_PORT}"
    os.environ["HTTP_PROXY"] = proxy_url
    os.environ["HTTPS_PROXY"] = proxy_url
    print(f"[proxy] Enabled SOCKS5 proxy at {proxy_url}")
else:
    print("[proxy] Proxy offline — running without proxy")

c = get_config()

c.ServerApp.root_dir = "/home/ali/Codes/DataSpellProjects"

c.JupyterNotebookApp.open_browser = False

c.ServerApp.IdentityProvider.token = ""
c.ServerApp.password = ""
c.ServerApp.allow_remote_access = False
c.ServerApp.ip = "localhost"
c.ServerApp.port = 8888

c.ServerApp.jpserver_extensions = {
    "notebook": True,
    "jupyter_lsp": True,
    "jupyter_server_terminals": True,
    "jupyterlab": True,
    "notebook_shim": True,
}
