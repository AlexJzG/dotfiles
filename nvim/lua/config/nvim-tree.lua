require("nvim-tree").setup({
    hijack_cursor = true,
    sync_root_with_cwd = true,
    view = {
        adaptive_size = false,
        width = 35,
    },
    renderer = {
        full_name = true,
        group_empty = true,
        highlight_opened_files = "name",
        special_files = {},
        symlink_destination = false,
        indent_markers = {
          enable = true,
        },
        icons = {
            git_placement = "signcolumn",
            show = {
                file = true,
                folder = true,
                folder_arrow = false,
                git = true,
            },
            padding = "  ",
        },
    },
    update_focused_file = {
        enable = true,
        update_root = true,
        ignore_list = { "help" },
    },
    diagnostics = {
        enable = true,
        show_on_dirs = true,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = ""
        },
    },
    filters = {
        custom = {
            "^.git$",
        },
    },
    actions = {
        change_dir = {
            enable = false,
            restrict_above_cwd = true,
        },
        open_file = {
            resize_window = true,
        },
    },
    log = {
        enable = false,
        truncate = true,
        types = {
            all = false,
            config = false,
            copy_paste = false,
            diagnostics = false,
            git = false,
            profile = false,
            watcher = false,
        },
    },
})
