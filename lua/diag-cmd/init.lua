
local M = {}

M.defaultCfg = {
	virtual_text = false,
    virtual_line = false, 
	signs = true,
	underline = true,
	update_in_insert = false,
}

M.disableCfg = {
	virtual_text = false,
    virtual_line = false, 
	signs = false,
	underline = false,
	update_in_insert = false,
}

M.enableCfg = {
	virtual_text = true,
    virtual_line = true, 
	signs = true,
	underline = true,
	update_in_insert = true,
}

M.customCfg = {}

M.disabled_file_type = {}

M.defaultFloat = {
		scope = "line",
		border = "rounded",
		source = "always",
		focusable = false,
		header = "💡",
		jump = true,
}

M.customFloat = {}



local function virtual_text(opts)
	local cfg = vim.diagnostic.config()
	vim.diagnostic.config({
		virtual_text = not cfg.virtual_text,
        virtual_line = cfg.virtual_line, 
		signs = cfg.signs,
		underline = cfg.underline,
		update_in_insert = cfg.update_in_insert,
	})
end

local function virtual_line(opts)
	local cfg = vim.diagnostic.config()
	vim.diagnostic.config({
		virtual_text = cfg.virtual_text,
        virtual_line = not cfg.virtual_line, 
		signs = cfg.signs,
		underline = cfg.underline,
		update_in_insert = cfg.update_in_insert,
	})
end

local function signs(opts)
	local cfg = vim.diagnostic.config()
	vim.diagnostic.config({
		virtual_text = cfg.virtual_text,
        virtual_line = cfg.virtual_line, 
		signs = not cfg.signs,
		underline = cfg.underline,
		update_in_insert = cfg.update_in_insert,
	})
end

local function underline(opts)
	local cfg = vim.diagnostic.config()
	vim.diagnostic.config({
		virtual_text = cfg.virtual_text,
        virtual_line = cfg.virtual_line, 
		signs = cfg.signs,
		underline = not cfg.underline,
		update_in_insert = cfg.update_in_insert,
	})
end

local function update_in_insert(opts)
	local cfg = vim.diagnostic.config()
	vim.diagnostic.config({
		virtual_text = cfg.virtual_text,
        virtual_line = cfg.virtual_line, 
		signs = cfg.signs,
		underline = cfg.underline,
		update_in_insert = not cfg.update_in_insert,
	})
end

local function diag_default(opts)
	vim.diagnostic.config(M.defaultCfg)
end

local function diag_disable(opts)
	vim.diagnostic.config(M.disableCfg)
end

local function diag_custom(opts)
	vim.diagnostic.config(M.customCfg)
end

local function diag_enable_all(opts)
	vim.diagnostic.config(M.enableCfg)
end

local function open_diag_float()
	vim.diagnostic.open_float(M.customFloat)
end


vim.api.nvim_create_user_command("VirtualText", virtual_text, {})

vim.api.nvim_create_user_command("VirtualLine", virtual_line, {})

vim.api.nvim_create_user_command("Signs", signs, {})

vim.api.nvim_create_user_command("Underline", underline, {})

vim.api.nvim_create_user_command("UpdateInInsert", update_in_insert, {})

vim.api.nvim_create_user_command("DiagDefault", diag_default, {})

vim.api.nvim_create_user_command("DiagDisable", diag_disable, {})

vim.api.nvim_create_user_command("DiagCustom", diag_custom, {})

vim.api.nvim_create_user_command("DiagEnableAll", diag_enable_all, {})

vim.api.nvim_create_user_command("DiagFloat", open_diag_float, {})


local function load()
	if M.disabled_file_type then
		vim.api.nvim_create_autocmd("FileType", {
			pattern = M.disabled_file_type,
			callback = diag_disable,
		})
    end
	vim.diagnostic.config(M.customCfg)

end

M.setup = function(config)
	local cfg = config or {}
	cfg.show_config = cfg.show_config or M.defaultCfg
	M.customCfg = cfg.show_config
	M.enabled_file_type = cfg.enabled_file_type
	M.disabled_file_type = cfg.disabled_file_type
    M.customFloat = cfg.customFloat or M.defaultFloat

    load()
end

return M





