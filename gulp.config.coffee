# if you need init and update all
# npm i -D gulp coffee-script flux react jsx-loader object-assign gulp-jade gulp-sass gulp-pleeease gulp-imagemin gulp-webpack gulp-notify gulp-cached gulp-changed gulp-plumber browser-sync
notify = require 'gulp-notify'

dev = 'dev/'
dest = 'public/'

config =
  dev: dev
  dest: dest
  markups:
    src: ["#{dev}**/*.jade"]
    dest: dest
  styles:
    src: ["#{dev}**/*.sass"]
    dest: dest
  scripts:
    src: ["#{dev}assets/scripts/app.jsx"]
    dest: "#{dest}assets/scripts/"
    watch: ["#{dev}assets/**/*.jsx"]
  files:
    src: ["#{dev}**/*.+(jpg|jpeg|png|gif|svg|js|html|css)"]
    dest: dest

  options:
    jade:
      pretty: true
    sass:
      errLogToConsole: true
      sourceComments : 'normal'
    please:
      minifier: false
      autoprefixer:
        browsers: ['last 4 version', 'ie 8', 'iOS 4', 'Android 2.3']
    webpack:
      output:
        filename: 'bundle.js'
        sourceMapFilename: 'sourcemap'
      module:
        loaders: [{
          test: /\.jsx$/
          loader: 'jsx-loader'
        }]
      resolve:
        extensions: ['', '.js', '.jsx']
      devtool: 'source-map'
    imagemin:
      optimizationLevel: 7
    plumber:
      errorHandler: notify.onError "Error: <%= error.message %>"
    browserSync:
      server:
        baseDir: dest
      notify: false

module.exports = config
