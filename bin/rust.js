#!/usr/bin/env node
var commands, fs, path, cliopt, generator, done, parser, cmds;
process.title = 'rust';
commands = require('../lib/commands');
fs = require('fs');
path = require('path');
cliopt = require('cliopt');
generator = require('youmeb-generator');
done = function(err){
  if (err) {
    console.log('\n Error: '.red + (err.message || 'no message') + '\n');
  }
};
parser = cliopt({
  help: {
    type: Boolean,
    'default': false
  }
});
cmds = {
  'watch': '',
  'start': ''
};
parser.use(cliopt.pair());
parser.use(cliopt.convert());
parser.parse(process.argv.slice(2), function(err){
  var command;
  command = parser.args.shift();
  if (cmds.hasOwnProperty(command)) {
    return commands[command](parser.args, generator, done);
  }
  main();
});
