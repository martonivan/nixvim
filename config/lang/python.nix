{ pkgs, ... }: {
  plugins = {
    lsp = {
      servers = {
        pyright.enable = true;
        ruff.enable = true;
        ruff-lsp.enable = true;
      };
    };
    none-ls = {
      sources.diagnostics.trail_space = {
        enable = true;
        settings = { extra_filetypes = [ "python" ]; };
      };
    };
  };
}
