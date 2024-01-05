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

-- Neo-Tree
vmap('n', '<C-n>', '<CMD>Neotree reveal float<CR>', options)

-- Neogen
vmap('n', '<leader>ng', ':lua require("neogen").generate()<CR>', { desc = '[N]eogen [G]enerate annotation' })
vmap('n', '<leader>nf', ':lua require("neogen").generate({ type = "func" })<CR>', { desc = '[N]eogen Generate [F]unction annotation' })

-- Notify
vmap('n', '<ESC>', "<CMD>lua require('notify').dismiss()<CR>", options)
vmap('i', '<C-ESC>', "<CMD>lua require('notify').dismiss()<CR>", options)

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
vmap('n', '<leader>fa', require('telescope.builtin').marks, { desc = 'Search Marks' })

vmap('n', '<leader>rn', ':IncRename', { desc = '[R]e[n]ame' })
vmap('n', '<leader>ca', vim.lsp.buf.code_action, { desc = '[C]ode [A]ction' })

vmap('n', 'gd', vim.lsp.buf.definition, { desc = '[G]oto [D]efinition' })
vmap('n', 'gr', require('telescope.builtin').lsp_references, { desc = '[G]oto [R]eferences' })
vmap('n', 'gI', vim.lsp.buf.implementation, { desc = '[G]oto [I]mplementation' })
vmap('n', '<leader>D', vim.lsp.buf.type_definition, { desc = 'Type [D]efinition' })
vmap('n', '<leader>ds', require('telescope.builtin').lsp_document_symbols, { desc = '[D]ocument [S]ymbols' })
vmap('n', '<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, { desc = '[W]orkspace [S]ymbols' })

-- See `:help K` for why this keymap
vmap('n', 'K', vim.lsp.buf.hover, { desc = 'Hover Documentation' })
vmap('n', '<C-k>', vim.lsp.buf.signature_help, { desc = 'Signature Documentation' })

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
local harpoon = require("harpoon")
local ui = require("harpoon.ui")

vmap("n", "<leader>h", function ()
  harpoon:list():append()
end)

vmap("n", "<leader>hm", function ()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end)

vmap("n", "<leader>a1", function() harpoon:list():select(1) end)
vmap("n", "<leader>a2", function() harpoon:list():select(2) end)
vmap("n", "<leader>a3", function() harpoon:list():select(3) end)
vmap("n", "<leader>a4", function() harpoon:list():select(4) end)

-- Toggle previous & next buffers stored within Harpoon list
vmap("n", "<leader>hp", function() harpoon:list():prev() end)
vmap("n", "<leader>hn", function() harpoon:list():next() end)

map("n", "<leander>ss", "<cmd>lua require('sg.extensions.telescope').fuzzy_search_results()<CR>", options)

-- Run gofmt + goimport on save
local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
   require('go.format').goimport()
  end,
  group = format_sync_grp,
})
