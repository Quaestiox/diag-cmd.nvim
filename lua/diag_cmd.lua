local M = {}

M.defaultCfg = {
	virtual_text = false,
	signs = true,
	underline = true,
	update_in_insert = false,
}

M.disableCfg = {
	virtual_text = false,
	signs = false,
	underline = false,
	update_in_insert = false,
}

M.customCfg = {}

M.disabled_file_type = {}

M.enabled_file_type = {}

local function virtual_text(opts)
	local cfg = vim.diagnostic.config()
	vim.diagnostic.config({
		virtual_text = not cfg.virtual_text,
		signs = cfg.signs,
		underline = cfg.underline,
		update_in_insert = cfg.update_in_insert,
	})
end

local function signs(opts)
	local cfg = vim.diagnostic.config()
	vim.diagnostic.config({
		virtual_text = cfg.virtual_text,
		signs = not cfg.signs,
		underline = cfg.underline,
		update_in_insert = cfg.update_in_insert,
	})
end

local function underline(opts)
	local cfg = vim.diagnostic.config()
	vim.diagnostic.config({
		virtual_text = cfg.virtual_text,
		signs = cfg.signs,
		underline = not cfg.underline,
		update_in_insert = cfg.update_in_insert,
	})
end

local function update_in_insert(opts)
	local cfg = vim.diagnostic.config()
	vim.diagnostic.config({
		virtual_text = cfg.virtual_text,
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

vim.api.nvim_create_user_command("VirtualText", virtual_text, {})

vim.api.nvim_create_user_command("Signs", signs, {})

vim.api.nvim_create_user_command("Underline", underline, {})

vim.api.nvim_create_user_command("UpdateInInsert", update_in_insert, {})

vim.api.nvim_create_user_command("DiagDefault", diag_default, {})

vim.api.nvim_create_user_command("DiagDisable", diag_disable, {})

M.setup = function(config)
	cfg = config or M.defaultCfg
	M.customCfg = cfg
end



vim.diagnostic.config({
	virtual_text = M.customCfg.virtual_text,
	signs = M.customCfg.signs,
	underline = M.customCfg.underline,
	update_in_insert = M.customCfg.update_in_insert,
})

function M.disable_file_type()
	if not M.disabled_file_type then
		return
	end
	vim.api.nvim_create_autocmd("FileType", {
		pattern = M.disabled_file_type,
		callback = diag_disable,
	})
end

function M.enable_file_type()
	if not M.enabled_file_type then
		return
	end

	vim.api.nvim_create_autocmd("FileType", {
		pattern = M.enabled_file_type,
		callback = diag_custom,
	})
end

return M
