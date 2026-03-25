vim.filetype.add({
  extension = {
    templ = "templ",
    tf = "terraform",
    tfvars = "terraform",
  },
  pattern = {
    [".*[/\\]templates[/\\].*%.tpl"] = "helm",
    [".*[/\\]templates[/\\].*%.ya?ml"] = "helm",
  },
})
