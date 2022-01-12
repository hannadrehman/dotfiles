local map = require("utils").map


--nvim tree
map("n","<C-p>",":NvimTreeFindFileToggle<CR>")

--search
map("n","n" ,"nzzzv")
map("n","N" ,"nzzzv")


--line selector and mover
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
map("i", "<C-j>", "<esc> :m .+1<CR>==")
map("i", "<C-k>", "<esc> :m .-2<CR>==")
map("n", "<leader>j", ":m .+1<CR>==")
map("n", "<leader>k", ":m .-2<CR>==")

--yank
map("n","Y","y$")

--buffers
map("n","<TAB>",":bnext<CR>")
map("n","<S-TAB>",":bprevious<CR>")


--disable moments
map("n","<Up>","<Nop>")
map("n","<Down>","<Nop>")
map("n","<Left>","<Nop>")
map("n","<Right>","<Nop>")

