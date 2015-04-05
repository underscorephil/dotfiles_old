-- Mjolnir layout configuration
-- Copyright Javier González (javier@javigon.com)
--

-- Load Extensions
screen = hs.screen
screens = screen:allScreens()
nscreens = #screens
nscreens_old = nscreens

screenWatcher = nil

--TODO: Save running applications and apply layout for them
function reloadScreens()
	nscreens = #screen.allScreens()

	if nscreens_old ~= nscreens then
		if nscreens == 1 then
			layout.apply(work_layout)
		elseif nscreens == 2 then
			layout.apply(work_layout)
		end
	end

	-- FIXME: We should really be calling a function here that destroys and
	-- re-creates the statuslets, in case they need to be in new places

	lastNumberOfScreens = newNumberOfScreens

end


