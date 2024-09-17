{
  plugins = {
    nix.enable = true;
    nix-develop.enable = true;
    lsp.servers.nixd = {
      enable = true;
      filetypes = [ "nix" ];
    };
    none-ls = {
      sources = {
        formatting.nixfmt.enable = true;
        diagnostics = {
          statix.enable = true;
          deadnix.enable = true;
        };
      };
    };
  };
}
