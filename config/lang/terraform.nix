{
  plugins = {
    lsp.servers.terraformls.enable = true;
    none-ls.sources.formatting.terraform_fmt.enable = true;
    none-ls.sources.diagnostics.terraform_validate.enable = true;
    none-ls.sources.formatting.terragrunt_fmt.enable = true;
    none-ls.sources.diagnostics.terragrunt_validate.enable = true;
  };
}
