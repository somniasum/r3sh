return require('packer').startup(function()

	--live server
	
	use({
		"aurum77/live-server.nvim",
		run = function()
			require"live_server.util".install()
		end,
		cmd = { "LiveServer", "LiveServerStart", "LiveServerStop" },
	})
	--packer can manage itself
	use 'wbthomason/packer.nvim'
	--color scheme
	use 'gruvbox-community/gruvbox'
	--notifications
	use 'rcarriga/nvim-notify'

	use 'kyazdani42/nvim-web-devicons'
	use {
		'nvim-lualine/lualine.nvim',
		requires = {'kyazdani42/nvim-web-devicons', opt = true}
	}
	--auto-completition
	use 'ray-x/lsp_signature.nvim'

	--coc
        use {'neoclide/coc.nvim', branch = 'release'}
	
	--lsp installer new version
	use 'williamboman/mason.nvim'

	--treesitter
        use {
            'nvim-treesitter/nvim-treesitter',
            run = ':TSUpdate'
        }
	--auto pairs
	use {"windwp/nvim-autopairs"}

	--NigthFox for colorscheme
	use "EdenEast/nightfox.nvim" 

	--Barbar
	use {
             'romgrk/barbar.nvim',
              requires = {'kyazdani42/nvim-web-devicons', opt = true}
        }
	use {
            'nvim-tree/nvim-tree.lua',
             requires = {
                      'nvim-tree/nvim-web-devicons', -- optional, for file icons
             },
             tag = 'nightly' -- optional, updated every week. (see issue #1193)
        }
	use 'mfussenegger/nvim-dap'

	--dashboard
	use {
 	 	'glepnir/dashboard-nvim',
  		event = 'VimEnter',
  	config = function()
    		require('dashboard').setup {
      		-- config
    		}
  		end,
  		requires = {'nvim-tree/nvim-web-devicons'}
	}

end)
