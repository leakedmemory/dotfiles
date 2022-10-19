lua << EOF
    local actions = require('telescope.actions')
    require('telescope').setup {
        defaults = {
            file_sorter = require('telescope.sorters').get_fzy_sorter,
            prompt_prefix = ' 🔍 ',
            color_devicons = true,

            file_previewer = require('telescope.previewers').vim_buffer_cat.new,
            grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
            flist_previewer = require('telescope.previewers').vim_buffer_qflist.new,

            mappins = {
                i = {

                },
            },
        },
        extensions = {
            fzy_native = {
                override_generic_sorter = false,
                overrider_file_sorter = true,
            },
        }
    }
EOF
