-- v: variant
-- s: special
-- m: modified

local M = {}

-- stylua: ignore start
M.action  = {
  add     = "",
  add_v   = "",
  add_s   = "",
  add_m   = "",
  add_t   = "",
  del     = "",
  del_v   = "",
  del_s   = "",
  del_m   = "",
  mod     = "柳",
  mod_v   = "",
  mod_s   = "",
  mod_m   = "",
  mod_t   = "",
  save    = "",
  save_v  = "",
  check   = "☑",
  good    = "✓",
  wrong   = "✗",
  close   = "",
  close_v = "",
  close_s = "",
  up      = "",
  up_v    = "",
  down_v  = "",
  down    = "",
  left    = "",
  left_v  = "",
  left_s  = "",
  right   = "",
  right_v = "",
  right_s = "",
  right_m = "➜",
  goback  = "",
  share   = "",
  quote   = "",
  close   = "",
  close   = "",
  close   = "",
  close   = "",
  close   = "",
  close   = "",
  close   = "",
  close   = "",
  close   = "",
  close   = "",
  close   = "",
  close   = "",
  close   = "",
  close   = "",
  close   = "",
  close   = "",
  close   = "",
  close   = "",
  close   = "",
  close   = "",
  close   = "",
  close   = "",
  close   = "",
  close   = "",
  close   = "",
  close   = "",
  close   = "",
  close   = "",
  close   = "",
  close   = "",
  close   = "",
  close   = "",
  close   = "",
  close   = "",
  close   = "",
  close   = "",
  close   = "",
  close   = "",
  close   = "",
}

M.ui = {
  camera        = "",
  camera_v      = "",
  recorder      = "",
  bookmark      = "",
  bookmark_v    = "",
  label         = "",
  label_v       = "",
  tree          = "",
  car           = "",
  car_v         = "",
  recycle       = "",
  recycle_v     = "",
  telescope     = "",
  home          = "",
  stats         = "⅑",
  wordpad       = "",
  books         = "﬘",
  calendar      = "",
  default       = "",
  default_v     = "",
  ulist         = "",
  olist         = "",
  location      = "",
  pencil        = "",
  symlink       = "",
  symlink_v     = "",
  unmerged      = "",
  deleted       = "",
  open          = "",
  open_v        = "",
  closed        = "",
  closed_v      = "",
  folder        = "",
  folder_v      = "",
  folder_s      = "",
  folder_open   = "",
  folder_open_v = "",
  folder_open_s = "",
  code          = "",
  eye           = "",
  chat          = "",
  chat_v        = "",
  chain         = "",
  stop          = "",
  stop_v        = "",
  magnet        = "",
  star          = "★",
  star_v        = "☆",
  close         = "",
  close         = "",
  close         = "",
  close         = "",
  close         = "",
  close         = "",
  close         = "",
  close         = "",
  close         = "",
  close         = "",
  close         = "",
  close         = "",
  close         = "",
  close         = "",
}

M.shape = {
  space = "⯀",
  tab   = "⯈",
  play  = "▰",
  play  = "▱",
  play  = "▲",
  play  = "△",
  play  = "▴",
  play  = "▵",
  play  = "▶",
  play  = "▷",
  play  = "▸",
  play  = "▹",
  play  = "►",
}

M.code = {
  lsp       = "",
  lsp_v     = "",
  right     = "",
  error     = "",
  error_v   = "",
  warn      = "",
  warn_v    = "",
  info      = "",
  info_v    = "",
  info_s    = "",
  note      = "",
  note_v    = "",
  hint      = "",
  hint_v    = "",
  bug       = "",
  problem   = "",
  problem_v = "",
  unlock    = "",
  unlock_v  = "",
  lock      = "",
  lock_v    = "",
  lock_s    = "",
  encode    = "",
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
  Constructor_v = "",
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
  Module_v      = "",
  Module_s      = "",
  Operator      = "",
  Property      = "ﰠ",
  Property_v    = "",
  Reference     = "",
  Reference_v   = "",
  Snippet       = "",
  Snippet_v     = "",
  Struct        = "פּ",
  Struct_v      = "",
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
  mini = {
    [2] = "²",
    [3] = "³",
  }
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
  "·",
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
  "◊",
  "○",
  "◌",
  "°",
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
