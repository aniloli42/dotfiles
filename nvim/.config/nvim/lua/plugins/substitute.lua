return {
  "gbprod/substitute.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local substitute = require("substitute")

    substitute.setup()

    local key = require("utils.keymap")

    key("n", "s", substitute.operator, { desc = "substitute with motion" })
    key("n", "ss", substitute.line, { desc = "substitute line" })
    key("n", "S", substitute.eol, { desc = "substitute to end of line" })
    key("x", "s", substitute.visual, { desc = "substitute in visual mode" })
  end,
}
