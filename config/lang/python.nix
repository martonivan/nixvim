{ pkgs, ... }: {
  plugins = {
    lsp = {
      servers = {
        pyright.enable = true;
        ruff.enable = true;
        ruff-lsp.enable = true;
      };
    };
  };
}
