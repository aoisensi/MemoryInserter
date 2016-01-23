gulp = require 'gulp'
$ = do require 'gulp-load-plugins'
info = require './src/info.json'
modname = "#{info.name}_#{info.version}"
packname = "#{modname}.zip"

gulp.task 'build', ->
  gulp.src 'src/*'
    .pipe $.rename (path) ->
      path.dirname = "./#{modname}/#{path.dirname}"
    .pipe $.zip packname
    .pipe gulp.dest 'dest'
    
gulp.task 'default', ['build']

gulp.task 'watch', ['build'], ->
  gulp.watch './src/*', ['build']
