-- Mjolnir layout configuration
-- Copyright Javier González (javier@javigon.com)
--

local grid =  hs.grid
local window = hs.window

window.animationDuration = 0;

grid.GRIDWIDTH  = 6
grid.GRIDHEIGHT = 8
grid.MARGINX    = 0
grid.MARGINY    = 0

gw = grid.GRIDWIDTH
gh = grid.GRIDHEIGHT


gomiddle = {x = 1, y = 1, w = 4, h = 6}
goleft = {x = 0, y = 0, w = gw/2, h = gh}
goright = {x = gw/2, y = 0, w = gw/2, h = gh}
goupright = {x = gw/2, y = 0, w = gw/2, h = gh/2}
godownright = {x = gw/2, y = gh/2, w = gw/2, h = gh/2}
goupleft = {x = 0, y = 0, w = gw/2, h = gh/2}
godownleft = {x = 0, y = gh/2, w = gw/2, h = gh/2}
goup = {x = 0, y = 0, w = gw, h = gh/2}
godown = {x = 0, y = gh/2, w = gw, h = gh/2}
gobig = {x = 0, y = 0, w = gw, h = gh}



