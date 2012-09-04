-- modified from a very old version of pMinimap

-- http://www.wowwiki.com/GetMinimapShape
function _G.GetMinimapShape() return 'SQUARE' end

local addon = CreateFrame('Button', nil, Minimap)
addon:SetScript('OnEvent', function(self, event, ...) self[event](self, event, ...) end)

addon:RegisterEvent('ZONE_CHANGED_NEW_AREA')
function addon:ZONE_CHANGED_NEW_AREA()
	SetMapToCurrentZone()
end

MinimapZoomIn:Hide()
MinimapZoomOut:Hide()
Minimap:EnableMouseWheel()
Minimap:SetScript('OnMouseWheel', function(self, dir)
	if(dir > 0) then
		Minimap_ZoomIn()
	else
		Minimap_ZoomOut()
	end
end)

--MiniMapTrackingBackground:Hide()
--MiniMapTrackingButton:SetHighlightTexture('')
--MiniMapTrackingButtonBorder:SetTexture('')
--MiniMapTrackingIcon:SetTexCoord(0.065, 0.935, 0.065, 0.935)
--MiniMapTrackingIconOverlay:SetTexture('')
--MiniMapTracking:SetParent(Minimap)
--MiniMapTracking:ClearAllPoints()
--MiniMapTracking:SetPoint('TOPLEFT', -2, 2)
--MiniMapTracking:SetScale(.8)

BattlegroundShine:Hide()
MiniMapBattlefieldBorder:SetTexture('')
MiniMapBattlefieldFrame:ClearAllPoints()
MiniMapBattlefieldFrame:SetPoint('TOPRIGHT', Minimap, 0, 0)

--[[
MiniMapMailBorder:Hide()
MiniMapMailFrame:ClearAllPoints()
MiniMapMailFrame:SetPoint('TOPRIGHT', Minimap, -5, -35)
MiniMapMailIcon:SetTexCoord(.17,.93,.17,.93)
MiniMapMailFrame:SetScale(.8)
]]

MinimapBorder:SetTexture(nil)
MinimapBorderTop:Hide()
--MinimapToggleButton:Hide()

MiniMapInstanceDifficulty:UnregisterAllEvents()
MiniMapInstanceDifficulty:Hide()

--GameTimeFrame:SetWidth(20)
--GameTimeFrame:SetHeight(20)
--GameTimeFrame:ClearAllPoints()
--GameTimeFrame:SetPoint("BOTTOM", Minimap, 0, 0)
--GameTimeFrame:SetHitRectInsets(0, 0, 0, 0)
--GameTimeFrame:GetRegions():Hide()
--do
--	local text = select(5, GameTimeFrame:GetRegions())
--	text:SetTextColor(1,1,1)
--	text:SetFont(STANDARD_TEXT_FONT, 14, 'OUTLINE')
--end
--for i = 6, 8 do
--    select(i, GameTimeFrame:GetRegions()):SetTexture(nil)
--end

MiniMapWorldMapButton:Hide()
--MiniMapMeetingStoneFrame:SetAlpha(0)
--MiniMapLFGFrame:SetAlpha(0)
--MiniMapLFGFrame:ClearAllPoints()
--MiniMapLFGFrame:SetPoint('TOPLEFT', MiniMapTracking, 'BOTTOMLEFT', 0, -2)

--MiniMapVoiceChatFrame:Hide()
--MiniMapVoiceChatFrame.Show = MiniMapVoiceChatFrame.Hide
--hooksecurefunc(MiniMapVoiceChatFrame, 'Show', MiniMapVoiceChatFrame.Hide)
MinimapNorthTag:SetAlpha(0)

Minimap:SetScale(1)
Minimap:SetFrameLevel(2)
Minimap:SetFrameStrata('BACKGROUND')
Minimap:SetMaskTexture([=[Interface\ChatFrame\ChatFrameBackground]=])
--Minimap:SetBackdrop({bgFile = [=[Interface\ChatFrame\ChatFrameBackground]=], insets = {top = -2, left = -2, bottom = -2, right = -2}})
--Minimap:SetBackdropColor(0, 0, 0, 1)

Minimap:ClearAllPoints()
Minimap:SetPoint('TOPRIGHT', UIParent, -10, -20)

MinimapZoneTextButton:SetParent(Minimap)
MinimapZoneTextButton:ClearAllPoints()
MinimapZoneTextButton:SetPoint('TOP')
MinimapZoneText:SetFont(STANDARD_TEXT_FONT, 12, 'OUTLINE')

DurabilityFrame:SetAlpha(0)

