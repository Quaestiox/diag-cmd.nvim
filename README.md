# Diag-CMD

This plugin provides various commands for more flexible display of diagnostic information.

### Installing

#### lazy:
``` 
{ "Quaestiox/diag-cmd.nvim" },
```

### Options
```lua
local diag = require("diag-cmd")
diag.setup({
	show_config = {
		virtual_text = true,
		signs = true,
		underline = true,
		update_in_insert = true,
	},
	disabled_file_type = { "lua" },
})
```

### Usage
- `VirtualText` : enable/disable virtual_text
- `Signs` : enable/disable signs
- `Underline` : enable/disable underline
- `UpdateInInsert` : enable/disable update_in_insert
- `DiagEnableAll` : enable all field in config
- `DiagDisable` : disable diagnostic 
- `DiagDefault` : if you not setup show_config, you will use default config
- `DiagCustom` : Load your config manually



