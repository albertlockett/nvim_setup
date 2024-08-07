return {
  "mfussenegger/nvim-dap",
  recommended = true,
  desc = "Debugging support. Requires language specific adapters to be configured. (see lang extras)",

  dependencies = {
    "rcarriga/nvim-dap-ui",
    -- virtual text for the debugger
    {
      "theHamsta/nvim-dap-virtual-text",
      opts = {},
    },
  },

  -- stylua: ignore
  keys = {
    { "<leader>d", "", desc = "+debug", mode = {"n", "v"} },
    { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
    { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
    { "<leader>dc", function() require("dap").continue() end, desc = "Continue" },
    { "<leader>da", function() require("dap").continue({ before = get_args }) end, desc = "Run with Args" },
    { "<leader>dC", function() require("dap").run_to_cursor() end, desc = "Run to Cursor" },
    { "<leader>dg", function() require("dap").goto_() end, desc = "Go to Line (No Execute)" },
    { "<leader>di", function() require("dap").step_into() end, desc = "Step Into" },
    { "<leader>dj", function() require("dap").down() end, desc = "Down" },
    { "<leader>dk", function() require("dap").up() end, desc = "Up" },
    { "<leader>dl", function() require("dap").run_last() end, desc = "Run Last" },
    { "<leader>do", function() require("dap").step_out() end, desc = "Step Out" },
    { "<leader>dO", function() require("dap").step_over() end, desc = "Step Over" },
    { "<leader>dp", function() require("dap").pause() end, desc = "Pause" },
    { "<leader>dr", function() require("dap").repl.toggle() end, desc = "Toggle REPL" },
    { "<leader>ds", function() require("dap").session() end, desc = "Session" },
    { "<leader>dt", function() require("dap").terminate() end, desc = "Terminate" },
    { "<leader>dw", function() require("dap.ui.widgets").hover() end, desc = "Widgets" },
  },

  config = function()
	  --local codelldb = mason_registry.get_package("codelldb")
	  --local execution_path = codellb:get_install_path() .. "/extensions/"
	  --local codelldb_path = extension_path .. "adapter/codelldb"
	  local lldb = {
		  name = "Launch plan-executor",
		  type = "codelldb", -- matches the adapter
		  request = "launch", -- could also attach to a currently running process
		  program = function()
			  return "/home/albertlockett/Development/sophon/src/rust/target/debug/plan-executor"
			  -- return "/Users/albertlockett/Development/sophon/src/rust/target/debug/plan-executor"
		  end,
		  cwd = "${workspaceFolder}",
		  stopOnEntry = false,
		  args = {"local"},
		  runInTerminal = false,
	  }

	  local lldb_phalanx = {
		name = "Launch phalanx - local pe",
		type = "codelldb",
		request = "launch",
		program = function()
			return "/home/albertlockett/Development/sophon/src/phalanx/target/debug/phalanx"
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		args = { "--stack-name", "local-minimum-with-pe" },
		env = {
			-- PHALANX_ROOT_URI = "/home/albertlockett/Desktop/lance_datasets/",
			PHALANX_ROOT_URI = "gs://albert-bucket-lancedb-devland/",
			PHALANX_TMP_URI = "/tmp",
			PHALANX_MAGIC_TOKENS = "sk1234==",
			RUST_LOG = "info"
		}
	  }



	  require('dap').configurations.rust = {
		  lldb, -- different debuggers or more configurations can be used here
		  lldb_phalanx
	  }
  end,
}
