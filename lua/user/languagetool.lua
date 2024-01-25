vim.g['languagetool_server'] = "/bin/languagetool -l en-US --languagemodel ~/Documents/BookBinding/en"
vim.g['languagetool_server_command'] = "/bin/languagetool -l en-US --languagemodel ~/Documents/BookBinding/en --http --premiumAlways"
vim.cmd [[ autocmd BufRead,BufNewFile *.tex set filetype=tex ]]
