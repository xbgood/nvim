---@diagnostic disable: undefined-global
-- https://github.com/wbthomason/packer.nvim

local packer = require("packer")
packer.startup(
    {
        -- 所有插件的安装都书写在 function 中
        function()

            -- 包管理器
            use {
                "wbthomason/packer.nvim"
            }
            -- 中文文档
            use {
                "yianwillis/vimcdoc",
            }
            -- nvim-tree
            use {
                "kyazdani42/nvim-tree.lua",
                requires = {
                    -- 依赖一个图标插件
                    "kyazdani42/nvim-web-devicons"
                },
                config = function()
                    -- 插件加载完成后自动运行 lua/conf/nvim-tree.lua 文件中的代码
                    require("conf.nvim-tree")
                end
            }
            -- 为了能让状态栏显示 git 信息，所以这个插件是必须的
            use {
                "lewis6991/gitsigns.nvim",
                requires = {
                    -- 依赖于该插件（一款 Lua 开发使用的插件）
                    "nvim-lua/plenary.nvim"
                },
                config = function()
                    require("gitsigns").setup()
                end
            }
            -- 支持 LSP 状态的 buffer 栏
            use {
                "akinsho/bufferline.nvim",
                requires = {
                    "famiu/bufdelete.nvim" -- 删除 buffer 时不影响现有布局
                },
                config = function()
                    require("conf.bufferline")
                end
            }
            -- 搜索时显示条目
            use {
                "kevinhwang91/nvim-hlslens",
                config = function()
                    require("conf.nvim-hlslens")
                end
            }
            -- 显示缩进线
            use {
                "lukas-reineke/indent-blankline.nvim",
                config = function()
                    require("conf.indent-blankline")
                end
            }
            -- 自动匹配括号
            use {
                "windwp/nvim-autopairs",
                config = function()
                    require("conf.nvim-autopairs")
                end
            }
            -- 快速跳转
            use {
                "phaazon/hop.nvim",
                config = function()
                    require("conf.hop")
                end
            }
            -- 包裹修改
            use {
                "ur4ltz/surround.nvim",
                config = function()
                    require("conf.surround")
                end
            }
            -- 显示光标下相同词汇
            use {
                "RRethy/vim-illuminate",
                config = function()
                    require("conf.vim-illuminate")
                end
            }
            -- 自动保存
            use {
                "Pocco81/auto-save.nvim",
                config = function()
                    require("conf.auto-save")
                end
            }
            -- 自动恢复光标位置
            use {
                "ethanholz/nvim-lastplace",
                config = function()
                    require("conf.nvim-lastplace")
                end
            }
            -- 自动会话管理
            use {
                "rmagatti/auto-session",
                config = function()
                    require("conf.session")
                end
            }
            -- 多光标模式
            use {
                "terryma/vim-multiple-cursors",
                config = function()
                    require("conf.vim-multiple-cursors")
                end
            }
            -- 内置终端
            use {
                "akinsho/toggleterm.nvim",
                config = function()
                    require("conf.toggleterm")
                end
            }
            -- undo tree
            use {
                "mbbill/undotree",
                config = function()
                    require("conf.undotree")
                end
            }
            -- 键位绑定器
            use {
                "folke/which-key.nvim",
                config = function()
                    require("conf.which-key")
                end
            }
            -- 模糊查找
            use {
                "nvim-telescope/telescope.nvim",
                requires = {
                    "nvim-lua/plenary.nvim", -- Lua 开发模块
                    "BurntSushi/ripgrep", -- 文字查找
                    "sharkdp/fd" -- 文件查找
                },
                config = function()
                    require("conf.telescope")
                end
            }
            -- 精美弹窗
            use {
                "rcarriga/nvim-notify",
                config = function()
                    require("conf.nvim-notify")
                end
            }
            -- todo tree
            use {
                "folke/todo-comments.nvim",
                config = function()
                    require("conf.todo-comments")
                end
            }
            -- 为状态栏提供上下文信息
            use {
                "SmiteshP/nvim-gps",
                requires = "nvim-treesitter/nvim-treesitter"
            }
            -- 美丽的状态栏
            use {
                'nvim-lualine/lualine.nvim',
                disable = false,
                load_file = true,
                -- after = {"nvim-gps", "gitsigns.nvim", "nvim-web-devicons"}
                config = function()
                    require("conf.lualine")
                end
            }
            -- LSP 基础服务
            use {
                "neovim/nvim-lspconfig",
                config = function()
                    require("conf.nvim-lspconfig")
                end
            }
            -- 自动安装 LSP
            use {
                "williamboman/mason.nvim",
                config = function()
                    require("conf.mason")
                end
            }
            use {
                "williamboman/mason-lspconfig.nvim",
                config = function()
                    require("conf.mason-lspconfig")
                end
            }
            -- LSP UI 美化
            use {
                "kkharji/lspsaga.nvim",
                config = function()
                    require("conf.lspsaga")
                end
            }
            -- LSP 进度提示
            use {
                "j-hui/fidget.nvim",
                config = function()
                    require("conf.fidget")
                end
            }
            -- 插入模式获得函数签名
            use {
                "ray-x/lsp_signature.nvim",
                config = function()
                    require("conf.lsp_signature")
                end
            }
            -- 灯泡提示代码行为
            use {
                "kosayoda/nvim-lightbulb",
                config = function()
                    require("conf.nvim-lightbulb")
                end
            }
            -- 自动代码补全系列插件
            use {
                "hrsh7th/nvim-cmp",  -- 代码补全核心插件，下面都是增强补全的体验插件
                requires = {
                    {"onsails/lspkind-nvim"}, -- 为补全添加类似 vscode 的图标
                    {"hrsh7th/vim-vsnip"}, -- vsnip 引擎，用于获得代码片段支持
                    {"hrsh7th/cmp-vsnip"}, -- 适用于 vsnip 的代码片段源
                    {"hrsh7th/cmp-nvim-lsp"}, -- 替换内置 omnifunc，获得更多补全
                    {"hrsh7th/cmp-path"}, -- 路径补全
                    {"hrsh7th/cmp-buffer"}, -- 缓冲区补全
                    {"hrsh7th/cmp-cmdline"}, -- 命令补全
                    {"f3fora/cmp-spell"}, -- 拼写建议
                    {"rafamadriz/friendly-snippets"}, -- 提供多种语言的代码片段
                    {"lukas-reineke/cmp-under-comparator"}, -- 让补全结果的排序更加智能
                    {"tzachar/cmp-tabnine", run = "./install.sh"} -- tabnine 源,提供基于 AI 的智能补全
                },
                config = function()
                    require("conf.nvim-cmp")
                end
            }
            -- 语法高亮
            use {
                "nvim-treesitter/nvim-treesitter",
                run = {":TSupdate"},
                requires = {
                    "p00f/nvim-ts-rainbow" -- 彩虹括号
                },
                config = function()
                    require("conf.nvim-treesitter")
                end
            }
            -- 代码注释
            use {
                "numToStr/Comment.nvim",
                config = function()
                    require("conf.comment")
                end
            }
            -- 代码格式化
            use {
                "sbdchd/neoformat",
                config = function()
                    require("conf.neoformat")
                end
            }
            -- 为不支持 LSP 高亮的主题提供默认高亮方案
            use {
                "folke/lsp-colors.nvim",
                config = function()
                    require("conf.lsp-colors")
                end
            }
            -- view tree
            use {
                "liuchengxu/vista.vim",
                config = function()
                    require("conf.vista")
                end
            }
            -- markdown
            use {
                -- markdown preview
                "iamcco/markdown-preview.nvim",
                ft = 'markdown',
                run = 'cd app && npm install',
                setup = function()
                    vim.g.mkdp_filetypes = {"markdown"}
                end,
            }
            use {
                -- vim markdown
                "preservim/vim-markdown",
                -- markdown image paste
                "ferrine/md-img-paste.vim",
                -- -- markdown table
                -- "dhruvasagar/vim-table-mode",
                -- -- markdown org
                -- "demonlord1997/markdown-org",
            }
            -- quick jk
            use {
                "PHSix/faster.nvim",
                event = {"VimEnter *"},
                config = function()
                    vim.api.nvim_set_keymap('n', 'j', '<Plug>(faster_move_j)', {noremap=false, silent=true})
                    vim.api.nvim_set_keymap('n', 'k', '<Plug>(faster_move_k)', {noremap=false, silent=true})
                    -- if you need map in visual mode
                    vim.api.nvim_set_keymap('v', 'j', '<Plug>(faster_vmove_j)', {noremap=false, silent=true})
                    vim.api.nvim_set_keymap('v', 'k', '<Plug>(faster_vmove_k)', {noremap=false, silent=true})
                end
            }
            -- F{char}
            use {
                "gukz/ftFT.nvim",
                config = function()
                    vim.g.ftFT_hl_group = "Search" -- will use Search hl group to do the highlitgt

                    vim.g.ftFT_keymap_keys = {"f", "t", "F"} -- Will create key binding for "f", "t", "F", but not "T"
                    vim.g.ftFT_keymap_skip_n = 1  -- if set this, will not create key binding for ftFT in normal mode
                    vim.g.ftFT_keymap_skip_ydc = 1  -- if set this, will not create key binding for [ydc][ftFT] in normal mode
                    vim.g.ftFT_keymap_skip_v = 1  -- if set this, will not create key binding for ftFT in visual mode

                    -- ftFT will show another sight line below current line, shows you how many `;` you need to jump there, disabled by default
                    vim.g.ftFT_sight_enable = 1  -- if set this, will show extra sight line
                    vim.g.ftFT_sight_hl_group = "Search"  -- if set htis, will use other hl group for sight line

                    require("ftFT").setup()  -- this will create default keymapping for you
                end
            }
            -- run code
            use {
                -- asyncrun 编译代码
                "skywind3000/asyncrun.vim",
                -- tasks 任务系统
                "skywind3000/asynctasks.vim",
            }
            -- 优秀的暗色主题
            use {
                "catppuccin/nvim",
                -- 改个别名，因为它的名字是 nvim，可能会冲突
                as = "catppuccin",
                config = function()
                    -- 插件加载完成后自动运行 lua/conf/catppuccin.lua 文件中的代码
                    require("conf.catppuccin")
                end,
            }
            -- other theme
            use {
                "rebelot/kanagawa.nvim",
                config = function()
                    require("conf.kanagawa")
                end,
            }
            -- 全局替换
            use {
                "nvim-pack/nvim-spectre",
                requires = {
                    "nvim-lua/plenary.nvim", -- Lua 开发模块
                    "BurntSushi/ripgrep" -- 文字查找
                },
                config = function()
                    require("conf.nvim-spectre")
                end
            }
            -- 显示网页色
            -- use {
            --     "norcalli/nvim-colorizer.lua",
            --     config = function()
            --         require("conf.nvim-colorizer")
            --     end
            -- }
            -- 快速运行代码片段
            -- use {
            --     "michaelb/sniprun",
            --     run = 'bash ./install.sh',
            --     config = function()
            --         require("conf.sniprun")
            --     end
            -- }
            -- coc.vim
            --use {
            --    'neoclide/coc.nvim',
            --    run = 'yarn install --frozen-lockfile'
            --}

        end,

        -- 使用浮动窗口
        config = {
            display = {
                open_fn = require("packer.util").float
            }
        }
    }
)

-- 实时生效配置
vim.cmd(
    [[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
    augroup end
    ]]
)

------------ sonokai zephyr ----------------------
vim.cmd.colorscheme "catppuccin"
-- vim.cmd.colorscheme "kanagawa"
