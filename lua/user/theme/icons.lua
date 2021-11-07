local M = {}

-- stylua: ignore start

M.action = {
  close   = "",
  close_v = "",
  left    = "",
  right   = "",
}

M.state = {
  problem = "",
}

M.dev = {
  bracketleft       = '',
  bracketright      = '',
  vim               = '',
  -- vim            = '',
  git               = '',
  -- git            = '',
  github            = '',
  gitlab            = '',
  gitbitbucket      = '',
  hg                = '',
  gitadd            = ' ',
  -- gitadd         = ' ',
  gitmod            = ' ',
  -- gitmod         = '柳',
  gitdel            = ' ',
  -- gitdel         = ' ',
  -- lsp               = '',
  lsp               = '',
  lspdiagerror      = ' ',
  -- lspdiagerror   = ' ',
  lspdiagwarning    = ' ',
  -- lspdiagwarning = ' ',
  lspdiaginfo       = ' ',
  -- lspdiaginfo    = ' ',
  lspdiaghint       = ' ',
  -- lspdiaghint    = ' ',
  dos               = '',
  unix              = '',
  -- unix           = '',
  mac               = '',
  typewriteable     = '',
  -- typewriteable  = '',
  -- typewriteable  = '',
  typereadonly      = '',
  typesize          = '',
  -- typesize       = '',
  typeenc           = '',
  stats             = '⅑',
  -- statsvert      = '⇳',
  statsvert         = '⬍',
  -- statshoriz     = '⇔',
  statshoriz        = '⬌',
  statsspace        = '⯀',
  statstab          = '⯈',
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

-- stylua: ignore end

M.bar = {
  mid = "│",
  middle = "┃",
  full = "█",
  left_seven_eighth = "▉",
  left_three_quarter = "▊",
  left_five_eighth = "▋",
  left_half = "▌",
  left_three_eighth = "▍",
  left_one_quarter = "▎",
  left = "▏",
  right_half = "▐",
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
  "⏺",
  "⚫",
  "⚪",
}

M.numbers = {
  a = {
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
  },
  b = {
    [1] = "①",
    [2] = "②",
    [3] = "③",
  },
  c = {
    [1] = "🕐",
    [2] = "🕑",
    [3] = "🕒",
  },
}

M.brackets = {
  round = { "❪", "❫" },
  angle = { "❮", "❯" },
  angle_v = { "❰", "❱" },
  curly = { "❴", "❵" },
}

M.emoji = {
  dinosaur = "🦕",
  robot = "🤖",
}

return M
