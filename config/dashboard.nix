{ icons, ... }: {
  plugins.dashboard = {
    # TODO: search for fix when free
    enable = true;
    settings = {
      hide = { tabline = false; };
      disable_move = true;
      theme = "hyper";
      config = {
        packages = { enable = false; };
        footer = [ " " " " "Don't Stop Until You are Proud..." ];
        project = { enable = false; };
        header = [
          ''.__                                            __                 ''
          ''|__|__  _______    ____   _____ _____ ________/  |_  ____   ____  ''
          ''|  \  \/ /\__  \  /    \ /     \\__  \\_  __ \   __\/  _ \ /    \ ''
          ''|  |\   /  / __ \|   |  \  Y Y  \/ __ \|  | \/|  | (  <_> )   |  \''
          ''|__| \_/  (____  /___|  /__|_|  (____  /__|   |__|  \____/|___|  /''
          ''               \/     \/      \/     \/                        \/ ''
        ];
        shortcut = [
          {
            desc = "${icons.ui.File} New file";
            group = "string";
            key = "e";
            action = "enew";
          }
          {
            desc = "${icons.ui.History} Recent Files";
            group = "String";
            key = "r";
            action = "Telescope oldfiles";
          }
          {
            desc = "${icons.ui.Files} Find Files";
            group = "@variable";
            key = "f";
            action = "Telescope find_files";
          }
          {
            desc = " Last Session";
            group = "Number";
            key = ".";
            action = "SessionManager load_last_session";
          }
          {
            desc = " List Session";
            group = "DiagnosticHint";
            key = "l";
            action = "SessionManager load_session";
          }
          {
            desc = "${icons.ui.BoldClose} Quit";
            group = "DiagnosticError";
            key = "q";
            action = "qa";
          }

        ];
      };
    };
  };
}
