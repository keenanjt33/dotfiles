vim.keymap.set("n", "<leader>ft", vim.cmd.Neotree)

vim.keymap.set("n", "<leader>w", ":w!<CR>")

-- Copy file path to clipboard
vim.keymap.set("n", "<Leader>c<CR>", ':let @+=fnamemodify(expand("%"), ":~:.")<CR>')
