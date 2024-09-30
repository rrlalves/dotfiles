return {
    "HiPhish/nvim-ts-rainbow2",
    requires = { "nvim-treesitter/nvim-treesitter" },
    config = function()
        require("nvim-treesitter.configs").setup({
            rainbow = {
                enable = true,
                extended_mode = true,
                -- max_file_lines = nil,
                -- colors = {}, -- table of hex strings
                -- termcolors = {} -- table of colour name strings
            },
        })
    end
}
