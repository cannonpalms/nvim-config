-- Resession <-> tmux-resurrect integration. Disabled by default.
--
-- Why: tmux-resurrect restores pane cwd and re-runs `nvim`, but a bare nvim
-- comes up blank -- buffers opened via :e are not in the kernel cmdline so
-- resurrect can't recover them. With this enabled, resession (already shipped
-- by AstroNvim) auto-saves the session every 60s while nvim runs and
-- auto-loads the cwd-keyed session on startup with no args. The restored
-- pane's cwd then maps to the session, and your buffers come back.
--
-- To enable: change `if false` to `if true` below.

if false then
  return {
    "stevearc/resession.nvim",
    opts = {
      autosave = { enabled = true, interval = 60, notify = false },
    },
    init = function()
      vim.api.nvim_create_autocmd("VimEnter", {
        nested = true,
        callback = function()
          if vim.fn.argc(-1) == 0 and vim.bo.filetype == "" then
            pcall(require("resession").load, vim.fn.getcwd(),
                  { dir = "dirsession", silence_errors = true })
          end
        end,
      })
    end,
  }
end

return {}
