-- Mjolnir layout configuration
-- Copyright Javier González (javier@javigon.com)
--

-- Load Extensions ============================================
   local application = hs.application
   local grid = hs.grid
   local screen = hs.screen
   local appfinder = hs.appfinder
   local layout = hs.layout
   local alert = hs.alert

-- Load own extensions ========================================
require "grid_setup"
require "screen_detector"

display_laptop = 1

communication_layout_1 = {
	{"Calendar", nil, display_laptop, gomiddle},
	{"Mail", nil, display_laptop, gobig},
	{"Slack", nil, display_laptop, godownright},
}

work_layout = {}
if nscreens == 1 then
	--communications
	for i = 0, #communication_layout_1, 1  do
		table.insert(work_layout, communication_layout_1[i])
	end
elseif nscreens == 2 then
	for i = 0, #communication_layout_2, 1  do
		table.insert(work_layout, communication_layout_1[i])
	end
else
	alert.show("Not supported > 2 screens", 1)
end

--TODO: Fix opening + applying layout in one single action
function test(appName)
	local app = nil
	app = appfinder.appFromName(appName)
	if not app then
		alert.show("wtf...")
	else
		alert.show("yay!...")
		for i, win in ipairs(app:allWindows()) do
			grid.set(win, godownright, screens[1])
		end
	end
end

function applyLayout(layout)
	-- return function()
		for n,_row in pairs(layout) do
			local appName = _row[1]
			local pos = _row[4]
			local scr = _row[3]
			local appExists = application.launchOrFocus(appName)
			local app = nil
			if appExists then
				-- while not app do
					app = appfinder.appFromName(appName)
					-- alert.show("- App: " .. appName, 1)
					if app then
						-- alert.show("App: " .. appName, 1)
						for i, win in ipairs(app:allWindows()) do
							grid.set(win, pos, screens[scr])
						end
					-- else
						-- test("Slack")
					end
				-- end
			end
		end
	-- end
end
