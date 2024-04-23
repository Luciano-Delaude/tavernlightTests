function printSmallGuildNames(memberCount)
    -- Prepare the SQL query with a placeholder for memberCount
    local selectGuildQuery = "SELECT name FROM guilds WHERE max_members < %d;"
    local formattedQuery = string.format(selectGuildQuery, memberCount)
    
    -- Execute the query
    local resultId = db.storeQuery(formattedQuery)
    
    -- Check if the query executed successfully
    if not resultId then
        print("Error executing the query")
        return
    end
    
    -- Fetch and print guild names
    local row = db.getRow(resultId)
    while row do
        local guildName = row.name
        print(guildName)
        row = db.getRow(resultId) -- Fetch the next row
    end
    
    -- Free the result set
    result.free(resultId)
end
