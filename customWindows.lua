local windows = {}

function init()
  g_ui.importStyle('customWindows')

  connect(g_game, { onEditText = onGameEditText,
                    onEditList = onGameEditList,
                    onGameEnd = destroyWindows })
end

function terminate()
  disconnect(g_game, { onEditText = onGameEditText,
                       onEditList = onGameEditList,
                       onGameEnd = destroyWindows })

  destroyWindows()
end

function destroyWindows()
  for _,window in pairs(windows) do
    window:destroy()
  end
  windows = {}
end

function openCustomWindow(id, text, writer, time)
  local customWindow = g_ui.createWidget('customWindow', rootWidget)
  local description = customWindow:getChildById('description')
  local okButton = customWindow:getChildById('okButton')
  local cancelButton = customWindow:getChildById('cancelButton')

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

  okButton.onClick = doneFunc
  cancelButton.onClick = destroy
  customWindow.onEscape = destroy

  table.insert(windows, customWindow)
end

function onGameEditText(id, itemId, maxLength, text, writer, time)
  openCustomWindow(id, text, writer, time)
end

function onGameEditList(id, doorId, text)
  openCustomWindow(id, text)
end
