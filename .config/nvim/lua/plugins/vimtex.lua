vim.g.maplocalleader = ","

return {
  "lervag/vimtex",
  lazy = false,
  init = function()
    vim.g.vimtex_view_method = "zathura"
    vim.g.vimtex_compiler_latexmk = {
      build_dir = "build",
      callback = 1,
      continuous = 1,
      executable = "latexmk",
      options = {
        "-pdf",
        "-interaction=nonstopmode",
        "-synctex=1",
        "-outdir=build",
      },
    }

    vim.api.nvim_create_autocmd("BufWritePost", {
      pattern = { "*.tex", "*.bib" },
      command = "VimtexCompile",
    })
  end
}
