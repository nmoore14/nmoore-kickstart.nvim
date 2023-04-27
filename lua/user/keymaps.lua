local map = vim.api.nvim_set_keymap
local vmap = vim.keymap.set
local options = { noremap = true, silent = true }

require('telescope').load_extension('harpoon')

-- Window Nav
map('n', '<C-h>', '<C-w>h', options)
map('n', '<C-j>', '<C-w>j', options)
map('n', '<C-k>', '<C-w>k', options)
map('n', '<C-l>', '<C-w>l', options)

-- Buffer navigation
map("n", "bj", ":bp<CR>", options)
map("n", "bk", ":bn<CR>", options)
map("n", "<Tab>", ":bn<CR>", options)
map("n", "<S-Tab>", ":bp<CR>", options)

-- Dealing with word wrapping
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

-- Nvim-Tree
vmap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- Aerial
vmap('n', '<C-\\>', ':AerialToggle!<CR>', { noremap = true, silent = true })

-- Telescope
vmap('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vmap('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })

vmap('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

vmap('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vmap('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vmap('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vmap('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vmap('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vmap('n', '<leader>sk', require('telescope.builtin').keymaps, { desc = '[S]earch [K]eymaps' })

-- Diagnostic keymaps
vmap('n', '[d', vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vmap('n', ']d', vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vmap('n', '<leader>e', vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vmap('n', '<leader>q', vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- Custom command keymaps
vim.api.nvim_create_user_command(
  "DiffCommitFile",
  "lua require('telescope').extensions.advanced_git_search.diff_commit_file()",
  { range = false }
)

vmap('n', '<leader>cf', ':DiffCommitFile<CR>', { desc = 'Search [C]ommit [F]ile' })

-- Visual --
-- Stay in indent mode
map("v", "<", "<gv", options)
map("v", ">", ">gv", options)

-- Harpoon keymaps
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vmap("n", "<leader>a", mark.add_file)
vmap("n", "<leader>am", ui.toggle_quick_menu)

vmap('n', '<leader>al', "<cmd>Telescope harpoon marks<CR>", { desc = 'Telescope Harpoon Marks' })

vmap("n", "<leader>a1", function() ui.nav_file(1) end)
vmap("n", "<leader>a2", function() ui.nav_file(2) end)
vmap("n", "<leader>a3", function() ui.nav_file(3) end)
vmap("n", "<leader>a4", function() ui.nav_file(4) end)
