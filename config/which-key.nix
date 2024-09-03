{
  plugins.which-key = {
    enable = true;
    settings = {
      spec = [
        {
          __unkeyed1 = "<leader>f";
          group = "File operations";
        }
        {
          __unkeyed1 = "<leader>fs";
          __unkeyed2 = ":SudaWrite<cr>";
          desc = "Sudo save file content";
          mode = "n";
        }
        {
          __unkeyed1 = "<leader>fx";
          __unkeyed2 = ":! chmod +x %<cr>";
          desc = "Make current file executable";
          mode = "n";
        }
        {
          __unkeyed1 = "<leader>c";
          group = "Common operations";
        }
        {
          __unkeyed1 = "<leader>c$";
          __unkeyed2 = ":%s/[ \\t]\\+$//g<cr><C-o>";
          desc = "Remove trailing whitespaces";
          mode = "n";
        }
        {
          __unkeyed1 = "<leader>ci";
          __unkeyed2 = ":%s/ / /g<cr><C-o>";
          desc = "Reduce two spaces to one";
          mode = "n";
        }
        {
          __unkeyed1 = "<leader>ct";
          __unkeyed2 = ":%s/\\t/ /g<cr><C-o>";
          desc = "Replace tabs with two spaces";
          mode = "n";
        }
        {
          __unkeyed1 = ''<leader>c"'';
          __unkeyed2 = '':s/'/"/g<cr>gv'';
          desc = "Replace single quotes to double";
          mode = "v";
        }
        {
          __unkeyed1 = "<leader>c'";
          __unkeyed2 = '':s/"/'/g<cr>gv'';
          desc = "Replace double quotes to single";
          mode = "v";
        }
        {
          __unkeyed1 = "<leader>ci";
          __unkeyed2 = '':s/  / /g<cr>gv'';
          desc = "Reduce two spaces to one";
          mode = "v";
        }
      ];
    };
  };
  opts = {
    timeout = true;
    timeoutlen = 300;
  };
}
