return {
    {
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!:).
        build = "make install_jsregexp",
        -- event = "VeryLazy",
        -- after = 'nvim-cmp';
        config = function()
            local ls = require("luasnip")
            local s = ls.snippet
            local sn = ls.snippet_node
            local isn = ls.indent_snippet_node
            local t = ls.text_node
            local i = ls.insert_node
            local f = ls.function_node
            local c = ls.choice_node
            local d = ls.dynamic_node
            local r = ls.restore_node
            local events = require("luasnip.util.events")
            local ai = require("luasnip.nodes.absolute_indexer")
            local extras = require("luasnip.extras")
            local l = extras.lambda
            local rep = extras.rep
            local p = extras.partial
            local m = extras.match
            local n = extras.nonempty
            local dl = extras.dynamic_lambda
            local fmt = require("luasnip.extras.fmt").fmt
            local fmta = require("luasnip.extras.fmt").fmta
            local conds = require("luasnip.extras.expand_conditions")
            local postfix = require("luasnip.extras.postfix").postfix
            local types = require("luasnip.util.types")
            local parse = require("luasnip.util.parser").parse_snippet
            local ms = ls.multi_snippet
            local k = require("luasnip.nodes.key_indexer").new_key

            ls.config.set_config {
                history = true,
                updateevents = "TextChanged, TextChangedI",

            }


            vim.keymap.set({ "i" }, "<C-L>", function() ls.expand() end, { silent = true })
            vim.keymap.set({ "i", "s" }, "<C-J>", function() ls.jump(1) end, { silent = true })
            vim.keymap.set({ "i", "s" }, "<C-K>", function() ls.jump(-1) end, { silent = true })

            vim.keymap.set({ "i", "s" }, "<C-E>", function()
                if ls.choice_active() then
                    ls.change_choice(1)
                end
            end, { silent = true })


            local date = function() return { os.date('%Y-%m-%d') } end

            ls.add_snippets(nil, {
                all = {
                    s(
                        {
                            trig = "lsv",
                            namer = "writes out the syntax for a jinja 2 var",
                            dscr =
                            "writes out a standard one to one instance var assignment"
                        },
                        fmta([[{{ <iNode1> }}]], {
                            iNode1 = i(1, "varname")
                        })
                    ),
                    s({
                        trig = "date",
                        namr = "Date",
                        dscr = "Date in the form of YYYY-MM-DD",
                    }, {
                        f(date, {}),
                    }),
                },
                java = {
                    s({ trig = "lstry", namer = "try catch", dscr = "writes out a standard try catch" },
                        fmta([[
            try {
                <i1>
            } catch (Exception e) {
                <i2>
            }
            ]], {
                            i1 = i(1, "// body..."),
                            i2 = i(2, "e.printStackTrace();"),
                        })
                    ),
                    s(
                        {
                            trig = "sout",
                            namer = "printline in java",
                            dscr =
                            "really short way to say System.out.print.line()"
                        },
                        fmta([[
            System.out.println(<i1>)
            ]], {
                            i1 = i(1, "print..."),
                        })
                    ),
                    s({ trig = "lsmethod", namer = "method", dscr = "writes out a standard method" },
                        fmta([[
            public <i1> <i2>(<i3> <i4>) {
                <i5>
            }
            ]], {
                            i1 = i(1, "Void"),
                            i2 = i(2, "Name"),
                            i3 = i(3, "Object"),
                            i4 = i(4, "inputName"),
                            i5 = i(5, "// body")
                        })
                    ),
                    s({ trig = "lsif", namer = "if statement", dscr = "writes out a standard if statement" },
                        fmta([[
            if (<i1>) {
                <i2>
            }
            ]], {
                            i1 = i(1, "predicate"),
                            i2 = i(2, "// body")
                        })
                    ),
                    s({ trig = "lsrepo", namer = "repo", dscr = "writes out a spring boot jpa entity repo" },
                        fmta([[
             package <i1>;

             import org.springframework.data.jpa.repository.Query;
             import org.springframework.data.repository.CrudRepository;
             import org.springframework.stereotype.Repository;

             // import java.util.List;

             @Repository
             public interface <i2>Repository extends CrudRepository<< <r2>, Integer >> {
                 <i3>
             }
            ]], {
                            i1 = i(1, "gc.builder."),
                            i2 = i(2, "Entity"),
                            r2 = rep(2),
                            i3 = i(3, "// body")
                        })
                    ),
                    s({ trig = "lsclass", namer = "class", dscr = "writes out a standard class" },
                        fmta([[
            @Getter
            @Setter
            public class <i1> {
                <i2>
            }
            ]], {
                            i1 = i(1, "Name"),
                            i2 = i(2, "// body")
                        })
                    ),
                },
                php = {
                    s({ trig = "lsif", namer = "if statement", dscr = "writes out a standard if statement" },
                        fmta([[
            if (<i1>) {
                <i2>
            }
            ]], {
                            i1 = i(1, "predicate"),
                            i2 = i(2, "// body")
                        })
                    ),
                },
                j2 = {
                    s(
                        {
                            trig = "lsv",
                            namer = "writes out the syntax for a jinja 2 var",
                            dscr =
                            "writes out a standard one to one instance var assignment"
                        },
                        fmta([[{{ <iNode1> }}]], {
                            iNode1 = i(1, "varname")
                        })
                    ),
                },
                python = {
                    s(
                        {
                            trig = "lsInstVar",
                            namer = "Instance variable assignment",
                            dscr =
                            "writes out a standard one to one instance var assignment"
                        },
                        fmta([[
            self.<iNode2> = <iNode1>
            <iNode3>
            ]], {
                            iNode1 = i(1, "Name"),
                            iNode2 = rep(1),
                            iNode3 = i(3)
                        })
                    ),
                    s({ trig = "lsclass", namer = "Class", dscr = "writes out my class skeleton" },
                        fmta([[

            class <iNode1>:
                def __init__(
                    self,
                    <iNode2>
                ):
                    <iNode3>
                    pass

                def to_dict(self):
                    return {
                        "": "",
                    }

            ]], {
                            iNode1 = i(1, "Name"),
                            iNode2 = i(2, "firstParam"),
                            iNode3 = i(3, "firstLine"),

                        })
                    ),
                    s({ trig = "lsMethod", namer = "create method", dscr = "create method" },
                        fmta([[
            def <in1>(self, <in2>):
                <in3>

            ]], {
                            in1 = i(1, "name"),
                            in2 = i(2, "param?"),
                            in3 = i(3, "pass"),
                        })
                    ),
                    s({ trig = "lsfactory", namer = "create factory for di", dscr = "create factory for di" },
                        fmta([[
            <in1>_provider = providers.Factory(
                <in2>,
                <in3>,
                config=config
            )

            ]], {
                            in1 = i(1, "Name"),
                            in2 = i(2, "Class"),
                            in3 = i(3, "Others")
                        })
                    )
                }
            })
        end
    }
}
