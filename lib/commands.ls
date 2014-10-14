require! <[path fs]>
commands = module.exports = {}
commands['watch'] = require './commands/watch'
commands['start'] = require './commands/start'
