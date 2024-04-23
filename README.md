# Code Improvement Suggestions

## Q1: Improving Lua Methods

To enhance the implementation of the code for this question considered the following:

- **Consistent Naming Convention:** Ensured that functions and variables followed a consistent naming convention to improve readability and maintainability.
- **Documentation:** Added comments to explain the purpose of functions and any complex logic, aiding other developers to understand the code.
- **Error Handling:** Implemented error handling to gracefully manage potential issues like invalid input parameters or unexpected behavior.
- **Optimization:** Optimized the code for better performance, especially in situations where it's frequently called or performance-sensitive.

## Q2: Issues with SQL Query Implementation

The code for Q2 implementation suffered the following issues:

- The SQL query wasn't executed properly.
- The loop to fetch guild names was missing.
- Absence of handling database errors.

The implementation reached addresses the issues mentioned earlier:

- It properly executes the SQL query with the provided memberCount.
- It fetches guild names in a loop and prints them.
- It checks for errors during the database operation and handles them gracefully.

## Q3: Function Refactoring

This question code had the problem that name and implementation were confusing and not clean. 
To improve the function, these changes were made:

- Renamed the function to `removeMemberFromParty` for clarity.
- Changed the parameter name `membername` to `playerName` for clarity.
- Simplified the loop to directly iterate over party members using `ipairs`.
- Utilized the `getName()` method (assuming it exists) to retrieve the name of the player object.
- Added a return statement to indicate whether the member was found and removed.

## Q4: Memory Management with Deletion

In the provided method `Game::addItemToPlayer`, existed a potential memory leak due to memory allocation using the `new` keyword without proper deallocation if the player was not found in `g_game.getPlayerByName(recipient)`.

To fix the memory leak, the following modification was made:

- **Deletion with the `delete` keyword:** Whenever a new `Player` object is created but not found, the `delete` keyword is used to release the allocated memory, ensuring no memory leaks occur.

Another alternative, is to use the `std::unique_ptr`. This ensures proper deallocation when it goes out of scope, whether due to an early return or at the end of the method.
