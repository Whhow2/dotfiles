local cmd = vim.cmd

cmd([[
  augroup OpenAllFoldsOnFileOpen
    autocmd!
    autocmd BufRead * normal zR
]])

vim.api.nvim_create_autocmd("FileType", {
	pattern = "TelescopeResults",
	command = "setlocal nofoldenable",
})
