Shell = require 'shell'

module.exports =
class ExtShowFile
  @showInFolder: (filePath) ->
    Shell.showItemInFolder(filePath);
