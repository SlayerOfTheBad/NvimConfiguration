local colors = {
    black        = '#282828',
    white        = '#ebdbb2',
    red          = '#fb4934',
    green        = '#b8bb26',
    blue         = '#83a598',
    yellow       = '#fe8019',
    darkyellow   = '#d36912',
    gray         = '#a89984',
    darkgray     = '#3c3836',
    lightgray    = '#504945',
    inactivegray = '#7c6f64',
}

---@type Reactive.Preset
return {
    name = 'gruvbox',
    init = function()
        vim.opt.guicursor:append 'a:ReactiveCursor'
        vim.opt.cursorline = true
    end,
    modes = {
        no = {
            operators = {
                -- switch case
                [{ 'gu', 'gU', 'g~', '~' }] = {
                    winhl = {
                        CursorLine = { bg = '#334155' },
                        CursorLineNr = { fg = '#cbd5e1', bg = '#334155' },
                    },
                },
                -- change
                c = {
                    winhl = {
                        CursorLine = { bg = '#162044' },
                        CursorLineNr = { fg = '#93c5fd', bg = '#162044' },
                    },
                },
                -- delete
                d = {
                    winhl = {
                        CursorLine = { bg = '#350808' },
                        CursorLineNr = { fg = '#fca5a5', bg = '#350808' },
                    },
                },
                -- yank
                y = {
                    winhl = {
                        CursorLine = { bg = '#422006' },
                        CursorLineNr = { fg = '#fdba74', bg = '#422006' },
                    },
                },
            },
        },
        [{ 'i', 'niI' }] = {
            hl = {
                ReactiveCursor = { bg = '#5eead4' },
            },
        },
        i = {
            winhl = {
                CursorLine = { bg = '#024747' },
                CursorLineNr = { fg = '#5eead4', bg = '#012828' },
            },
        },
        -- c = {
        --     hl = {
        --         ReactiveCursor = { bg = '#cbd5e1' },
        --     },
        --     winhl = {
        --         CursorLine = { bg = '#202020' },
        --         CursorLineNr = { fg = '#ffffff', bg = '#303030' },
        --     },
        -- },
        -- n = {
        --     hl = {
        --         ReactiveCursor = { bg = colors.gray },
        --     },
        --     winhl = {
        --         CursorLine = { bg = colors.darkgray },
        --         CursorLineNr = { fg = colors.black, bg = colors.lightgray },
        --     },
        -- },
        -- visual
        [{ 'v', 'V', '\x16' }] = {
            hl = {
                ReactiveCursor = { bg = '#fed5b4' },
            },
            winhl = {
                CursorLineNr = { fg = '#fed5b4' },
                Visual = { bg = '#813f09' },
            },
        },
        -- select
        [{ 's', 'S', '\x13' }] = {
            winhl = {
                CursorLineNr = { fg = '#c4b5fd' },
                Visual = { bg = '#2e1065' },
            },
        },
        -- replace
        [{ 'R', 'niR', 'niV' }] = {
            hl = {
                ReactiveCursor = { bg = '#ffc2c2' },
            },
        },
        R = {
            winhl = {
                CursorLine = { bg = '#5f0707' },
                CursorLineNr = { fg = '#ffc2c2', bg = '#4b1b1b' },
            },
        },
    },
}
