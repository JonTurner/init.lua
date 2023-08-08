--                                     ██
--                                    ░░
--  ███████   █████   ██████  ██    ██ ██ ██████████
-- ░░██░░░██ ██░░░██ ██░░░░██░██   ░██░██░░██░░██░░██
--  ░██  ░██░███████░██   ░██░░██ ░██ ░██ ░██ ░██ ░██
--  ░██  ░██░██░░░░ ░██   ░██ ░░████  ░██ ░██ ░██ ░██
--  ███  ░██░░██████░░██████   ░░██   ░██ ███ ░██ ░██
-- ░░░   ░░  ░░░░░░  ░░░░░░     ░░    ░░ ░░░  ░░  ░░
--
--  ▓▓▓▓▓▓▓▓▓▓
-- ░▓ author ▓ Jon Turner (sort of **cough** ThePrimeagen )
-- ░▓ code   ▓ https://github.com/JonTurner/init.lua
-- ░▓ mirror ▓ https://github.com/JonTurner/init.lua
-- ░▓▓▓▓▓▓▓▓▓▓
-- ░░░░░░░░░░

require("theprimeagen.set")
require("theprimeagen.remap")

-- DO NOT INCLUDE THIS
vim.opt.rtp:append("~/personal/streamer-tools")
-- DO NOT INCLUDE THIS

local augroup = vim.api.nvim_create_augroup
local ThePrimeagenGroup = augroup('ThePrimeagen', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

local autocmd = vim.api.nvim_create_autocmd
local vimwiki_group = augroup('VimWiki', {})

function R(name)
    require("plenary.reload").reload_module(name)
end

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

autocmd({"BufWritePre"}, {
    group = ThePrimeagenGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

-- adds ability to link non markdown files in vimwiki
-- instead of [foo](foo.rb) - simply do foo.rb
-- when cursor is on foo.rb, press <enter> to navigate to it
-- This remaps enter to `gf` in vimwiki buffers
autocmd({"FileType"}, {
    group = vimwiki_group,
    pattern = 'vimwiki',
    callback = function()
        vim.api.nvim_buf_set_keymap(0, 'n', '<CR>', 'gf', {silent=true})
    end,
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
vim.g.python3_host_prog = "/opt/homebrew/bin/python3"
