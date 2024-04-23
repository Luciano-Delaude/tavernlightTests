-- Sets the storage value 1000 to -1 for the player that wishes to logout
local function releaseStorage(player)
    if player then
        player:setStorageValue(1000, -1)
        -- logging of storage release
        print(string.format("Storage released for player %s", player:getName()))
    else
        print("Error: Invalid player received. Unable to release storage.")
    end
end

-- Player logout handler
function onLogout(player)
    -- If storage value is 1, release storage after 1000 milliseconds.
    if player:getStorageValue(1000) == 1 then
        addEvent(releaseStorage, 1000, player)
    end
    -- Always return true to allow the player to log out
    return true
end