function CowLineCopy(args)
	if (args.line1 == nil or args.line2 == nil) then
		print("You need to have text selected")
	end
	local line_start = args.line1
	local line_end = args.line2
	if line_start > line_end then
		-- Swap line_start with line_end
		line_start = line_start + line_end
		line_end = line_start - line_end
		line_start = line_start - line_end
	end

	local currentDir = vim.fn.getcwd()
	local currentFilePath = vim.fn.expand('%')
	local repoName = string.match(currentDir, ".+/(.+)")
  local branchName = vim.fn.system('git rev-parse --abbrev-ref HEAD')
	branchName = string.gsub(branchName, "\n$", "")
	local lineRange = line_start .. "-" .. line_end
	local fileType = vim.bo.filetype
	local lines = vim.fn.getline(line_start, line_end)
	local code = ""
	for k,v in ipairs(lines) do
		code = code .. v .. "\n"
	end

	local output = table.concat({
    "Repo: `" .. repoName .. "`",
    "Branch: `" .. branchName .. "`",
    "Line: " .. lineRange,
    "File: `" .. currentFilePath .. "`",
    "Code: ",
    "```" .. fileType .. "\n" .. code .. "```"
	})

	vim.fn.setreg("+", output, "c")
	print("Copied code lines")
end
vim.api.nvim_create_user_command('CowLineCopy', CowLineCopy, {range = true})

return {
	setup = function()end
}

