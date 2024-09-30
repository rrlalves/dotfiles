return {
    'UtkarshVerma/molokai.nvim',
    config = function()
        require('molokai').setup()
        vim.cmd[[colorscheme molokai]]
    end
}
