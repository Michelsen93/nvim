return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      local treesitter = require("nvim-treesitter")
      treesitter.setup({})

      local installed_parsers = {}
      for _, parser in ipairs(treesitter.get_installed("parsers")) do
        installed_parsers[parser] = true
      end

      local group = vim.api.nvim_create_augroup("treesitter-highlight", { clear = true })
      vim.api.nvim_create_autocmd("FileType", {
        group = group,
        callback = function(args)
          if vim.bo[args.buf].buftype ~= "" then
            return
          end

          local filetype = vim.bo[args.buf].filetype
          local language = vim.treesitter.language.get_lang(filetype) or filetype
          if installed_parsers[language] then
            vim.treesitter.start(args.buf, language)
          end
        end,
      })
    end,
  },
}
