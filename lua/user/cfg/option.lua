vim.opt.clipboard = ""
vim.opt.cmdheight = 1
vim.opt.guifont = "SauceCodePro NF"
vim.opt.inccommand = "split"
vim.opt.mouse = "nvi"
vim.opt.timeoutlen = 200
vim.opt.titlestring = '%t%( %M%)%( (%{expand("%:~:.:h")})%)%( %a%) - LunarVim'
vim.opt.wrap = false
vim.opt.scrolloff = 4

-- vim.cmd [[set listchars=space:·,eol:↲,trail:~,tab:>-,extends:>,precedes:<,nbsp:+]]
vim.opt.listchars = {
  eol = "↲",
  extends = ">",
  nbsp = "+",
  precedes = "<",
  space = "·",
  tab = ">-",
  trail = "~",
}

-- vim.opt.foldenable = false
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- 朝闻道，金、木、水、火、土；【真香定律（王境泽）】；《静夜诗（李白）》。
-- 唐僧问道：‘泼猴，若我救你出来，你该如何报答我？’ 悟空：“你若放我出来，我定会送你上西天！”
vim.cmd [[set matchpairs+=【:】,（:）,《:》,‘:’,“:”,；:。,，:。]]
