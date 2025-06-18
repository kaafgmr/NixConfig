{ ... }:
{
    programs.nixvim = {
        
        keymaps = [
            { mode = "n"; key = "<leader>a"; action.__raw = "function() require'harpoon':list():add() end"; }
            { mode = "n"; key = "<C-u>"; action.__raw = "function() require'harpoon'.ui:toggle_quick_menu(require'harpoon':list()) end"; }
            { mode = "n"; key = "<C-j>"; action.__raw = "function() require'harpoon':list():next() end"; }
            { mode = "n"; key = "<C-k>"; action.__raw = "function() require'harpoon':list():prev() end"; }
        ];
    };
} 
