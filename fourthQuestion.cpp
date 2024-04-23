void Game::addItemToPlayer(const std::string& recipient, uint16_t itemId)
{
    Player* player = g_game.getPlayerByName(recipient);
    // Bool to track if a new player object is created
    bool playerCreated = false; 

    if (!player) {
        player = new Player(nullptr);
        if (!IOLoginData::loadPlayerByName(player, recipient)) {
            // Deallocate memory if loading failed, to not have memory leak
            delete player; 
            return;
        }
        playerCreated = true; 
    }

    Item* item = Item::CreateItem(itemId);
    if (!item) {
        if (playerCreated) {
            // Deallocate memory if item creation failed and player is created in this method, to not have memory leak
            delete player; 
        }
        return;
    }

    g_game.internalAddItem(player->getInbox(), item, INDEX_WHEREEVER, FLAG_NOLIMIT);

    if (player->isOffline()) {
        IOLoginData::savePlayer(player);
    }

    if (playerCreated) {
        // Deallocate memory if player is created in this method, to not have memory leak
        delete player; 
    }
}
