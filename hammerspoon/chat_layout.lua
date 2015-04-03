-- Mjolnir layout configuration
-- Copyright Javier González (javier@javigon.com)
--

-- Load extensions
-- local alert = require "hs.alert"

-- Load own extensions
require "layouts"
require "screen_detector"

if nscreens == 1 then
	clapplyLayout(chat_layout_1)
elseif nscreens == 2 then
	clapplyLayout(chat_layout_1)
else
	alert.show("Layout not supported (yet) for > 2 screens", 3)
end

