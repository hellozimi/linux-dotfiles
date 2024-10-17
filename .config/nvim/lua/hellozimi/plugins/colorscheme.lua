return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",
      lazy = false,
      background = {
        light = "latte",
        dark = "mocha",
      },
      styles = {
        comments = {},
        conditionals = {},
      },
    })
    vim.cmd([[colorscheme catppuccin]])
  end
}
