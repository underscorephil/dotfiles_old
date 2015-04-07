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
   local fnutils = hs.fnutils

-- Load own extensions ========================================
require "grid_setup"
require "screen_detector"

display_primary = 1
display_secondary = 2
work_layout_present = 0
work_layout = {}

-- 1 screen
communication_layout_1 = {
	{"Calendar", nil, display_primary, goleft},
	{"Skype", nil, display_primary, godownleft},
	{"Mail", nil, display_primary, gobig},
	{"Slack", nil, display_primary, godownright},
	{"Adium", nil, display_primary, godownleft},
}

productivity_layout_1 = {
	{"OmniFocus", nil, display_primary, gobig},
}

-- 2 screens
communication_layout_2 = {
	{"Calendar", nil, display_secondary, goupleft},
	{"Skype", nil, display_secondary, godownleft},
	{"Mail", nil, display_secondary, goright},
	{"Slack", nil, display_primary, godownright_omnifocus},
	{"Adium", "Contacts", display_primary, goupright_adium_contact},
	{"Adium", "Timeline", display_primary, goupright_adium_chat},
}

productivity_layout_2 = {
	{"OmniFocus", nil, display_primary, goleft_omnifocus},
}

function defineLayout()
	work_layout = {}
	if nscreens == 1 then
		--communications
		for i = 0, #communication_layout_1, 1  do
			table.insert(work_layout, communication_layout_1[i])
		end

		for i = 0, #productivity_layout_1, 1 do
			table.insert(work_layout, productivity_layout_1[i])
		end
	elseif nscreens == 2 then
		for i = 0, #communication_layout_2, 1  do
			table.insert(work_layout, communication_layout_2[i])
		end

		for i = 0, #productivity_layout_2, 1 do
			table.insert(work_layout, productivity_layout_2[i])
		end
	else
		alert.show("Not supported > 2 screens", 1)
end

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
	for n,_row in pairs(layout) do
		local appName = _row[1]
		local window = _row[2]
		local scr = _row[3]
		local pos = _row[4]
		local appExists = application.launchOrFocus(appName)
		local app = nil
		if appExists then
			-- while not app do
				app = appfinder.appFromName(appName)
				-- alert.show("- App: " .. appName, 1)
				if app then
					if _row[2] then
						wins = fnutils.filter(app:allWindows(), function(win) return string.find(win:title(), _row[2]) end)
					else
						wins = app:allWindows()
					end

					for i,win in pairs(wins) do
						grid.set(win, pos, screens[scr])
					end
				-- else
					-- test("Slack")
				end
			-- end
		end
	end
end

function clApplyLayout(layout)
	applyLayout(layout)
	work_layout_present = 1
end
