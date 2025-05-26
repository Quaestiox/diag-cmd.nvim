# diag_cmd

### Install
lazy:
```
{ 
    { "Quaestiox/diag_cmd" },
}
```

### Command
`VirtualText` : enable/disable virtual_text
`Signs` : enable/disable signs
`Underline` : enable/disable underline
`UpdateInInsert` : enable/disable update_in_insert
`DiagEnableAll` : enable all field in config
`DiagDisable` : disable diagnostic 
`DiagDefault` : if you not setup show_config, you will use default config
`DiagCustom` : Load your config manually


### Config
```lua
local diag = require("core.diag_cmd")
diag.setup({
	show_config = {
		virtual_text = true,
		signs = true,
		underline = true,
		update_in_insert = true,
	},

    -- choose the file type which you don't want to use diagnosis
	disabled_file_type = { "lua" },
})
```
