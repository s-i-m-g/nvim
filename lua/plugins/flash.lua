-- flash.nvim — hit the key, type 1-2 chars, every match on screen gets a
-- label; type the label to jump straight there.
return {
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {},
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash jump" },
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash treesitter jump" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Flash remote (act on text without moving cursor)" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Flash treesitter search" },
    { "<c-s>", mode = "c", function() require("flash").toggle() end, desc = "Toggle flash while in / search" },
  },
}
