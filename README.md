# nvim-cow-copy-lines
Use a keyboard shortcut to copy the highlighted lines of code but on the clipboard create a format that is easier for humans to understand.

## Example of the output
Repo: `nvim-cow-commenter`
Branch: `main`
Line: 48-56
File: `lua/nvim-cow-commenter/init.lua`
Code: 
```lua
				lineNumber = lineNumber + 1
			end
		end
	else
		print("fileType not supported for comment toggle")
	end
end

vim.api.nvim_create_user_command('CowCommentToggle', ToggleComments, {range = true})
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
