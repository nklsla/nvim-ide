local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
    print(dap)
    return
end

local dap_ui_status_ok, dapui = pcall(require, "dapui")
if not dap_ui_status_ok then
    print(dapui)
    return
end

local dap_install_status_ok, dap_install = pcall(require, "dap-install")
if not dap_install_status_ok then
    print(dap_install)
    return
end

dap_install.setup {}

-- dap_install.config("python", {})
-- add other configs here
local python = "python3.8"
dap_install.config(
    "python",
    {
        adapters = {
            type = "executable",
            command = python,
            args = { "-m", "debugpy.adapter" }
        },
        configurations = {
            {
                type = "python",
                request = "launch",
                name = "Launch file",
                program = "${file}",
                pythonPath = function()
                    local cwd = vim.fn.getcwd()
                    if vim.fn.executable(cwd .. "/usr/bin/" .. python) == 1 then
                        return cwd .. "/usr/bin/" .. python
                    elseif vim.fn.executable(cwd .. "/usr/bin/" .. python) == 1 then
                        return cwd .. "/usr/bin/" .. python
                    else
                        return "/usr/bin/" .. python
                    end
                end
            }
        }
    }
)

-- DAP user interface
dapui.setup {
    sidebar = {
        elements = {
            {
                id = "scopes",
                size = 0.25, -- Can be float or integer > 1
            },
            { id = "breakpoints", size = 0.25 },
        },
        size = 40,
        position = "right", -- Can be "left", "right", "top", "bottom"
    },
    tray = {
        elements = {},
    },
}

vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" })

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end
