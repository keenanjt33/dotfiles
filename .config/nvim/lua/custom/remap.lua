vim.keymap.set("n", "<leader>ft", vim.cmd.Neotree)

-- Copy file path to clipboard
vim.keymap.set("n", "<Leader>c<CR>", ':let @+=fnamemodify(expand("%"), ":~:.")<CR>')

vim.keymap.set("n", ",w", ':w<CR>')

vim.keymap.set("n", "<leader>ff", "<cmd>lua require('fzf-lua').live_grep_glob()<CR>", { silent = true })
vim.keymap.set("n", "<leader>fr", "<cmd>lua require('fzf-lua').resume()<CR>", { silent = true })

local builtin = require('telescope.builtin')

function FuzzySearch()
    builtin.grep_string({
        shorten_path = true, word_match = "-w", only_sort_text = true, search = ''
    })
end

function FuzzySearchTest()
    builtin.grep_string({ search = vim.fn.input "Grep For >" })
end

vim.keymap.set('n', '<leader>st', '<cmd>lua FuzzySearch{}<cr>', {})
vim.keymap.set('n', '<leader>sT', '<cmd>lua FuzzySearchTest{}<cr>', {})
-- vim.keymap.set('n', '<leader>sg', require 'telescope.builtin'.grep_string,
--     { shorten_path = true, word_match = "-w", only_sort_text = true, search = '' })
