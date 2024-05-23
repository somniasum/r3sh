vim.cmd("colorscheme onedark_dark")

require("onedarkpro").setup({
  colors = {
    red = "#FF0000",
  },
  highlights = {
    Comment = { italic = true },
    Directory = { bold = true },
    ErrorMsg = { italic = true, bold = true }
  },
   styles = {
    types = "NONE",
    methods = "NONE",
    numbers = "NONE",
    strings = "NONE",
    comments = "italic",
    keywords = "bold,italic",
    constants = "italic",
    functions = "italic, bold",
    operators = "NONE",
    variables = "bold, italic",
    parameters = "NONE",
    conditionals = "italic",
    virtual_text = "NONE",
  }
})



