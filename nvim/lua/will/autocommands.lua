local cmd = vim.cmd

cmd([[
  augroup OpenAllFoldsOnFileOpen
    autocmd!
    autocmd BufRead * normal zR
]])
