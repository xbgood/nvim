require('toggleterm').setup({
    open_mapping = [[<C-t>]], -- 快捷键
    direction = 'float',
    terminal_mappings = true,
    shell = vim.o.shell,
    start_in_insert = true,
    close_on_exit = true,
    auto_scroll = true,
    persist_size = true,
    persist_mode = true,
    shade_terminals = true,
    shading_factor = -80,
    shading_ratio = -6,
    hide_numbers = true,
    size = 10,

    float_opts = {
        close_on_esc = true,
        shading_factor = 0.9,
        relative = 'editor',
        border = 'curved',
        width = 80,
        height = 20,
        row = 100,
        col = 200,
        winblend = 3,
        title_pos = 'left',
        zindex = 10,
    },
    winbar = {
        enabled = true,
        name_formatter = function(term)
            return term.name
        end
    },
})
