return {
    {
        'gelguy/wilder.nvim', -- this is for a command menu. like when you type ":"
        event = "VeryLazy",
        config = function()
            local wilder = require('wilder')
            wilder.setup({ modes = { ':' } })
            wilder.set_option('pipeline', {
                wilder.branch(
                    wilder.cmdline_pipeline({
                        fuzzy = 1,
                        set_pcre2_pattern = 1,
                    }),
                    wilder.python_search_pipeline({
                        pattern = 'fuzzy',
                    })
                ),
            })

            local highlighters = {
                wilder.pcre2_highlighter(),
                wilder.basic_highlighter(),
            }
            wilder.set_option('renderer', wilder.popupmenu_renderer(
                wilder.popupmenu_border_theme({
                    -- 'single', 'double', 'rounded' or 'solid'
                    -- can also be a list of 8 characters, see :h wilder#popupmenu_palette_theme() for more details
                    -- border = 'rounded',
                    max_height = '20%', -- max height of the palette
                    -- min_width = '100%', -- set to the same as 'max_height' for a fixed height window
                    -- prompt_position = 'bottom', -- 'top' or 'bottom' to set the location of the prompt
                    reverse = 1, -- set to 1 to reverse the order of the list, use in combination with 'prompt_position'
                    highlighter = highlighters,
                })
            ))
        end,
    }
}
