-- Creates namespace for addon
ESOQuestLevel = {}

ESOQuestLevel.name = "ESOQuestLevel"

local names = require("QuestNames")

-- Function to init addon
function ESOQuestLevel:Initialize()
      EVENT_MANAGER:RegisterForEvent(ESOQuestLevel.name, EVENT_QUEST_OFFERED,
        function(event)
          local dialogue, response = GetOfferedQuestInfo()
          d("Dialogue: "..dialogue)
          d("Response: "..response)
        end
      )
end

-- Event handler function for EVENT_ADD_ON_LOADED
function ESOQuestLevel.OnAddOnLoaded(event, addonName)
    if addonName == ESOQuestLevel.name then
        ESOQuestLevel:Initialize()
    end
end

--[[function ESOQuestLevel.Display(level)
  TODO: Add code to display level
end]]

function ESOQuestLevel.OnQuestOffered(event)
  local questName = GetOfferedQuestShareInfo(names.GetQuestId(name))
  local questLevel, questName

  for line in io.lines("questlist.txt") do
    questName, questLevel = string.match(line, "([^%d]+)(%d+)")

    if questNameById == questName then
      break
    end
  end

    ESOQuestLevel.Display(questLevel)
end

-- Call OnAddOnLoaded function when EVENT_ADD_ON_LOADED occurs
EVENT_MANAGER:RegisterForEvent(ESOQuestLevel.name, EVENT_ADD_ON_LOADED, ESOQuestLevel.OnAddOnLoaded)
