set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

lua << EOF
local util = require 'lspconfig/util'
require'lspconfig'.julials.setup{
    root_dir = function(fname)
        return util.root_pattern("Project.toml")(fname) or util.find_git_ancestor(fname) or util.path.dirname(fname)
    end,
}
EOF

