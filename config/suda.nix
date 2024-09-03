{ pkgs, inputs, ... }:
{
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "Nvim Suda";
      src = inputs.suda;
    })
  ];
}
