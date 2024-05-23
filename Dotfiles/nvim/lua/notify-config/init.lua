-- Load nvim-notify plugin
local notify = require("notify")

-- Configure notification settings
notify.setup({
    -- Default timeout for notifications (in milliseconds)
    timeout = 3000,
    -- Default position of notifications
    position = "bottom_right",
    }
)

-- Function to send a notification
local function sendNotification(message)
    notify(message)
end

-- Example usage:
sendNotification("Welcome to Neovim with notifications!")


