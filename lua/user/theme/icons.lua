-- v: variant
-- s: special

local M = {}

-- stylua: ignore start
M.action  = {
  close   = "",
  close_v = "",
  left    = "",
  right   = "",
  add     = "",
  add_v   = "",
  mod     = "柳",
  mod_v   = "",
  del     = "",
  save    = "",
  save_v  = "",
  check   = "☑",
}

M.ui = {
  camera    = "",
  bookmark  = "",
  label     = "",
  label_v   = "",
  tree      = "",
  car       = "",
  car_v     = "",
  recycle   = "",
  recycle_v = "",
  telescope = "",
  home      = "",
  stats     = "⅑",
}

M.key = {
  space = "⯀",
  tab   = "⯈",
}

M.code = {
  lsp      = "",
  lsp_v    = "",
  error    = "",
  error_v  = "",
  warn     = "",
  warn_v   = "",
  info     = "",
  info_v   = "",
  info_s   = "",
  hint     = "",
  hint_v   = "",
  bug      = "",
  problem  = "",
  unlock   = "",
  unlock_v = "",
  lock     = "",
  lock_v   = "",
  encode   = "",
}

M.dev = {
  vim          = "",
  vim_v        = "",
  git          = "",
  git_v        = "",
  github       = "",
  gitlab       = "",
  gitbitbucket = "",
  hg           = "",
  dos          = "",
  unix         = "",
  unix_V       = "",
  mac          = "",
}

M.lsp = {
  Class         = "ﴯ",
  Class_v       = "",
  Color         = "",
  Color_v       = "",
  Constant      = "",
  Constant_v    = "ﲀ",
  Constructor   = "",
  Constructor_v = " ",
  Enum          = "",
  Enum_v        = "練",
  EnumMember    = "",
  Event         = "",
  Field         = "ﰠ",
  Field_v       = "",
  File          = "",
  Folder        = "",
  Function      = "",
  Interface     = "",
  Interface_v   = "ﰮ",
  Keyword       = "",
  Method        = "",
  Method_v      = "",
  Module        = "",
  Module_v      = "",
  Operator      = "",
  Property      = "ﰠ",
  Property_v    = "",
  Reference     = "",
  Reference_v   = "",
  Snippet       = "",
  Snippet_v     = "",
  Struct        = "פּ",
  Struct_v      = " ",
  Text          = "",
  TypeParameter = "",
  Unit          = "塞",
  Value         = "",
  Variable      = "",
  Variable_v    = "",
}

M.arrow = {
  updown      = "⇳",
  updown_v    = "⬍",
  leftright   = "⇔",
  leftright_v = "⬌",
}

M.bar = {
  mid                = "│",
  middle             = "┃",
  full               = "█",
  left_seven_eighth  = "▉",
  left_three_quarter = "▊",
  left_five_eighth   = "▋",
  left_half          = "▌",
  left_three_eighth  = "▍",
  left_one_quarter   = "▎",
  left               = "▏",
  right_half         = "▐",
}

M.separator = {
  bracketleft  = "",
  bracketright = "",
}
-- stylua: ignore end

M.num = {
  round = {
    [0] = "⓪",
    [1] = "①",
    [2] = "②",
    [3] = "③",
    [4] = "④",
    [5] = "⑤",
    [6] = "⑥",
    [7] = "⑦",
    [8] = "⑧",
    [9] = "⑨",
  },
  round_v = {
    [0] = "⓿",
    [1] = "❶",
    [2] = "❷",
    [3] = "❸",
    [4] = "❹",
    [5] = "❺",
    [6] = "❻",
    [7] = "❼",
    [8] = "❽",
    [9] = "❾",
    [10] = "❿",
    [11] = "⓫",
  },
  clock = {
    [1] = "🕐",
    [2] = "🕑",
    [3] = "🕒",
  },
}

M.alpha = {
  a = "Ⓐ",
  b = "Ⓑ",
  c = "Ⓒ",
  d = "Ⓓ",
  d = "Ⓔ",
}

M.borders = {
  a = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
}

M.dot = {
  "•",
  "⌾",
  "⍟",
  "⏣",
  "◉",
  "◍",
  "◎",
  "●",
  "⚉",
  "⚇",
}

M.bracket = {
  round = { "❪", "❫" },
  angle = { "❮", "❯" },
  angle_v = { "❰", "❱" },
  curly = { "❴", "❵" },
}

M.emoji = {
  sauropod = "🦕",
  robot = "🤖",
  search = "🔍",
  telescope = "🔭",
  check = "✅",
}

return M
