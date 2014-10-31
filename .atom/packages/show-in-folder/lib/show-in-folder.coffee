ExtShowFile = require './show-file'

module.exports =
  activate: (state) ->
    atom.workspaceView.command 'show-in-folder:show_in_folder', ->
      if itemPath = getActiveSidebarPath()
        ExtShowFile.showInFolder(itemPath)

getActiveSidebarPath = ->
  atom.workspaceView.find('.tree-view .selected')?.view()?.getPath?()