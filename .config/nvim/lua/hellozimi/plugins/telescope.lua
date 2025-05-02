return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local select_one_or_multi = function(prompt_bufnr)
      local picker = require('telescope.actions.state').get_current_picker(prompt_bufnr)
      local multi = picker:get_multi_selection()
      if not vim.tbl_isempty(multi) then
        require('telescope.actions').close(prompt_bufnr)
        for _, j in pairs(multi) do
          if j.path ~= nil then
            vim.cmd(string.format('%s %s', 'edit', j.path))
          end
        end
      else
        require('telescope.actions').select_default(prompt_bufnr)
      end
    end

    telescope.setup({
      defaults = {
        file_ignore_patterns = { "node_modules" },
        mappings = {
          n = {
            ['<C-d>'] = require('telescope.actions').delete_buffer
          },
          i = {
            ["<CR>"] = select_one_or_multi,
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next,     -- move to next result
            ["<C-h>"] = "which_key",
            ['<C-d>'] = require('telescope.actions').delete_buffer,
          },
        },
      },
    })

    telescope.load_extension("fzf")

    -- set keymaps

    local K = require("hellozimi.core.keymap")
    K.nnoremap("<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
    K.nnoremap("<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
    K.nnoremap("<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
    K.nnoremap("<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find buffers" })
    K.nnoremap("<leader>fr", "<cmd>Telescope lsp_references<cr>", {})
    K.nnoremap("<leader>fds", "<cmd>Telescope lsp_document_symbols<cr>", {})
    K.nnoremap("<leader>fws", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", {})
  end,
}
