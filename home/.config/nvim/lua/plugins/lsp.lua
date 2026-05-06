return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- 'qmlls' is the standard key in nvim-lspconfig
        qmlls = {
          -- This forces the server to use your specific binary
          cmd = { "qmlls6" },
          filetypes = { "qml", "qmljs" },
          mason = false,
        },
      },
    },
  },
}
