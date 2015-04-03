-- hs main configuration
-- Copyright Javier González (javier@javigon.com)
--
-- Inspiration on:
--	- Tristan Hume's configuration

-- require("hs._asm.ipc")

-- Load Extensions
local application = hs.application
local window      = hs.window
local hotkey      = hs.hotkey
local keycodes = hs.keycodes
local fnutils     = hs.fnutils
local alert       = hs.alert
local grid        = hs.grid
local tiling = hs.tiling
local screen = hs.screen
local hints = hs.hints
local appfinder = hs.appfinder

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
		local win = window.focusedWindow()
		if win then
			grid.set(win, frame, win:screen())
		else
			alert.show("No focused window.")
		end
	end
end

function saveFocus()
	auxWin = window.focusedWindow()
	alert.show("Window '" .. auxWin:title() .. "' saved.")
end

function focusSaved()
	if auxWin then
		auxWin:focus()
	end
end

-- Actual configuration =======================================

-- if nscreens == 1 then
	-- fnutils.each(fullApps, function(app) layout[app] = {1, gobig} end)
	-- fnutils.each(rightApps, function(app) layout[app] = {1, goright} end)
	-- fnutils.each(centerApps, function(app) layout[app] = {1, gomiddle} end)
-- elseif nscreens == 2 then
	-- fnutils.each(fullApps, function(app) layout2[app] = {1, gobig} end)
-- else
	-- alert.show("Layout not supported (yet) for > 2 screens", 3)
-- end


-- tiling.set('layouts', {
  -- 'fullscreen', 'main-vertical', 'gp-vertical'
-- })

-- Launch Applications ======================

hotkey.bind(cmdshift, "T", function() application.launchOrFocus("iTerm") end)

-- Key bindings =============================

	-- Full Layout
	hotkey.bind(mashshift, 'f', applyLayout(work_layout)) -- TODO
	hotkey.bind(mashshift, "B", function() tiling.cyclelayout() end)

	hotkey.bind(mashshift, ';', saveFocus)
	hotkey.bind(mashshift, "'", focusSaved)

	hotkey.bind(mashshift, 'left', gridset(goleft))
	hotkey.bind(mashshift, 'right', gridset(goright))
	hotkey.bind(mashshift, 'up', grid.maximizeWindow)
	hotkey.bind(mashshift, 'down',  grid.pushwindow_nextscreen)

	hotkey.bind(altshift, 'left',  gridset(goupleft))
	hotkey.bind(altshift, 'right', gridset(goupright))
	hotkey.bind(cmdshift, 'left',  gridset(godownleft))
	hotkey.bind(cmdshift, 'right', gridset(godownright))
	-- hotkey.bind(cmdalt, 'up', )

	hotkey.bind(mashshift, 'M', gridset(gomiddle))

	-- hotkey.bind(mash, 'N', grid.pushwindow_nextscreen)
	-- hotkey.bind(mash, 'P', grid.pushwindow_prevscreen)

	hotkey.bind(mashshift, 'J', grid.pushWindowDown)
	hotkey.bind(mashshift, 'K', grid.pushWindowUp)
	hotkey.bind(mashshift, 'H', grid.pushWindowLeft)
	hotkey.bind(mashshift, 'L', grid.pushWindowRight)

	hotkey.bind(mashshift, 'U', grid.resizeWindowTaller)
	hotkey.bind(mashshift, 'O', grid.resizeWindowWider)
	hotkey.bind(mashshift, 'I', grid.resizeWindowThinner)
	hotkey.bind(mashshift, 'Y', grid.resizeWindowShorter)

	hotkey.bind(cmdshift, 'space',  function() hints.windowHints(window.focusedWindow():application():allWindows()) end)
	hotkey.bind(mashshift, 'space',  function() hints.windowHints(nil) end)
	hotkey.bind(mashshift, 'T', function() alert.show(os.date("%A %b %d, %Y - %I:%M%p"), 4) end)

	alert.show("Hammerspoon, at your service.", 3)
	alert.show(nscreens, 3)
