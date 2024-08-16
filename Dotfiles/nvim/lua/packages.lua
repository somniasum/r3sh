require('packer').startup(function(use)

	--Packer Nvim
	use 'wbthomason/packer.nvim'

	--Colorizer / Hex Codes
	use 'ziontee113/color-picker.nvim'
	
	--Color theme
	use 'EdenEast/nightfox.nvim'

	--LSP manager
	use 'williamboman/mason.nvim'

	--LSP manager 2
	use {'neoclide/coc.nvim', branch = 'release'}

	--Autopairs 
	use {
	"windwp/nvim-autopairs",
    	config = function() require("nvim-autopairs").setup {} end
	}
	--TreeSitter for color schemes
	use 'nvim-treesitter/nvim-treesitter'

	--Live Server for web host testing
	use({
		"aurum77/live-server.nvim",
		run = function()
			require"live_server.util".install()
		end,
		cmd = { "LiveServer", "LiveServerStart", "LiveServerStop" },
	})

	--LSP
	use 'ray-x/lsp_signature.nvim'
	--Webicons for webdev
	use 'kyazdani42/nvim-web-devicons'

	--Hexcode colorizer
	use 'norcalli/nvim-colorizer.lua'

	--File manager
	use 'nvim-tree/nvim-tree.lua'

	--Multi line edit tool
	use 'mg979/vim-visual-multi'

	--Welcome Screen / Greeter
	use {
    	'goolord/alpha-nvim',
  	requires = { 'nvim-tree/nvim-web-devicons' },
    	config = function ()
        require'alpha'.setup(require'alpha.themes.startify'.config)
    	end
	}
	

	--Snippet 
	use({
	"L3MON4D3/LuaSnip",
	-- follow latest release.
	tag = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!:).
	run = "make install_jsregexp"
	})

	--Telescope / file finder
	use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.2',
	-- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
	}

	--StatusLine
	use {
                 'nvim-lualine/lualine.nvim',
                 requires = { 'nvim-tree/nvim-web-devicons', opt = true }
        }

	--OneDarkPro theme
	use "olimorris/onedarkpro.nvim"

	--notify
	use 'rcarriga/nvim-notify'

	--lazygit
	-- nvim v0.7.2
	use({
    		"kdheepak/lazygit.nvim",
    	-- optional for floating window border decoration
    		requires = {
        	"nvim-lua/plenary.nvim",
    		},
	})
	use  'lervag/vimtex'
end)


