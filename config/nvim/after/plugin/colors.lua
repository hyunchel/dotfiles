function ColorMyPencils(color)
	-- color = color or "rose-pine"
	color = color or "nightfox"
	vim.cmd.colorscheme(color)
end

ColorMyPencils()
