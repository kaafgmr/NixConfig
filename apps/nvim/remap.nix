[
# go back to nvim file manager
{
    mode = "n";
    key = "<leader>pv";
    action = ":Ex<CR>";
}

# move selected lines up or down
{
    mode = "v";
    key = "J";
    action = ":m '>+1<CR>gv=gv";
}
{
    mode = "v";
    key = "K";
    action = ":m '<-2<CR>gv=gv";
}

# delete line below
{
    mode = "n";
    key = "J";
    action = "mzJ`z";
}

# keep search terms in the middle of the screen
{
    mode = "n";
    key = "n";
    action = "nzzzv";
}
{
    mode = "n";
    key = "N";
    action = "Nzzzv";
}

# paste word without losing what you copied before
{
    mode = "x";
    key = "<leader>dp";
    action = "_dP";
}

# copy/paste to system clipboard
{
    mode = [
        "n"
        "v"
    ];
    key = "<leader>y";
    action = ''"+y<CR>'';
}
{
    mode = "n";
    key = "<leader>Y";
    action = ''\"+Y<CR>'';
}
{
    mode = [
        "n"
        "v"
    ];
    key = "<leader>p";
    action = ''\"+p<CR>'';
}
{
    mode = "n";
    key = "<leader>P";
    action = ''\"+P<CR>'';
}

# quick fix navigation
{
    mode = "n";
    key = "<C-k>";
    action = "<cmd>cnext<CR>zz";
}
{
    mode = "n";
    key = "<C-j>";
    action = "<cmd>cprev<CR>zz";
}
{
    mode = "n";
    key = "<leader>k";
    action = "<cmd>lnext<CR>zz";
}
{
    mode = "n";
    key = "<leader>j";
    action = "<cmd>lprev<CR>zz";
}

# shout out file
{
    mode = "n";
    key = "<leader><leader>";
    action = ":so<CR>";
}

# move between neovim windows
{
    mode = "n";
    key = "<leader>h";
    action = "<C-w>h";
}
{
    mode = "n";
    key = "<leader>j";
    action = "<C-w>j";
}
{
    mode = "n";
    key = "<leader>k";
    action = "<C-w>k";
}
{
    mode = "n";
    key = "<leader>l";
    action = "<C-w>l";
}
]
