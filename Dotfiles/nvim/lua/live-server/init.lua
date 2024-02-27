local status_ok, live_server = pcall(require, "live_server")
if not status_ok then
  return
end

live_server.setup({
  port = 8080,
  browser_command = "brave", -- Empty string starts up with default browser
  quiet = false,
  no_css_inject = true, -- Disables css injection if true, might be useful when testing out tailwindcss
})
