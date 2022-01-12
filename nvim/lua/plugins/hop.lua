local map = require("utils").map

require'hop'.setup()

map('n', 'f', "<cmd>lua require'hop'.hint_words({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, })<cr>", {})
map('n', 'F', "<cmd>lua require'hop'.hint_words({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR,  })<cr>", {})
map('o', 'f', "<cmd>lua require'hop'.hint_words({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR,  inclusive_jump = true })<cr>", {})
map('o', 'F', "<cmd>lua require'hop'.hint_words({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR,  inclusive_jump = true })<cr>", {})
