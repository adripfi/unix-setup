-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- vscode keymas
if vim.g.vscode then
  vim.g.mapleader = " "
  local vscode = require("vscode-neovim")

  -- jump between open files
  vim.keymap.set({ "n", "v" }, "H", function()
    vscode.action("workbench.action.previousEditor")
  end)
  vim.keymap.set({ "n", "v" }, "L", function()
    vscode.action("workbench.action.nextEditor")
  end)
  -- move open file tabs
  vim.keymap.set({ "n", "v" }, "<A-S-h>", function()
    vscode.action("workbench.action.moveEditorLeftInGroup")
  end)
  vim.keymap.set({ "n", "v" }, "<A-S-l>", function()
    vscode.action("workbench.action.moveEditorRightInGroup")
  end)

  -- focus on terminal and debug console
  vim.keymap.set({ "n", "v" }, "<leader>d", function()
    vscode.action("workbench.debug.action.focusRepl")
  end)
  vim.keymap.set({ "n", "v" }, "<leader>t", function()
    vscode.action("workbench.action.terminal.focus")
  end)

  -- open copilot inline chat
  vim.keymap.set({ "n", "v" }, "<leader>c", function()
    vscode.action("workbench.action.openQuickChat.copilot")
  end)

  -- open breadcrumbs/methods overview for navigating between functions or methods found in file
  vim.keymap.set({ "n", "v" }, "<leader>m", function()
    vscode.action("breadcrumbs.focusAndSelect")
  end)

  -- open/close sidebar
  vim.keymap.set({ "n", "v" }, "<leader>e", function()
    vscode.action("workbench.action.toggleSidebarVisibility")
  end)
  -- open/close bottom bar
  vim.keymap.set({ "n", "v" }, "<leader>b", function()
    vscode.action("workbench.action.togglePanel")
  end)

  -- goto references or list references
  vim.keymap.set({ "n" }, "<leader>u", function()
    vscode.action("editor.action.goToReferences")
  end)

  --  split editor
  vim.keymap.set({ "n", "v" }, "<C-S-o>", function()
    vscode.action("workbench.action.splitEditorRight")
  end)
  vim.keymap.set({ "n", "v" }, "<C-S-e>", function()
    vscode.action("workbench.action.splitEditorDown")
  end)
end
