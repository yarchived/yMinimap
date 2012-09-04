

local resetframe, timeoutframe = CreateFrame("Frame"), CreateFrame("Frame")
local delay, tickdelay, orig = 20, 0.2
-- Change 'delay' value if you want a different delay between your last scroll and the time the frame resets.  This value is in seconds.
-- Change 'tickdelay' to change the speed the map zooms out

resetframe:Hide()
timeoutframe:Hide()


timeoutframe:SetScript("OnUpdate", function(self, elapsed)
	self.elapsed = elapsed + self.elapsed
	if self.elapsed < delay then return end

	self:Hide()
	resetframe.elapsed = 0
	resetframe:Show()
end)


resetframe:SetScript("OnUpdate", function(self, elapsed)
	self.elapsed = elapsed + self.elapsed
	if self.elapsed < tickdelay then return end

	local z = Minimap:GetZoom()
	if z <= 0 then
		self:Hide()
		MinimapZoomIn:Enable()
		MinimapZoomOut:Disable()
	else orig(Minimap, z - 1) end
	self.elapsed = 0
end)


orig = Minimap.SetZoom
Minimap.SetZoom = function(...)
	resetframe:Hide()
	timeoutframe.elapsed = 0
	timeoutframe:Show()
	orig(...)
end

