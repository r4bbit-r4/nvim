return function()
    return {
      "echasnovski/mini.pairs",
      event = "InsertEnter",
      lazy = true,
      opts = function()
          return {}
      end,
      config = function(_, opts)
        require("mini.pairs").setup(opts)
      end,
    }
end
