{  pkgs, nixvim, ... }:
{
    imports = [
        nixvim.nixosModules.nixvim
    ];

    programs.nixvim = {
        enable = true;

        viAlias = true; 
        vimAlias = true; 

        globals = { mapleader = " "; };

        keymaps = import ./remap.nix;

        opts = import ./set.nix;

        colorschemes.catppuccin = {
            enable = true;

            settings = {
                flavour = "mocha";

                color_overrides.mocha = {
                    base = "#000000";
                    mantle = "#000000";
                    crust = "#000000";
                };
            };
        };

        extraPackages = with pkgs; [
            gcc
            cmake
            ninja
            libgcc
            wl-clipboard
            ripgrep
            python3
            nixd
            clang-tools
            lua-language-server
            dotnet-sdk
        ];

        plugins = {
            web-devicons.enable = true;

            indent-blankline.enable = true;

            lsp = {
                enable = true;

                servers = {
                    nixd.enable = true;
                    lua_ls.enable = true;
                    clangd.enable = true;
                    csharp_ls.enable = true;
                    cssls.enable = true;
                };

                keymaps = {
                    diagnostic = {
                        "[d" = "goto_prev";
                        "]d" = "goto_next";
                        "<leader>vd" = "open_float";
                    };
                    lspBuf = {
                        "gd" = "definition";
                        "K" = "hover";
                        "<leader>vws" = "workspace_symbol";
                        "<leader>ca" = "code_action";
                        "<leader>vrr" = "references";
                        "<leader>vrn" = "rename";
                    };
                };
            };

            cmp = {
                enable = true;
                settings = {
                    mapping = {
                        "<C-p>" = "cmp.mapping.select_prev_item()";
                        "<Tab>" = "cmp.mapping.select_next_item()";
                        "<Enter>" = "cmp.mapping.confirm({ select = true })";
                        "<C-Space>" = "cmp.mapping.complete()";
                    };
                    sources = [
                    { name = "path"; }
                    { name = "nvim_lsp"; }
                    { name = "luasnip"; keyword_length = 2; }
                    { name = "buffer"; keyword_length = 3; }
                    ];
                    snippet.expand = ''
                        function(args)
                        require('luasnip').lsp_expand(args.body)
                        end
                        '';
                };
            };

            luasnip.enable = true;

            harpoon = {
                enable = true;
                keymaps = {
                    addFile = "<leader>a";
                    navNext = "<C-d>";
                    navPrev = "<C-a>";
                    toggleQuickMenu = "<C-u>";
                };
            };

            lualine = {
                enable = true;
                settings.options.theme = "iceberg_dark";
            };

            telescope = {
                enable = true;
                keymaps = {
                    "<leader>pf" = "find_files";
                    "<C-p>" = "git_files";
                    "<leader>ps" = "live_grep";
                };
            };


        };

    };
}
