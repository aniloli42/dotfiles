return {
  "gbprod/substitute.nvim",
  event = {"BufReadPre", "BufNewFile"},
  config = function()
    local substitute = require("substitute")

    substitute.setup()

    local k = vim.keymap.set

    k("n", "s", substitute.operator, {desc = "substitute with motion"})
    k("n", "ss", substitute.line, {desc = "substitute line"})
    k("n", "S", substitute.eol, {desc = "substitute to end of line"})
    k("x", "s", substitute.visual, {desc = "substitute in visual mode"})
  end,
}
