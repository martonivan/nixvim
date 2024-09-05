{ mkKey, ... }:
let inherit (mkKey) mkKeymap;

in {
  plugins.lazygit.enable = true;
  keymaps = [
    (mkKeymap "n" "<leader>gl" "<cmd>LazyGit<cr>" "LazyGit")
  ];
}
