-- Mjolnir layout configuration
-- Copyright Javier González (javier@javigon.com)
--

local grid        = require "mjolnir.bg.grid"

grid.GRIDWIDTH  = 6
grid.GRIDHEIGHT = 8
grid.MARGINX    = 0
grid.MARGINY    = 0

local gw = grid.GRIDWIDTH
local gh = grid.GRIDHEIGHT


local gomiddle = {x = 1, y = 1, w = 4, h = 6}
local goleft = {x = 0, y = 0, w = gw/2, h = gh}
local goright = {x = gw/2, y = 0, w = gw/2, h = gh}
local goupright = {x = gw/2, y = 0, w = gw/2, h = gh/2}
local godownright = {x = gw/2, y = gh/2, w = gw/2, h = gh/2}
local goupleft = {x = 0, y = 0, w = gw/2, h = gh/2}
local godownleft = {x = 0, y = gh/2, w = gw/2, h = gh/2}
local goup = {x = 0, y = 0, w = gw, h = gh/2}
local godown = {x = 0, y = gh/2, w = gw, h = gh/2}
local gobig = {x = 0, y = 0, w = gw, h = gh}



