local js_based_languages = { "typescript", "javascript", "typescriptreact" }

for _, language in ipairs(js_based_languages) do
  require("dap").configurations[language] = {
    {
      type = "node",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      cwd = "${workspaceFolder}",
    },
    {
      type = "node",
      request = "launch",
      name = "Launch via Yarn",
      runtimeExecutable = "yarn",
      cwd = "${workspaceFolder}",
      port = 5858,
      preLaunchTask = "tsc: build - tsconfig.json",
      outFiles = {
        "${workspaceFolder}/dist/**/*.js",
      },
    },
    {
      type = "node",
      request = "attach",
      name = "Attach to Remote",
      address = "localhost",
      port = 9229,
      localRoot = "${workspaceFolder}/dist",
      remoteRoot = "/opt/carrier/dist",
      preLaunchTask = "tsc: build - tsconfig.json",
      outFiles = { "${workspaceFolder}/dist/**/*", "!**/node_modules/**" },
      skipFiles = { "<node_internals>/**/*" },
      sourceMaps = true,
    },
  }
end

return {
  -- {
  --   "pmizio/typescript-tools.nvim",
  --   dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  --   opts = {},
  -- },
}
