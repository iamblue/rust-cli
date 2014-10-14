require! <[ fs path process child_process repl node-watch]>
module.exports = (arg, ge, done)!->
  exec = require(\child_process).exec
  spawn = require(\child_process).spawn

  console.log \*************
  console.log "Rust Watch: #{process.cwd!}"
  console.log \*************
  ctx = repl.start do
    'eval': (cmd, context, filename, callback)->
      cmd-ctx = cmd.split(\()[1].replace('\n)','')
      child_process.exec "rust #{cmd-ctx}", (err, stdout, stderr) !->
        console.log stdout
        callback!
    prompt: 'rust > '
    input: process.stdin
    output: process.stdout

  node-watch process.cwd!+ '/src', { recursive: false, followSymLinks: true }, (filename)!->
    console.log(filename, ' changed.'+ '\n')
    child = spawn 'cargo', ['build'], {stdio: 'inherit'}
    