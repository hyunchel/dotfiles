function ColorMyPencils(color)
	-- color = color or "rose-pine"
	color = color or "nightfox"
	-- color = color or "dayfox"
	-- color = color or "dawnfox"
	-- color = color or "terafox"
	-- color = color or "duskfox"
	vim.cmd.colorscheme(color)
end

ColorMyPencils()
