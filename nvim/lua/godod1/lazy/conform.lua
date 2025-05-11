return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = function(bufnr)
					if require("conform").get_formatter_info("ruff_format", bufnr).available then
						return { "ruff_format" }
					else
						return { "isort", "black" }
					end
				end,
				javascrit = { "prettierd", "prettier", stop_after_first = true },
			},
            log_level = vim.log.levels.WARN,
            format_after_save = {
                lsp_format = "fallback",
                timeout_ns = 500
            }
		})
	end,
}
