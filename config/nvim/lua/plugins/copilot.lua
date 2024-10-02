return {
	"github/copilot.vim",
	config = function()
		-- use to toggle copilot. mostly enabled by default, so it's generally used to disable.
		vim.g.copilot_filetypes = {
			xml = false,
			markdown = false,
			vimwiki = false,
			rust = false,
			go = false,
			ocaml = false,
			c = false,
			solidity = false,
		}
		-- color suggestion font
		-- vim.cmd[[highlight CopilotSuggestion guifg=#6fa8dc]]

		-- mappings
		-- vim.keymap.set("n", "<leader>cp", vim.cmd.Copilot)
	end,
}
