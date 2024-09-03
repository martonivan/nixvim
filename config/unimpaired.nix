{ pkgs, inputs, ... }:
{
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "VIM Unimpaired";
      src = inputs.unimpaired;
    })
  ];
}
