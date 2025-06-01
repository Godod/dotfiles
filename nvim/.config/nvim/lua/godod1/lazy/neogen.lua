return {
    "danymat/neogen",
    config = function()
        require('neogen').setup {
            enabled = true,             --if you want to disable Neogen
            input_after_comment = true, -- (default: true) automatic jump (with insert mode) on inserted annotation
            languages = {
                python = {
                    template = {
                        annotation_convention = "reST"
                    }
                }
            }
        }
    end,
    -- Uncomment next line if you want to follow only stable versions
    version = "*"
}
