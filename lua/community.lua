-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.completion.copilot-vim-cmp" },

  -- Color Schemes
  -- Use gruvbox dark hard
  { import = "astrocommunity.colorscheme.gruvbox-nvim" },
}
