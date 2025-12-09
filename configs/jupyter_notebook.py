c = get_config()

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
