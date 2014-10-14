``#!/usr/bin/env node``
process.title = 'rust'
commands = require('../lib/commands')
require! <[ fs path cliopt ]>
generator = require 'youmeb-generator'

done = (err) !->
  if err
    console.log '\n Error: '.red+(err.message || 'no message')+'\n'

parser = cliopt {
  help: 
    type: Boolean
    default: false
}

cmds =
  'watch':''
  'start':''
  
parser.use cliopt.pair!
parser.use cliopt.convert!

parser.parse process.argv.slice(2), (err) !->
  command = parser.args.shift!
  if cmds.hasOwnProperty(command)
    return commands[command](parser.args, generator, done)
  main!