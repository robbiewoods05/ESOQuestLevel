-- Creates namespace for addon
ESOQuestLevel = {}

ESOQuestLevel.name = "ESOQuestLevel"
questNames = {}
questLevels = {}

-- Function to init addon
function ESOQuestLevel:Initialize()
    EVENT_MANAGER:RegisterForEvent(ESOQuestLevel.name, EVENT_QuestOffered, --[[ESOQuestLevel.FindQuestLevel(TODO: Find a way to work out the name of the quest the NPC is trying to give you)]] ESOQuestLevel.Yo)
end

-- Event handler function for EVENT_ADD_ON_LOADED
function ESOQuestLevel.OnAddOnLoaded(event, addonName)
    if addonName == ESOQuestLevel.name then
        ESOQuestLevel:Initialize()
    end

    local lineNumber = 0

    --[[for line in io.lines("questlist.txt") do
      questNames[lineNumber], questLevels[lineNumber]= string.match(line, "(%a+)(%d+)")
      lineNumber = lineNumber + 1
  end]]
end



--[[function ESOQuestLevel.Display(level)]]
--TODO: Add code to display level
end

function ESOQuestLevel.FindQuestLevel(event, name)
    local playerLevel = GetUnitLevel("player")

    local low = 1
    local high = #questLevels
    local mid = 0, startIndex = 0, endIndex = 0, countQuestsByLevel = 0, index = 0, level = 0

    while low <= high do
        mid = math.floor((low+high)/2)

        if list[mid] > playerLevel then
            high = mid - 1
        else if list[mid] < playerLevel then
            low = mid + 1
        else
             index = mid
        end
    end

    startIndex = index

    while questLevels[index] == player do
        countQuestsByLevel = countQuestsByLevel + 1
        index = index + 1
    end

    endIndex = startIndex + countQuestsByLevel;

    for i=startIndex,endIndex do
        if questNames[i] == name then
            level = questLevels[i]
            break
        else
            level = 0
        end
    end

    ESOQuestLevel.Display(level)
end

-- Call OnAddOnLoaded function when EVENT_ADD_ON_LOADED occurs
EVENT_MANAGER:RegisterForEvent(ESOQuestLevel.name, EVENT_ADD_ON_LOADED, ESOQuestLevel.OnAddOnLoaded)
