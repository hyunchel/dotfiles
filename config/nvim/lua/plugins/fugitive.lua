return {
	"tpope/vim-fugitive",
	config = function()
		vim.keymap.set("n", "<leader>g", vim.cmd.Git, { desc = "Git" })
		vim.keymap.set("n", "<leader>b", "<cmd>Git blame<CR>", { desc = "Git blame" })
	end,
}
