function removeMemberFromParty(playerId, playerName)
    --Create player with playerID and get party
    local player = Player(playerId)
    local party = player:getParty()
    
    --Search in the party members the actual player, if found, it's removed
    local members = party:getMembers()
    for _, member in ipairs(members) do
        if member:getName() == playerName then
            party:removeMember(member)
            return true  -- Member found and removed
        end
    end
    
    return false  -- Member not found
end
