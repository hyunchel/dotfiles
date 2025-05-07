-- get vimwiki directory
local function get_vimwiki_dir()
	local home_dir = os.getenv("HOME")
	return home_dir .. "/wiki"
end
-- check if the current buffer is reading inside vimwiki directory
local function is_wiki_file()
	local vimwiki_dir = get_vimwiki_dir()
	local filepath = vim.api.nvim_buf_get_name(0)

	-- has to be in wiki dir, MD ext, and is empty
	local in_wiki_dir = string.find(filepath, vimwiki_dir) ~= nil
	local is_markdown = vim.api.nvim_buf_get_option(0, "filetype") == "markdown"
	local is_vimwiki = vim.api.nvim_buf_get_option(0, "filetype") == "vimwiki"
	local is_not_index = string.find(filepath, "index.md") == nil and string.find(filepath, "diary.md") == nil
	-- does not have .nvim extension
	local is_not_nvim = string.find(filepath, ".nvim") == nil

	return in_wiki_dir and (is_markdown or is_vimwiki) and is_not_index and is_not_nvim
end

-- return filename of the current buffer
local function get_filename()
	local filepath = vim.api.nvim_buf_get_name(0)
	local pattern = "(.-)([^\\/]-%.?([^%.\\/]*))$"
	local _, full_file_name, _ = string.match(filepath, pattern)
	return full_file_name:match("(.+)%..+")
end

-- convert oneliner to title(meaning dash is replace to space)
local function to_title(filename)
	return string.lower(string.gsub(filename, "-", " "))
end

-- insert additional frontmatter by categories

local function insert_book_frontmatter(frontmatter)
	local metadata = { "ISBN", "author", "publication", "pages", "size", "characters", "translator", "status" }
	for _, v in ipairs(metadata) do
		if v == "status" then
			table.insert(frontmatter, v .. ": active")
		else
			table.insert(frontmatter, v .. ":")
		end
	end
end

local function insert_article_frontmatter(frontmatter)
	local metadata = { "ISSN", "DOI", "author", "publication", "pages" }
	for _, v in ipairs(metadata) do
		table.insert(frontmatter, v .. ":")
	end
end

local function insert_interview_frontmatter(frontmatter)
	local metadata = { "interview with", "publication", "medium" }
	for _, v in ipairs(metadata) do
		table.insert(frontmatter, v .. ":")
	end
end

local function insert_thesis_frontmatter(frontmatter)
	local metadata = { "author", "type", "university", "place", "pages" }
	for _, v in ipairs(metadata) do
		table.insert(frontmatter, v .. ":")
	end
end

local function insert_report_frontmatter(frontmatter)
	local metadata = { "author", "report number", "report type", "place", "institution", "pages" }
	for _, v in ipairs(metadata) do
		table.insert(frontmatter, v .. ":")
	end
end

local function insert_film_frontmatter(frontmatter)
	local metadata = { "director", "distributor", "genre", "format", "running time" }
	for _, v in ipairs(metadata) do
		table.insert(frontmatter, v .. ":")
	end
end

local function insert_artwork_frontmatter(frontmatter)
	local metadata = { "artist", "language", "medium", "artwork size" }
	for _, v in ipairs(metadata) do
		table.insert(frontmatter, v .. ":")
	end
end

local function insert_public_frontmatter(frontmatter)
	local metadata = { "author", "draft" }
	for _, v in ipairs(metadata) do
		if v == "author" then
			table.insert(frontmatter, v .. ": Hyunchel Kim")
		elseif v == "draft" then
			table.insert(frontmatter, v .. ": true")
		else
			table.insert(frontmatter, v .. ":")
		end
	end
end

local function insert_literature_frontmatter(frontmatter)
	local metadata = {
		"subtitle",
		"ISBN",
		"authors",
		"published",
		"publisher",
		"pages",
		"RIDI book ID",
		"RIDI annotation ID",
	}
	for _, v in ipairs(metadata) do
		table.insert(frontmatter, v .. ":")
	end
end

local function insert_permanent_frontmatter(frontmatter)
	local metadata = { "related", "keywords" }
	for _, v in ipairs(metadata) do
		table.insert(frontmatter, v .. ":")
	end
end

local function insert_incident_frontmatter(frontmatter)
	local metadata = { "status", "log" }
	for _, v in ipairs(metadata) do
		if v == "status" then
			table.insert(frontmatter, v .. ": active")
		else
			table.insert(frontmatter, v .. ":")
		end
	end
end

local function insert_postmortem_frontmatter(frontmatter)
	local metadata = { "reviewed", "status", "authors" }
	for _, v in ipairs(metadata) do
		if v == "authors" then
			table.insert(frontmatter, v .. ": player17")
		elseif v == "reviewed" then
			table.insert(frontmatter, v .. ": false")
		elseif v == "status" then
			table.insert(frontmatter, v .. ": active")
		else
			table.insert(frontmatter, v .. ":")
		end
	end
end

local function insert_writing_frontmatter(frontmatter)
	local metadata = { "status", "author" }
	for _, v in ipairs(metadata) do
		if v == "author" then
			table.insert(frontmatter, v .. ": Hyunchel Kim")
		elseif v == "status" then
			table.insert(frontmatter, v .. ": active")
		else
			table.insert(frontmatter, v .. ":")
		end
	end
end

