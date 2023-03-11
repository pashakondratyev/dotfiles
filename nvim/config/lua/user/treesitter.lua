require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "bash",
    "cpp",
    "css",
    "dockerfile",
    "fish",
    "go",
    "html",
    "java",
    "javascript",
    "jsdoc",
    "json",
    "json5",
    "lua",
    "make",
    "markdown",
    "markdown_inline",
    "python",
    "scss",
    "typescript",
    "vim",
    "yaml"
  },

  sync_install = false,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
})
