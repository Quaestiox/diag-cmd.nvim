# Diag-CMD

This plugin provides various commands for more flexible display of diagnostic information.

## Installing

### lazy:
``` 
{ "Quaestiox/diag-cmd.nvim" },
```

## Options
```lua
local diag = require("diag-cmd")
diag.setup({
	show_config = {
		virtual_text = false,
        virtual_line = false
		signs = true,
		underline = true,
		update_in_insert = false,
	},
    -- the file types which you don't want to use diagnostic message
	disabled_file_type = { "lua" },

    -- floating window's style
    float = {
		scope = "line",
		border = "rounded",
		source = "always",
		focusable = false,
		header = "💡",
		jump = true,

    }
})
```

## Usage

### Commands

- `VirtualText` : enable/disable virtual_text
- `VirtualLine` : enable/disable virtual_line
- `Signs` : enable/disable signs
- `Underline` : enable/disable underline
- `UpdateInInsert` : enable/disable update_in_insert
- `DiagEnableAll` : enable all field in config
- `DiagDisable` : disable diagnostic 
- `DiagDefault` : if you not setup show_config, you will use default config
- `DiagCustom` : Load your config manually
- `DiagFloat` : Display the diagnostic message in the floating window

