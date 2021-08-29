-- https://github.com/junegunn/vim-easy-align

vim.cmd [[
  " For build-in ASCII
  nnoremap gA ga
  " Start interactive EasyAlign in visual mode (e.g. vipga)
  xmap ga <Plug>(LiveEasyAlign)
  " Start interactive EasyAlign for a motion/text object (e.g. gaip)
  nmap ga <Plug>(LiveEasyAlign)
]]
