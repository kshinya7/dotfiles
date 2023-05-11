-- install packer if not installed on this machine
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

-- first time startup?
local packer_bootstrap = ensure_packer()

-- autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- fuzzy finder
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { { 'nvim-lua/plenary.nvim' } },
        config = function() require('kiyo.plugins.telescope') end
    }

    -- syntax highlighting
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSupdate',
        config = function() require('kiyo.plugins.treesitter') end
    }

    -- transparent bg
    use {
	'xiyaowong/transparent.nvim',
	config = function() require('kiyo.plugins.transparent') end
    }

    -- color scheme
    use {
        "catppuccin/nvim",
        as = "catppuccin",
        config = function() require('kiyo.plugins.theme') end
    }

    -- fancier status bar
    use {
        'nvim-lualine/lualine.nvim',
        config = function() require('kiyo.plugins.lualine') end,
    }

    -- file explorer
    use{
      "nvim-tree/nvim-tree.lua",
      config = function() require('kiyo.plugins.nvim-tree') end,
    }

    -- distraction-free writing mode
    use {
        'folke/zen-mode.nvim',
        opt = true,
        cmd = { 'ZenMode' },
        config = function() require('kiyo.plugins.zen-mode') end
    }

    -- automatically set up the configuration after cloning packer.nvim
    if packer_bootstrap then
        require('packer').sync()
    end
end)

