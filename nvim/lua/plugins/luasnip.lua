return {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    -- version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
    dependencies = {
        "saadparwaiz1/cmp_luasnip",
        "rafamadriz/friendly-snippets",
    },
    config = function()

        local ls = require("luasnip")

        local t = ls.text_node
        local i = ls.insert_node
        local f = ls.function_node
        local s = ls.snippet
        local l = require("luasnip.extras").lambda

        -- args is a table, where 1 is the text in Placeholder 1, 2 the text in
        -- placeholder 2,...
        local function copy(args)
            return args[1]
        end

        ls.add_snippets("all", {
            -- trigger is `fn`, second argument to snippet-constructor are the nodes to insert into the buffer on expansion.
            s("fn", {
                -- Simple static text.
                t("//Parameters: "),
                -- function, first parameter is the function, second the Placeholders
                -- whose text it gets as input.
                f(copy, 2),
                t({ "", "function " }),
                -- Placeholder/Insert.
                i(1),
                t("("),
                -- Placeholder with initial text.
                i(2, "int foo"),
                -- Linebreak
                t({ ") {", "\t" }),
                -- Last Placeholder, exit Point of the snippet.
                i(0),
                t({ "", "}" }),
            }),

            s("transform", {
                i(1, "initial text"),
                t({ "", "" }),
                -- lambda nodes accept an l._1,2,3,4,5, which in turn accept any string transformations.
                -- This list will be applied in order to the first node given in the second argument.
                l(l._1:match("[^i]*$"):gsub("i", "o"):gsub(" ", "_"):upper(), 1),
            }),
        }, {
            key = "all",
        })

        require("luasnip.loaders.from_vscode").lazy_load()

    end,
}
