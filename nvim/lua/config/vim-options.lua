vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.swapfile = false
vim.opt.clipboard = "unnamedplus"
-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.keymap.set('n', '<leader>r', ':RunCode<CR>', { noremap = true, silent = false })

vim.keymap.set("n", "<leader>fr", ":FlutterRun<CR>", { desc = "Run Flutter app" })
vim.keymap.set("n", "<leader>fq", ":FlutterQuit<CR>", { desc = "Quit Flutter app" })
vim.keymap.set("n", "<leader>fd", ":FlutterDevices<CR>", { desc = "Pick device" })
vim.keymap.set("n", "<leader>fo", ":FlutterOutlineToggle<CR>", { desc = "Toggle outline" })
vim.keymap.set("n", "<leader>fl", ":FlutterLogToggle<CR>", { desc = "Toggle log" })
