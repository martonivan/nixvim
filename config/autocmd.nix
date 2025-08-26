{ opts, ... }: {
  autoCmd = [
    {
      desc = "Set filetype for ansible files";
      event = [ "BufRead" "BufNewFile" ];
      pattern = [
        "*/host_vars/*.yml"
        "*/host_vars/*.yaml"
        "*/group_vars/*.yml"
        "*/group_vars/*.yaml"
        "*/group_vars/*/*.yml"
        "*/group_vars/*/*.yaml"
        "*/playbook*.yml"
        "*/playbook*.yaml"
        "*/playbooks/*.yml"
        "*/playbooks/*.yaml"
        "*/roles/*/tasks/*.yml"
        "*/roles/*/tasks/*.yaml"
        "*/roles/*/handlers/*.yml"
        "*/roles/*/handlers/*.yaml"
        "*/tasks/*.yml"
        "*/tasks/*.yaml"
        "*.playbook"
      ];
      callback = {
        __raw = ''
          function()
            vim.bo.filetype = "yaml.ansible"
          end
        '';
      };
    }

    {
      desc = "Set filetype to Python when shebang contains python";
      event = [ "BufRead" "BufNewFile" ];
      pattern = "*";
      callback.__raw = ''
        function(args)
          -- only act on files without an extension
          local name = vim.api.nvim_buf_get_name(args.buf)
          if name == "" or name:match("/$") then return end
          if name:match("%.[^/%.]+$") then return end

          local firstLines = vim.api.nvim_buf_get_lines(args.buf, 0, 2, false)
          local first = firstLines[1] or ""
          local second = firstLines[2] or ""
          -- match: #!... python / python3 / python3.10, with or without /usr/bin/env
          if first:match("^#!.*[/ ]python[%d%.]*%s*$") or first:match("^#!.*env%s+python[%d%.]*%s*$") or
             first == "#!/usr/bin/env nix-shell" and second:match("^#!.*-i python[%d%.]*.*$")
            then
            vim.bo[args.buf].filetype = "python"
          end
        end
      '';
    }

    {
      desc = "Highlight on yank";
      event = [ "TextYankPost" ];
      callback = {
        __raw = ''
          function()
            vim.highlight.on_yank()
          end
        '';
      };
    }

    {
      desc = "Close these type of File";
      event = [ "FileType" ];
      pattern = [
        "PlenaryTestPopup"
        "help"
        "lspinfo"
        "man"
        "notify"
        "qf"
        "query"
        "spectre_panel"
        "startuptime"
        "tsplayground"
        "neotest-output"
        "checkhealth"
        "neotest-summary"
        "neotest-output-panel"
      ];

      callback = {
        __raw = ''
          function(event)
            vim.bo[event.buf].buflisted = false
            vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
          end
        '';
      };
    }

    {
      desc =
        "Auto create dir when save file, in case some intermediate directory is missing";
      event = [ "BufWritePre" ];
      callback = {
        __raw = ''
          function(event)
            if event.match:match("^%w%w+://") then
              return
            end
            local file = vim.loop.fs_realpath(event.match) or event.match
            vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
          end
        '';
      };
    }

    {
      event = [ "CursorHold" ];
      desc = "lsp show diagnostics on CursorHold";
      callback = {
        __raw = ''
          function()
            local hover_opts = {
              focusable = false,
              close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
              border = "${opts.border}",
              source = "always",
            }
            vim.diagnostic.open_float(nil, hover_opts)
          end
        '';
      };
    }

    {
      desc = "Save session";
      event = [ "BufWinLeave" ];
      pattern = [ "*.*" ];
      command = "mkview";
    }
    {
      desc = "Load session";
      event = [ "BufWinEnter" ];
      pattern = [ "*.*" ];
      command = "silent! loadview";
    }
    {
      desc = "Restart LSP whenever filetype changed";
      event = [ "FileType" ];
      pattern = [ "*" ];
      callback = {
        __raw = ''
          function(event)
            if vim.bo.buftype ~= "" or vim.fn.filereadable(vim.fn.expand("%")) ~= 1 then
              return
            end
            vim.cmd("LspRestart")
          end
        '';
      };
    }
  ];
}
