return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- personal header
    local header = {
      "          _____                    _____                    _____                    _____          ",
      "         /\\    \\                  /\\    \\                  /\\    \\                  /\\    \\         ",
      "        /::\\    \\                /::\\    \\                /::\\____\\                /::\\    \\        ",
      "       /::::\\    \\               \\:::\\    \\              /::::|   |                \\:::\\    \\       ",
      "      /::::::\\    \\               \\:::\\    \\            /:::::|   |                 \\:::\\    \\      ",
      "     /:::/\\:::\\    \\               \\:::\\    \\          /::::::|   |                  \\:::\\    \\     ",
      "    /:::/__\\:::\\    \\               \\:::\\    \\        /:::/|::|   |                   \\:::\\    \\    ",
      "   /::::\\   \\:::\\    \\              /::::\\    \\      /:::/ |::|   |                   /::::\\    \\   ",
      "  /::::::\\   \\:::\\    \\    ____    /::::::\\    \\    /:::/  |::|   | _____    ____    /::::::\\    \\  ",
      " /:::/\\:::\\   \\:::\\ ___\\  /\\   \\  /:::/\\:::\\    \\  /:::/   |::|   |/\\    \\  /\\   \\  /:::/\\:::\\    \\ ",
      "/:::/__\\:::\\   \\:::|    |/::\\   \\/:::/  \\:::\\____\\/:: /    |::|   /::\\____\\/::\\   \\/:::/  \\:::\\____\\",
      "\\:::\\   \\:::\\  /:::|____|\\:::\\  /:::/    \\::/    /\\::/    /|::|  /:::/    /\\:::\\  /:::/    \\::/    /",
      " \\:::\\   \\:::\\/:::/    /  \\:::\\/:::/    / \\/____/  \\/____/ |::| /:::/    /  \\:::\\/:::/    / \\/____/ ",
      "  \\:::\\   \\::::::/    /    \\::::::/    /                   |::|/:::/    /    \\::::::/    /          ",
      "   \\:::\\   \\::::/    /      \\::::/____/                    |::::::/    /      \\::::/____/           ",
      "    \\:::\\  /:::/    /        \\:::\\    \\                    |:::::/    /        \\:::\\    \\           ",
      "     \\:::\\/:::/    /          \\:::\\    \\                   |::::/    /          \\:::\\    \\          ",
      "      \\::::::/    /            \\:::\\    \\                  /:::/    /            \\:::\\    \\         ",
      "       \\::::/    /              \\:::\\____\\                /:::/    /              \\:::\\____\\        ",
      "        \\::/____/                \\::/    /                \\::/    /                \\::/    /        ",
      "         ~~                       \\/____/                  \\/____/                  \\/____/         ",
      "                                                                                                   ",
    }
    
    -- set header
    dashboard.section.header.val = header

    -- set menu
    dashboard.section.buttons.val = {
      dashboard.button("SPC wr", "> Restore Session For Current Directory", "<cmd>SessionRestore<CR>"),
      dashboard.button("e", "> New File", "<cmd>ene<CR>"),
      dashboard.button("SPC ee", "> Toggle File Explorer", "<cmd>NvimTreeToggle<CR>"),
      dashboard.button("SPC ff", "> Find File", "<cmd>Telescope find_files<CR>"),
      dashboard.button("SPC fs", "> Find Word", "<cmd>Telescope live_grep<CR>"),
      dashboard.button("q", "> Quit", "<cmd>qa<CR>"),
    }

    -- Send config to alpha
    alpha.setup(dashboard.opts)

    -- Disable folding on alpha buffer
    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
  end,
}
