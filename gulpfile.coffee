gulp = require 'gulp'
# markups
jade = require 'gulp-jade'
# styles
sass = require 'gulp-sass'
please = require 'gulp-pleeease'
# scripts
webpack = require 'gulp-webpack'
# files
imagemin = require 'gulp-imagemin'
# utils
notify = require 'gulp-notify'
cached = require 'gulp-cached'
changed = require 'gulp-changed'
plumber = require 'gulp-plumber'
browserSync = require 'browser-sync'
del = require 'del'

config = require './gulp.config'

# dev ###########################################################################################
# markups #######################################################################################
gulp.task 'markups', ->
  gulp.src config.markups.src
    .pipe(cached('markups'))
    .pipe(plumber({
      errorHandler: notify.onError("Error: <%= error.message %>")
    }))
    .pipe(jade({
      pretty: true
    }))
    .pipe(gulp.dest(config.markups.dest))
    .pipe(browserSync.reload({stream: true}))
# styles ########################################################################################
gulp.task 'styles', ->
  gulp.src config.styles.src
    .pipe(cached('styles'))
    .pipe(plumber({
      errorHandler: notify.onError("Error: <%= error.message %>")
    }))
    .pipe(sass(
      errLogToConsole: true
      sourceComments : 'normal'
    ))
    .pipe(please({
      'minifier': false,
      'autoprefixer': {
        'browsers': ['last 4 version', 'ie 8', 'iOS 4', 'Android 2.3']
      }
    }))
    .pipe(gulp.dest(config.styles.dest))
    .pipe(browserSync.reload({stream: true}))
# scripts #######################################################################################
gulp.task 'scripts', ->
  gulp.src config.scripts.src
    .pipe(cached('scripts'))
    .pipe(plumber({
      errorHandler: notify.onError("Error: <%= error.message %>")
    }))
    .pipe(webpack(config.options.webpack))
    .pipe(gulp.dest(config.scripts.dest))
    .pipe(browserSync.reload({stream: true}))
# files #########################################################################################
gulp.task 'files', ->
  gulp.src config.files.src
    .pipe(plumber({
      errorHandler: notify.onError("Error: <%= error.message %>")
    }))
    .pipe(changed(config.dest))
    .pipe(imagemin({
      optimizationLevel: 7
    }))
    .pipe(gulp.dest(config.files.dest))
    .pipe(browserSync.reload({stream: true}))
# utils #########################################################################################
gulp.task 'browserSync', ['watch'], ->
  browserSync
    server:
      baseDir: config.dest
    notify: false

gulp.task 'watch', ['markups', 'styles', 'scripts', 'files'], ->
  gulp.watch config.markups.src, ['markups']
  gulp.watch config.styles.src, ['styles']
  gulp.watch config.scripts.src, ['scripts']
  gulp.watch config.files.src, ['files']

gulp.task 'default', ['browserSync']
