-- 取消搜索后高亮
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- 切换窗口
vim.keymap.set("n", "<leader>ww", "<C-w>w")
vim.keymap.set("n", "<leader>wj", "<C-w>j")
vim.keymap.set("n", "<leader>wk", "<C-w>k")
vim.keymap.set("n", "<leader>wh", "<C-w>h")
vim.keymap.set("n", "<leader>wl", "<C-w>l")

vim.keymap.set("n", "<C-Space><C-Space>", "<C-^>")

-- 删除全局 LSP 默认键位
vim.keymap.del("n", "gra")
vim.keymap.del("n", "gri")
vim.keymap.del("n", "grn")
vim.keymap.del("n", "grr")
vim.keymap.del("n", "grt")
vim.keymap.del("n", "gO")