local function insert_log_frontmatter(frontmatter)
	local metadata = {
		"motivation",
		"happiness",
		"fatigue",
		"burnout",
		"play",
		"purpose",
		"potential",
		"focus",
		"accomplishment",
		"discouragement",
		"optimism",
		"caffeine",
		"sleep",
		"workout",
	}
	for _, v in ipairs(metadata) do
		table.insert(frontmatter, v .. ":")
	end
end

-- extract parent directories under vimwiki
local function extract_parent_directory()
	local filepath = vim.api.nvim_buf_get_name(0)
	local curdir = string.match(filepath, "(.*)/.*.md")
	local vimwiki_dir = get_vimwiki_dir()
	local start_idx, end_idx = string.find(curdir, vimwiki_dir)
	local pdir = string.sub(curdir, end_idx + 1)
	return pdir
end

-- extract categories from parent directories
local function extract_categories()
	-- check if it's created under subdirectories.
	-- if so, include that in categories.

	-- find parent directories that could be used as categories.
	local pdir = extract_parent_directory()

	local categories = ""
	for dirname in string.gmatch(pdir, "[^/]*") do
		if string.len(dirname) > 0 then
			if string.len(categories) > 0 then
				categories = categories .. ", " .. dirname
			else
				categories = dirname
			end
		end
	end

	return categories
end

-- insert frontmatter if new file and applicable
local function insert_frontmatter()
	-- get the first line
	local line = vim.api.nvim_buf_get_lines(0, 0, 1, false)[1]
	if line ~= nil and line == "---" then
		return
	end
	if is_wiki_file() then
		local frontmatter = { "---" }

		-- insert shared frontmatters that should be on top
		local shared_metadata = { "title", "abstract" }
		for _, v in ipairs(shared_metadata) do
			if v == "title" then
				local fname = to_title(get_filename())
				table.insert(frontmatter, v .. ": " .. fname)
			else
				table.insert(frontmatter, v .. ":")
			end
		end

		-- insert additional frontmatter by category
		local pdir = extract_parent_directory()
		if string.find(pdir, "/bibliography/") then
			if string.find(pdir, "/book") then
				insert_book_frontmatter(frontmatter)
			elseif string.find(pdir, "/article") then
				insert_article_frontmatter(frontmatter)
			elseif string.find(pdir, "/interview") then
				insert_interview_frontmatter(frontmatter)
			elseif string.find(pdir, "/thesis") then
				insert_thesis_frontmatter(frontmatter)
			elseif string.find(pdir, "/report") then
				insert_report_frontmatter(frontmatter)
			elseif string.find(pdir, "/film") then
				insert_film_frontmatter(frontmatter)
			elseif string.find(pdir, "/artwork") then
				insert_artwork_frontmatter(frontmatter)
			end

			local misc_bibliographic_metadata = {
				"short title",
				"date",
				"language",
				"URL",
				"accessed",
				"archive",
				"loc. in archive",
				"extra",
			}
			for _, v in ipairs(misc_bibliographic_metadata) do
				table.insert(frontmatter, v .. ":")
			end
		elseif string.find(pdir .. "/", "/public/") then
			insert_public_frontmatter(frontmatter) -- need to be certain about '/public/'
		elseif string.find(pdir .. "/", "/literature/") then
			insert_literature_frontmatter(frontmatter) -- need to be certain about '/literature/'
		elseif string.find(pdir .. "/", "/permanent/") then
			insert_permanent_frontmatter(frontmatter) -- need to be certain about '/permanent/'
		elseif string.find(pdir .. "/", "/incident/") then
			insert_incident_frontmatter(frontmatter) -- need to be certain about '/incident/'
		elseif string.find(pdir .. "/", "/postmortem/") then
			insert_postmortem_frontmatter(frontmatter) -- need to be certain about '/postmortem/'
		elseif string.find(pdir .. "/", "/writing/") then
			insert_writing_frontmatter(frontmatter) -- need to be certain about '/writing/'
		elseif string.find(pdir .. "/", "/log/") then
			insert_log_frontmatter(frontmatter) -- need to be certain about '/log/'
		else
			-- nothing for general yet.
		end

		-- add metadata that are shared by every type(bibliography, public, general)
		local misc_shared_metadata = { "categories", "tags" }
		for _, v in ipairs(misc_shared_metadata) do
			if v == "categories" then
				local categories = extract_categories()
				table.insert(frontmatter, v .. ": " .. categories)
			else
				table.insert(frontmatter, v .. ":")
			end
		end

		table.insert(frontmatter, "added: " .. os.date("%F %T"))
		table.insert(frontmatter, "updated: " .. os.date("%F %T"))

		table.insert(frontmatter, "---")

		vim.api.nvim_del_current_line()
		vim.api.nvim_buf_set_lines(0, 0, 0, false, frontmatter)
	end
end

-- update frontmatter if applicable
local function update_frontmatter()
	if is_wiki_file() then
		-- vim.fn.search moves the cursor
		local cur_pos = vim.fn.getcurpos()
		-- update 'updated' line
		local line_no = vim.fn.search("updated: ")
		if line_no > 0 then
			local frontmatter = {}
			table.insert(frontmatter, "updated: " .. os.date("%F %T"))
			vim.api.nvim_buf_set_lines(0, line_no - 1, line_no, false, frontmatter)
			vim.fn.setpos(".", cur_pos)
		end
	end
end

vim.api.nvim_create_autocmd({ "BufNewFile", "Filetype" }, { callback = insert_frontmatter })
vim.api.nvim_create_autocmd({ "BufWritePost" }, { callback = update_frontmatter })

return {}
