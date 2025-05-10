-- create a frame to catch ADDON_LOADED
local f = CreateFrame("Frame", "NiceDamageFrame")

-- path to your font file
local FONT_PATH = "Interface\\AddOns\\NiceDamage\\font.ttf"

local function ApplyNiceFont()
    -- override Classic floating combat text
    if COMBAT_TEXT_FONT then
        COMBAT_TEXT_FONT = FONT_PATH
    end
    if COMBAT_TEXT_CRIT_FONT then
        COMBAT_TEXT_CRIT_FONT = FONT_PATH
    end
    -- for safety, also override the retail var if it somehow exists
    if DAMAGE_TEXT_FONT then
        DAMAGE_TEXT_FONT = FONT_PATH
    end
end

f:SetScript("OnEvent", function(self, event, addonName)
    if event == "ADDON_LOADED" and addonName == "NiceDamage" then
        ApplyNiceFont()
        -- no need to handle this event again
        self:UnregisterEvent("ADDON_LOADED")
    end
end)

f:RegisterEvent("ADDON_LOADED")

