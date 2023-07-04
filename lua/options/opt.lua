-- This contains my options for nvim

local o = vim.opt

-- no. of spaces for autoindents to 2
o.shiftwidth = 2 

-- Converts tab to spaces when inserting text
o.expandtab = true

-- Autoindent with no of spaces as prev. 
o.autoindent = true

-- Copy struct of the existing lines' indents.
o.copyindent = true 

-- Auto indent with right no of spaces 
o.smartindent = true

-- Preserves indent of last line on pressing enter
o.preserveindent = true

-- Enables line numbering
o.number = true


