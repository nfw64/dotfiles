return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      qml = { "qmlformat" },
    },
    formatters = {
      qmlformat = {
        command = "/usr/lib/qt6/bin/qmlformat", -- Adjust path if needed
      },
    },
  },
}
