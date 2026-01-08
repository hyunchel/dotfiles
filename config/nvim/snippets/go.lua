local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local rep = require("luasnip.extras").rep
local fmt = require("luasnip.extras.fmt").fmt

return {
	s(
		"iferr",
		fmt(
			'if err := <>(<>); err != nil {\n\tlog.Printf("failed to <>: %s", err)\n}\n<>',
			{ i(1, "function"), i(2, "arguments"), i(3, "do something"), i(4) },
			{ delimiters = "<>" }
		)
	),
	s(
		"ifer",
		fmt(
			'if err == nil {\n\tlog.Printf("failed to <>: %s", err)\n}\n<>',
			{ i(1, "do something"), i(2) },
			{ delimiters = "<>" }
		)
	),
	s(
		"ife",
		fmt(
			'if err != nil {\n\tlog.Printf("failed to <>: %s", err)\n}\n<>',
			{ i(1, "do something"), i(2) },
			{ delimiters = "<>" }
		)
	),
}
