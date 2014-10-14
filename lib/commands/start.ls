require! <[ fs path process child_process repl ]>
module.exports = (arg, ge, done)->
  exec = require(\child_process).exec
  spawn = require(\child_process).spawn

  exec "cargo run", (err, stdout, stderr) !->
    console.log stdout
  