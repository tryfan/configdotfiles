local home = vim.fn.expand("$HOME")
require("chatgpt").setup({
    api_key_cmd = "sh " .. home .. "/.config/chatgpt/key.sh"
})

