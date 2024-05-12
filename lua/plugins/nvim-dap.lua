return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"folke/neodev.nvim",
	},
	lazy = true,
	keys = {
		{
			"<leader>db",
			function()
				require("dap").toggle_breakpoint()
			end,
			desc = "toggle breakpoint",
		},
		{
			"<F5>",
			function()
				require("dap").continue()
			end,
			desc = "continue",
		},
		{
			"<F6>",
			function()
				require("dap").step_into()
			end,
			desc = "step into",
		},
		{
			"<F7>",
			function()
				require("dap").step_over()
			end,
			desc = "step over",
		},
		{
			"<F8>",
			function()
				require("dap").step_out()
			end,
			desc = "step over",
		},
	},

	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		dapui.setup()

		require("neodev").setup({
			library = { plugins = { "nvim-dap-ui" }, types = true },
		})

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		dap.adapters.codelldb = {
			type = "server",
			port = "${port}",
			executable = {
				-- CHANGE THIS to your path!
				command = "/home/austenlebeau/.local/share/nvim/mason/packages/codelldb/codelldb",
				args = { "--port", "${port}" },

				-- On windows you may have to uncomment this:
				-- detached = false,
			},
		}

		dap.configurations.cpp = {
			{
				name = "Launch file",
				type = "codelldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
			},
		}

		dap.configurations.c = dap.configurations.cpp
	end,
}
