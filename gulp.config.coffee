# if you need init and update all
# npm i -D gulp coffee-script flux react jsx-loader keymirror object-assign gulp-jade gulp-sass gulp-pleeease gulp-imagemin gulp-webpack gulp-notify gulp-cached gulp-changed gulp-plumber browser-sync del
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
  files:
    src: ["#{dev}**/*.+(jpg|jpeg|png|gif|svg|js|html|css)"]
    dest: dest

  options:
    webpack:
      # watch: true
      output:
        filename: 'bundle.js'
      module:
        loaders: [{
          test: /\.jsx$/
          loader: 'jsx-loader'
        }]
      resolve:
        extensions: ['', '.js', '.jsx']

module.exports = config
