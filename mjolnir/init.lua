-- Mjolnir main configuration
-- Copyright Javier González (javier@javigon.com)
--
-- Inspiration on:
--	- Tristan Hume's configuration

require("mjolnir._asm.ipc")

-- Load Extensions
local application = require "mjolnir.application"
local window      = require "mjolnir.window"
local hotkey      = require "mjolnir.hotkey"
local keycodes = require "mjolnir.keycodes"
local fnutils     = require "mjolnir.fnutils"
local alert       = require "mjolnir.alert"
local grid        = require "mjolnir.bg.grid"
local tiling = require "mjolnir.tiling"
local screen = require "mjolnir.screen"
local hints = require "mjolnir.th.hints"
local appfinder = require "mjolnir.cmsj.appfinder"

-- Load own extensions
require "layouts"
require "screen_detector"
require "grid_setup"

-- Set up hotkey combinations
local mash      = {"cmd", "alt", "ctrl"}
local mashshift = {"cmd", "alt", "shift"}
local cmdshift = {"cmd",  "shift"}
local altshift = {"alt", "shift"}

-- Internal operations ========================================
local gridset = function(frame)
	return function()
		local win = window.focusedwindow()
		if win then
			grid.set(win, frame, win:screen())
		else
			alert.show("No focused window.")
		end
	end
end

function saveFocus()
	auxWin = window.focusedwindow()
	alert.show("Window '" .. auxWin:title() .. "' saved.")
end

function focusSaved()
	if auxWin then
		auxWin:focus()
	end
end

-- Actual configuration =======================================
--
-- Set grid size.
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

if nscreens == 1 then
	fnutils.each(fullApps, function(app) layout[app] = {1, gobig} end)
	fnutils.each(rightApps, function(app) layout[app] = {1, goright} end)
	fnutils.each(centerApps, function(app) layout[app] = {1, gomiddle} end)
-- elseif nscreens == 2 then
	-- fnutils.each(fullApps, function(app) layout2[app] = {1, gobig} end)
-- else
	-- alert.show("Layout not supported (yet) for > 2 screens", 3)
end


tiling.set('layouts', {
  'fullscreen', 'main-vertical', 'gp-vertical'
})

-- Launch Applications ======================

hotkey.bind(cmdshift, "T", function() application.launchorfocus("iTerm") end)

-- Key bindings =============================

	-- Full Layout
	hotkey.bind(mashshift, 'f', applyLayout(layout)) -- TODO
	hotkey.bind(mashshift, "B", function() tiling.cyclelayout() end)

	hotkey.bind(mashshift, ';', saveFocus)
	hotkey.bind(mashshift, "'", focusSaved)

	hotkey.bind(mashshift, 'left',  gridset(goleft))
	hotkey.bind(mashshift, 'right', gridset(goright))
	hotkey.bind(mashshift, 'up', grid.maximize_window)
	hotkey.bind(mashshift, 'down',  grid.pushwindow_nextscreen)

	hotkey.bind(altshift, 'left',  gridset(goupleft))
	hotkey.bind(altshift, 'right', gridset(goupright))
	hotkey.bind(cmdshift, 'left',  gridset(godownleft))
	hotkey.bind(cmdshift, 'right', gridset(godownright))
	-- hotkey.bind(cmdalt, 'up', )

	hotkey.bind(mashshift, 'M', gridset(gomiddle))

	-- hotkey.bind(mash, 'N', grid.pushwindow_nextscreen)
	-- hotkey.bind(mash, 'P', grid.pushwindow_prevscreen)

	hotkey.bind(mashshift, 'J', grid.pushwindow_down)
	hotkey.bind(mashshift, 'K', grid.pushwindow_up)
	hotkey.bind(mashshift, 'H', grid.pushwindow_left)
	hotkey.bind(mashshift, 'L', grid.pushwindow_right)

	hotkey.bind(mashshift, 'U', grid.resizewindow_taller)
	hotkey.bind(mashshift, 'O', grid.resizewindow_wider)
	hotkey.bind(mashshift, 'I', grid.resizewindow_thinner)
	hotkey.bind(mashshift, 'Y', grid.resizewindow_shorter)

	hotkey.bind(mashshift, 'space',  function() hints.appHints(window.focusedwindow():application()) end)
	hotkey.bind(cmdshift, 'space',  hints.activeWindowHints)
	hotkey.bind(mashshift, 'T', function() alert.show(os.date("%A %b %d, %Y - %I:%M%p"), 4) end)

	alert.show("Mjolnir, at your service.", 3)
	alert.show(nscreens, 3)
