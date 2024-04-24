-- Define a table to hold references to all created custom windows
local windows = {}

-- Function to initialize the module
function init()
  -- Import the custom style for windows
  g_ui.importStyle('customWindows')

  -- Connect game events to their respective handler functions
  connect(g_game, { onEditText = onGameEditText,
                    onEditList = onGameEditList,
                    onGameEnd = destroyWindows })
end

-- Function to clean up resources when terminating the module
function terminate()
  -- Disconnect game events from their handler functions
  disconnect(g_game, { onEditText = onGameEditText,
                       onEditList = onGameEditList,
                       onGameEnd = destroyWindows })

  -- Destroy all windows
  destroyWindows()
end

-- Function to destroy all custom windows
function destroyWindows()
  for _,window in pairs(windows) do
    window:destroy()
  end
  -- Clear the table holding window references
  windows = {}
end

-- Function to create and open a custom window
function openCustomWindow(id, text, writer, time)
  -- Create a new custom window widget
  local customWindow = g_ui.createWidget('customWindow', rootWidget)
  local description = customWindow:getChildById('description')
  local okButton = customWindow:getChildById('okButton')
  local cancelButton = customWindow:getChildById('cancelButton')

  -- Set text and callbacks for UI elements
  textEdit:setText(text)
  description:setText(tr('Description text here'))
  
  local function destroy()
    customWindow:destroy()
    table.removevalue(windows, customWindow)
  end

  local doneFunc = function()
    g_game.editText(id, textEdit:getText())
    destroy()
  end

  -- Set callbacks for buttons and escape key
  okButton.onClick = doneFunc
  cancelButton.onClick = destroy
  customWindow.onEscape = destroy

  -- Add the created window to the table
  table.insert(windows, customWindow)
end

-- Handler function for the onEditText game event
function onGameEditText(id, itemId, maxLength, text, writer, time)
  -- Open a custom window with the provided text
  openCustomWindow(id, text, writer, time)
end

-- Handler function for the onEditList game event
function onGameEditList(id, doorId, text)
  -- Open a custom window with the provided text
  openCustomWindow(id, text)
end
