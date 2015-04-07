-- Mjolnir layout configuration
-- Copyright Javier González (javier@javigon.com)
--

-- Load Extensions ============================================
   local alert = hs.alert

screen = hs.screen
screens = screen:allScreens()
nscreens = #screens
nscreens_old = nscreens

screenWatcher = nil

--TODO: Save running applications and apply layout for them
function reloadScreens()
	nscreens = #screen.allScreens()

	-- if work_layout_present == 1 then
		-- if nscreens_old ~= nscreens then
			defineLayout()
			applyLayout(work_layout)
		-- end
	-- end

	-- FIXME: We should really be calling a function here that destroys and
	-- re-creates the statuslets, in case they need to be in new places

	lastNumberOfScreens = newNumberOfScreens

	alert.show("New number of screens: " .. nscreens, 3)

end


