-- QuestPlates: Shows "!" on pfUI nameplates for quest objective mobs
-- Uses pfQuest database to resolve item objectives -> mob names

-- Try to increase nameplate distance
pcall(SetCVar, "nameplateDistance", "41")

local questMobs = {}

local function ScanQuestObjectives()
  local newMobs = {}

  -- need pfQuest loaded
  if not pfDB or not pfDB.quests or not pfDB.items or not pfDB.units then return end

  local qdata = pfDB["quests"]["data"]
  local idata = pfDB["items"]["data"]
  local udata = pfDB["units"]["data"]
  local uloc = pfDB["units"]["loc"]
  local refloot = pfDB["refloot"] and pfDB["refloot"]["data"]

  for qlogid = 1, GetNumQuestLogEntries() do
    local title, _, _, header, _, complete = GetQuestLogTitle(qlogid)
    if title and not header and not complete then

      -- get quest ID from pfQuest
      local questids = pfDatabase and pfDatabase.GetQuestIDs and pfDatabase:GetQuestIDs(qlogid)
      local questid = questids and tonumber(questids[1])

      if questid and qdata[questid] and qdata[questid]["obj"] then
        local obj = qdata[questid]["obj"]

        -- direct unit objectives (kill quests)
        if obj["U"] then
          for _, unitid in pairs(obj["U"]) do
            local name = uloc[unitid]
            if name then
              newMobs[name] = true
            end
          end
        end

        -- item objectives - find which mobs drop them
        if obj["I"] then
          for _, itemid in pairs(obj["I"]) do
            if idata[itemid] then
              -- direct unit drops
              if idata[itemid]["U"] then
                for unitid, _ in pairs(idata[itemid]["U"]) do
                  local name = uloc[unitid]
                  if name then
                    newMobs[name] = true
                  end
                end
              end
              -- reference loot (shared loot tables)
              if idata[itemid]["R"] and refloot then
                for ref, _ in pairs(idata[itemid]["R"]) do
                  if refloot[ref] and refloot[ref]["U"] then
                    for unitid in pairs(refloot[ref]["U"]) do
                      local name = uloc[unitid]
                      if name then
                        newMobs[name] = true
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end

      -- fallback: also parse "monster" type objectives from quest log text
      local objectives = GetNumQuestLeaderBoards(qlogid)
      if objectives then
        for i = 1, objectives do
          local text, objtype, done = GetQuestLogLeaderBoard(i, qlogid)
          if not done and text then
            if objtype == "monster" then
              local mobname = gsub(text, "%s*[:%-]%s*%d+%s*/%s*%d+%s*$", "")
              mobname = gsub(mobname, "%s+slain$", "")
              if mobname and mobname ~= "" then
                newMobs[mobname] = true
              end
            end
          end
        end
      end
    end
  end

  questMobs = newMobs
end

-- Event scanner
local scanner = CreateFrame("Frame")
scanner:RegisterEvent("QUEST_LOG_UPDATE")
scanner:RegisterEvent("PLAYER_ENTERING_WORLD")
scanner:RegisterEvent("QUEST_WATCH_UPDATE")
scanner:RegisterEvent("UNIT_QUEST_LOG_CHANGED")
scanner:SetScript("OnEvent", ScanQuestObjectives)

-- Nameplate updater
local updater = CreateFrame("Frame")
local elapsed = 0

updater:SetScript("OnUpdate", function()
  elapsed = elapsed + arg1
  if elapsed < 0.2 then return end
  elapsed = 0

  local i = 1
  while true do
    local plate = getglobal("pfNamePlate" .. i)
    if not plate then break end

    -- Create quest icon if needed
    if not plate.questIcon then
      plate.questIcon = plate:CreateFontString(nil, "OVERLAY")
      plate.questIcon:SetFont("Fonts\\FRIZQT__.TTF", 20, "OUTLINE")
      plate.questIcon:SetTextColor(1, 0.82, 0, 1)
      plate.questIcon:SetText("!")
      plate.questIcon:SetPoint("RIGHT", plate.name, "LEFT", -3, 0)
      plate.questIcon:Hide()
    end

    -- Show/hide
    if plate:IsVisible() and plate.original and plate.original.name then
      local name = plate.original.name:GetText()
      if name and questMobs[name] then
        plate.questIcon:Show()
      else
        plate.questIcon:Hide()
      end
    else
      plate.questIcon:Hide()
    end

    i = i + 1
  end
end)
