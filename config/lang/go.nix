{
  plugins = {
    lsp.servers.gopls.enable = true;
    none-ls.sources = {
      formatting ={
        gofmt.enable = true;
        goimports.enable = true;
        golines.enable = true;
      };
      diagnostics.golangci_lint.enable = true;
    };
  };
}
