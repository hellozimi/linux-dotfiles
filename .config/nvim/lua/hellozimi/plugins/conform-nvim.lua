return {
  "stevearc/conform.nvim",
  config = function()
    local conform = require("conform")
    conform.setup({
      formatters_by_ft = {
        javascript = { "prettierd" },
        typescript = { "prettierd" },
        css = { "prettierd" },
        html = { "prettierd" },
        json = { "prettierd" },
        yaml = { "prettierd" },
        markdown = { "prettierd" },
        graphql = { "prettierd" },
        liquid = { "prettierd" },
        go = { "goimports-reviser", "gofumpt" },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
      }
    })
  end
}
