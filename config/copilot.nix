{ mkKey, ... }:
let inherit (mkKey) mkKeymap;
in {
  plugins = {
    copilot-chat = { enable = true; };
    copilot-lua = {
      enable = false;
      filetypes = {
        "*" = true;
        text = false;
        markdown = true;
      };
      suggestion = {
        enabled = true;
        autoTrigger = true;
      };
    };
    copilot-vim = {
      enable = true;
      settings = {
        filetypes = {
          "*" = true;
          text = false;
        };
      };
    };
  };
  keymaps = [
    (mkKeymap "n" "<leader>ucc" {
      __raw = # lua
        ''
          function()
            if vim.g.copilot_status == nil then
              vim.g.copilot_status = "running"
            end
            if vim.g.copilot_status == "running" then
              vim.g.copilot_status = "stopped"
              vim.cmd("Copilot disable")
            else
              vim.g.copilot_status = "running"
              vim.cmd("Copilot enable")
            end
          end
        '';
    } "Toggle Copilot")
    (mkKeymap "n" "<leader>zc" ":CopilotChatToggle<CR>" "Toggle Copilot Chat")
    (mkKeymap "v" "<leader>ze" ":CopilotChatExplain<CR>" "Explain Code")
    (mkKeymap "v" "<leader>zr" ":CopilotChatReview<CR>" "Review Code")
    (mkKeymap "v" "<leader>zf" ":CopilotChatFix<CR>" "Fix Code Issues")
    (mkKeymap "v" "<leader>zo" ":CopilotChatOptimize<CR>" "Optimize Code")
    (mkKeymap "v" "<leader>zd" ":CopilotChatDocs<CR>" "Generate Docs")
    (mkKeymap "v" "<leader>zt" ":CopilotChatTest<CR>" "Generate Tests")
    (mkKeymap "n" "<leader>zm" ":CopilotChatCommit<CR>"
      "Generate Commit Message")
    (mkKeymap "v" "<leader>zs" ":CopilotChatCommit<CR>"
      "Generate Commit for Selections")
  ];
}
