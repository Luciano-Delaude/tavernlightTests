# Custom Windows Module for OTClient

## Introduction

This test isn't fully completed, as there isn't a reproduction of the functionality of the window generated. However, to generate custom client functionality, it's necessary to create the following files related to that custom functionality: otmod, otui, and lua files.

## Getting Started

To begin, follow these steps:

1. Navigate to the directory `otclient/modules/`.
2. Create a new folder for your custom module. For example, `game_customWindows`.
3. Within this folder, place your otmod, otui, and lua files related to your custom window functionality.

## Compiling

After adding your custom module files, compile the client. Once compiled, you'll be able to see the loaded modules through the GUI of the game, and your generated module will be among them.

## Issue

The functionality may not be fully functional due to the inability to call the customWindow from the client. This issue arises from the difficulty in accessing the game modules from the scripts. Despite attempts to utilize calls to `g_ui` in the C++ code, the accessors to these modules, it has not been successful.

## Contributing

Contributions to resolve this issue are welcome. If you have any insights or solutions, feel free to contribute.