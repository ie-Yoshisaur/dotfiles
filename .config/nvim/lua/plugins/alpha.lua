return {
  "goolord/alpha-nvim",
  cmd = "Alpha",
  opts = function()
    local dashboard = require "alpha.themes.dashboard"

    math.randomseed(os.time())

    local ascii_arts = {
      {
        "iLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLn",
        "LLPxxLxxxxxxxxxxxxxxxxLxxxxxxxLxxVLL",
        "LLxxxxxxxxxxLxv~~~~~~\\xxxLxxxxxxxxLL",
        "LLxxxxxLxxxxv'        ~~~~\\xxxxxLxLL",
        "LLxxLxxxxxxv'iLLn      uxxxLxxxxxxLL",
        "LLxxxxxLxxv'iLLLu     :xxxxxxLxxxxLL",
        "LLxxxLxxxv' VLLLLuuiLLn:xLxxxxxxxxLL",
        "LLxxxxxLv'   `VLLLLLLLLn:xxxxxLxxxLL",
        "LLxLxxxv'      `VLLLLLLL:xxxLxxLxxLL",
        "LLxxxxx'        iLLLLLLL:xxLxxxxxxLL",
        "LLxxLxx        iLLLLLLLL:xxxxxxLxxLL",
        "LLxxxxx       iLLLLLLLLL:xxLxxxxxxLL",
        "LLLxxxx       VLLLLLLLLL:xxxxxLxxxLL",
        "LLxxxxL   n    LLLLLLLLV:xxxLxxxxLLL",
        "LLxxxxx   Ln   LLLLLLLV'xxxxxxxxxxLL",
        "LLxxLxx   LL  iLLLLLLV'xxxLxxxxxxxLL",
        "LLxLxxx   VLniLLLLLLV'LxxxxxxxxLxxLL",
        "LLnxxLx    VLLLLLLLV'xxxxxLxxLxxxxLL",
        "LLLLLLLn    VLLLLLLL:xuiLLLLLLnuxiLL",
        "LLLLLLLLnuuinuuuuuuiLLLLLLLLLLLLLLLL",
        "LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL",
        "VLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLV",
        "                                    ",
        "  Talk is cheap. Show me the code.  ",
        "                    - Linus Torvalds"
      },
      {
        "  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF  ",
        "  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF",
        "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF",
        "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF",
        "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF",
        "FFFFFFFFFFFFFFFFFFFFFFFF            FFFFFFFFFFFFFF",
        "FFFFFFFFFFFFFFFFFFFFFF              FFFFFFFFFFFFFF",
        "FFFFFFFFFFFFFFFFFFFFFF              FFFFFFFFFFFFFF",
        "FFFFFFFFFFFFFFFFFFFFFF        FFFFFFFFFFFFFFFFFFFF",
        "FFFFFFFFFFFFFFFFFFFFFF        FFFFFFFFFFFFFFFFFFFF",
        "FFFFFFFFFFFFFFFFFFFFFF        FFFFFFFFFFFFFFFFFFFF",
        "FFFFFFFFFFFFFFFFFFFFFF        FFFFFFFFFFFFFFFFFFFF",
        "FFFFFFFFFFFFFFFF                    FFFFFFFFFFFFFF",
        "FFFFFFFFFFFFFFFF                    FFFFFFFFFFFFFF",
        "FFFFFFFFFFFFFFFF                    FFFFFFFFFFFFFF",
        "FFFFFFFFFFFFFFFF                  FFFFFFFFFFFFFFFF",
        "FFFFFFFFFFFFFFFFFFFFFF        FFFFFFFFFFFFFFFFFFFF",
        "FFFFFFFFFFFFFFFFFFFFFF        FFFFFFFFFFFFFFFFFFFF",
        "FFFFFFFFFFFFFFFFFFFFFF        FFFFFFFFFFFFFFFFFFFF",
        "FFFFFFFFFFFFFFFFFFFFFF        FFFFFFFFFFFFFFFFFFFF",
        "FFFFFFFFFFFFFFFFFFFFFF        FFFFFFFFFFFFFFFFFFFF",
        "FFFFFFFFFFFFFFFFFFFFFF        FFFFFFFFFFFFFFFFFFFF",
        "  FFFFFFFFFFFFFFFFFFFF        FFFFFFFFFFFFFFFFFFFF",
        "  FFFFFFFFFFFFFFFFFFFF        FFFFFFFFFFFFFFFFFF  ",
        "                                                  ",
        "           Done is better than perfect.           ",
        "                                  - Mark Zuckerberg"
      },
      {
        "                              PPPPPP              ",
        "        PPPPPP            PPPPPPPPPPPP            ",
        "  PPPPPPPPPPPPPP        PPPPPPPPPPPPPPPP          ",
        "  PPPPPPPPPPPPPP      eePPPPPPPPPPPPPPPP          ",
        "      PPPPPPPPPP    PPPPPPPPPPPPPPPPPPPPPP        ",
        "      PPPPPPPPPP  PPPPPPPPPPPPPPPPPPPPPPPP        ",
        "    PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP      ",
        "    PPPPPPPPPP  PPPPPPPPPPPPPPPPPPPPPPPPPPPP      ",
        "    PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP      ",
        "    PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP    ",
        "    PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP  ",
        "      PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPeePP  ",
        "        PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP  PP  ",
        "          PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP  PP  ",
        "                PPPPPPPPPPPPPPeePPPP    PPPPPPPP  ",
        "                PPPPPP  PPPPPP  PPPP    PPPPPP    ",
        "                PPPP    PPPP    PPPP    PPPP      ",
        "                PPPP  PPPPPP    PPPP      PP      ",
        "                PPPP  PPPP      PPPP      PP      ",
        "                PPPP  PPPP      PP        PP      ",
        "                PP      PPPP  PP          PP      ",
        "                PP        PPPPPP          PP      ",
        "                PP          PPPP          PP      ",
        "              PPPP        PPPPPPPP      PPPP      ",
        "              PP        PPPP    PP      PPPP      ",
        "            PPPP                        PP        ",
        "                                                  ",
        "   The three chief virtues of a programmer are:   ",
        "           Laziness, Impatience and Hubris.       ",
        "                                      - Larry Wall"
      },
      {
        "CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC",
        "CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC",
        "CCCCCCCC　　　　　　CCCCCCCC　　　　　CCCCCCCC　　　　　　CCCCCCCCCC　　　　　CCCCCCCC　　CCCCCCCCCC",
        "CCCCCC　　bbCCCCbb　　CCCC　　bbCCCC　　CCCCCC　llCCCCll　　CCCC　　　CCCCll　　CCCCCC　　CCCCCCCCCC",
        "CCCC　　CCCCCCCCCCCCCCCC　　CCCCCCCCCC　　CCCC　llCCCCCC　　CCCC　llCCCCCCCCCC　　CCCC　　CCCCCCCCCC",
        "CCCC　　CCCCCCCCCCCCCCCC　CCCCCCCCCCCCCC　CCCC　llCCCCCC　CCCC　　CCCCCCCCCCCC　　CCCC　　CCCCCCCCCC",
        "CCCC　CCCCCCCCCCCCCCCCCC　CCCCCCCCCCCCCC　CCCC　　　　　　CCCC　　CCCCCCCCCCCCCC　CCCC　　CCCCCCCCCC",
        "CCCC　　CCCCCCCCCCCCCCCC　CCCCCCCCCCCCCC　CCCC　llCCCCCC　　CC　　CCCCCCCCCCCC　　CCCC　　CCCCCCCCCC",
        "CCCC　　CCCCCCCCCCCCCCCC　　CCCCCCCCCC　　CCCC　llCCCCCCCC　CCCC　　CCCCCCCCCC　　CCCC　　CCCCCCCCCC",
        "CCCCCC　　llCCCCll　　CCCC　　bbCCCC　　CCCCCC　llbbCCll　　CCCC　　　CCCCll　　CCCCCC　　CCCCCCCCCC",
        "CCCCCCCC　　　　　　CCCCCCCC　　　　　CCCCCCCC　　　　　　CCCCCCCCCC　　　　　CCCCCCCC　　　　　　CC",
        "CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC",
        "                                                                                                    ",
        "                  It's easier to ask for forgiveness than it is to get permission.                  ",
        "                                                                                      - Grace Hopper"
      },
    }

    local random_index = math.random(#ascii_arts)

    dashboard.section.header.val = ascii_arts[random_index]
    dashboard.section.header.opts.hl = "DashboardHeader"

    local button = require("astronvim.utils").alpha_button
    dashboard.section.buttons.val = {
      button("LDR n", "  New File  "),
      button("LDR f f", "  Find File  "),
      button("LDR f o", "󰈙  Recents  "),
      button("LDR f w", "󰈭  Find Word  "),
      button("LDR f '", "  Bookmarks  "),
      button("LDR S l", "  Last Session  "),
    }

    dashboard.config.layout[1].val = vim.fn.max { 2, vim.fn.floor(vim.fn.winheight(0) * 0.2) }
    dashboard.config.layout[3].val = 5
    dashboard.config.opts.noautocmd = true

    return dashboard
  end,
  config = require "plugins.configs.alpha",
}
