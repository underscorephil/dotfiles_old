-- Mjolnir layout configuration
-- Copyright Javier González (javier@javigon.com)
--

-- -- Load Extensions
-- local application = require "hs.application"
-- local grid        = require "hs.grid"
-- local screen = require "hs.screen"
-- local appfinder = require "hs.appfinder"

-- Load own extensions
require "grid_setup"

fullApps = {
	"Safari", "Firefox", "Chrome", "Mail", "Calendar"
}

rightApps = {}

leftApps = {}

centerApps = {
	"Messages"
}

chat_layout_1 = {
	Skype = {1, goright},
	Adium = {1, goleft},
}

productivity_layout_1 = {
	Mail = {1, gobig},
	Calendar = {1, gobig},
}

productivity_layout_2 = {
	Mail = {1, gobig},
	Calendar = {2, gobig},
}

work_layout = {
	Calendar = {1, gobig},
}

function applyPlace(win, place)
	local scrs = screen:allscreens()
	local scr = scrs[place[1]]
	grid.set(win, place[2], scr)
end

function clapplyLayout(inlayout)
		for appName, place in pairs(inlayout) do
			application.launchorfocus(appName)
			local app = appfinder.app_from_name(appName)
			if app then
				for i, win in ipairs(app:allwindows()) do
					applyPlace(win, place)
				end
			end
		end
end

function applyLayout(inlayout)
	return function()
		for appName, place in pairs(inlayout) do
			application.launchorfocus(appName)
			local app = appfinder.app_from_name(appName)
			if app then
				for i, win in ipairs(app:allwindows()) do
					applyPlace(win, place)
				end
			end
		end
	end
end

