return require('packer').startup(function()

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
        use {'neoclide/coc.nvim', branch = 'master', run = 'yarn install --frozen-lockfile'}
	
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

end)
