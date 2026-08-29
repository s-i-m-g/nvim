-- CMake LSP (neocmakelsp) + cmake-tools.nvim for build/configure/run from inside nvim.
-- Requires `neocmakelsp`, `cmake`, and `ninja` on PATH.
vim.lsp.config("neocmake", {
  cmd = { "neocmakelsp", "stdio" },
  filetypes = { "cmake" },
  root_markers = { ".neocmake.toml", ".git", "build", "cmake" },
})
vim.lsp.enable("neocmake")

return {
  "Civitasv/cmake-tools.nvim",
  ft = { "cmake", "c", "cpp" },
  opts = {
    cmake_command = "cmake",
    ctest_command = "ctest",
    cmake_build_directory = "build",
    cmake_generate_options = { "-G", "Ninja", "-DCMAKE_EXPORT_COMPILE_COMMANDS=1" },
  },
  keys = {
    { "<leader>cb", "<cmd>CMakeBuild<cr>", desc = "CMake Build", silent = true },
    { "<leader>cr", "<cmd>CMakeRun<cr>", desc = "CMake Run", silent = true },
  },
}
