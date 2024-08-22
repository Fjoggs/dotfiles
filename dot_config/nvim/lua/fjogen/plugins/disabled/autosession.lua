return {
	"rmagatti/auto-session",
	config = function()
		local auto_session = require("auto-session")

		auto_session.setup({
			log_level = "error",
			auto_save_enabled = false,
			auto_restore_enabled = false,
			auto_session_suppress_dirs = {
				"~/",
				"~/Downloads",
				"~/Documents",
				"~/Desktop/",
				"~/downloads",
				"~/documents",
				"~/desktop/",
			},
		})
	end,
}
