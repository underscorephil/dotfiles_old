-- Mjolnir layout configuration
-- Copyright Javier González (javier@javigon.com)
--

-- Load extensions
-- local alert = require "hs.alert"

-- Load own extensions
require "layouts"
require "screen_detector"

if nscreens == 1 then
	applyLayout(work_layout)
elseif nscreens == 2 then
	applyLayout(work_layout)
else
	alert.show("Layout not supported (yet) for > 2 screens", 3)
end

