return {
	{
		'Mofiqul/dracula.nvim'
	},
	{

	},
	{
    "zaldih/themery.nvim",
    lazy = false,
    config = function()
      require("themery").setup({
  themes = {
	  { name = "Dracula", colorscheme = "dracula" },
  }, -- Your list of installed colorschemes.
  livePreview = true, -- Apply theme while picking. Default to true.
      })
    end
    },
  }
