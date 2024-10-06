# nvim-cow-copy-lines
Use a keyboard shortcut to copy the highlighted lines of code but on the clipboard create a format that is easier for humans to understand.
![Copy Line Info Small](https://github.com/user-attachments/assets/7a01c481-a91c-4dbd-9fd9-4b4b16ed1dc0)


## Example of the output
Repo: `nvim-cow-copy-lines`

Branch: `main`

Line: 47-56

File: `lua/nvim-cow-copy-lines/init.lua`

Code: 

```lua
	local output = table.concat({
		"Repo: `" .. repoName .. "`\n",
		"Branch: `" .. branchName .. "`\n",
		"Line: " .. lineRange .. "\n",
		"File: `" .. currentFilePath .. "`\n",
		"Code: \n",
		"```" .. fileType .. "\n",
		code,
		"```"
	})
```

## Why
I wanted a quick way to send someone else a reference to code. I want the recieving party to know exactly what code I'm talking about with a simple copy/paste type functionality.

## Requirements
When copying lines of code you should be in a github repo.

## Install

### Lazy
Install using [lazy.nvim](https://github.com/folke/lazy.nvim)
```lua
{
    "h-cow/nvim-cow-copy-lines",
    config = function()
        vim.keymap.set('n', '<leader>cl', ':CowLineCopy<CR>', {desc = "Copy Line"})
        vim.keymap.set('v', '<leader>cl', ':CowLineCopy<CR>', {desc = "Copy Line"})
    end,
},
```
