local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {"rust_analyzer", "clangd", "cmake", "marksman", "pyre", "esbonio"},
    handlers = {
        lsp_zero.default_setup,
        lua_ls = function()
            local lua_opts = lsp_zero.nvim_lua_ls()
            require('lspconfig').lua_ls.setup(lua_opts)
        end,
    }
})

local luasnip = require('luasnip')
local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}

local has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
    sources = {
        {name = 'path'},
        {name = 'nvim_lsp'},
        {name = 'nvim_lua'},
        {name = 'luasnip', keyword_length = 2},
        {name = 'buffer', keyword_length = 3},
    },
    formatting = lsp_zero.cmp_format(),
     experimental = {
        ghost_text = true
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-Space>'] = cmp.mapping.confirm({ select = true }),
        ['<C-y>'] = cmp.mapping.complete(),
        ["<Tab>"] = cmp.mapping(function(fallback)
                  if cmp.visible() then
                      cmp.select_next_item()
                  elseif luasnip.expand_or_jumpable() then
                      luasnip.expand_or_jump()
                  elseif has_words_before() then
                      cmp.complete()
                  else
                      fallback()
                  end
              end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    }),
})

-- goto-preview Setup
require('goto-preview').setup {
  width = 120;
  height = 15;
  border = {"↖", "─" ,"┐", "│", "┘", "─", "└", "│"};
  default_mappings = false;
  debug = false;
  opacity = nil;
  resizing_mappings = false;
  post_open_hook = nil;
  post_close_hook = nil;
  references = {
    telescope = require("telescope.themes").get_dropdown({ hide_preview = false })
  };
  focus_on_open = true;
  dismiss_on_move = false;
  force_close = true,
  bufhidden = "wipe",
  stack_floating_preview_windows = true,
  preview_window_title = { enable = true, position = "left" },
}

--- Keymap
vim.keymap.set("n", "gpd", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", {})
vim.keymap.set("n", "gpt", "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>", {})
vim.keymap.set("n", "gpi", "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>", {})
vim.keymap.set("n", "gpD", "<cmd>lua require('goto-preview').goto_preview_declaration()<CR>", {})
vim.keymap.set("n", "gP", "<cmd>lua require('goto-preview').close_all_win()<CR>", {})
vim.keymap.set("n", "gpr", "<cmd>lua require('goto-preview').goto_preview_references()<CR>", {})
vim.keymap.set("n", "gs", "<cmd>split | lua vim.lsp.buf.definition()<CR>", {})
vim.keymap.set("n", "gv", "<cmd>vsplit | lua vim.lsp.buf.definition()<CR>", {})
