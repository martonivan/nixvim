{
  plugins = {
    lsp.servers.terraformls.enable = true;
    none-ls.sources = {
      formatting ={
        terraform_fmt.enable = true;
        terragrunt_fmt.enable = true;
      };
      diagnostics = {
        terraform_validate.enable = true;
        terragrunt_validate.enable = true;
      };
    };
  };
}
