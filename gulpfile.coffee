gulp         = require 'gulp'
sass         = require 'gulp-ruby-sass'
#compass      = require 'gulp-compass'
rename       = require 'gulp-rename'
gutil        = require 'gulp-util'
coffee       = require 'gulp-coffee'
uglify       = require 'gulp-uglify'
concat       = require 'gulp-concat'
#jade         = require 'gulp-jade'
del          = require 'del'
path         = require 'path'
minifycss    = require 'gulp-minify-css'
autoprefixer = require 'gulp-autoprefixer'

# sass task
#gulp.task 'styles', ->
gulp.task 'sass', ->
  gulp.src 'src/sass/**/*.scss'
    .pipe sass(
      style: 'expanded'
      sourcemap: false
#      loadPath: [__dirname + '/src/sass']
    ).on 'error', gutil.log
#    .pipe autoprefixer 'last 2 version', 'safari 5', 'ie 9', 'opera 12.1', 'ios 6', 'android 4'
    .pipe gulp.dest 'src/css'
#    .pipe rename
#      suffix: '.min'
#    .pipe minifycss()
#    .pipe gulp.dest 'dist/css'

# styles task
gulp.task 'styles', ['sass'], ->
  gulp.src [
    'bower_components/normalize-css/normalize.css',
    'src/css/**/*.css'
  ]
    .pipe concat 'demo.css'
    .pipe rename
      suffix: '.min'
    .pipe minifycss()
    .pipe gulp.dest 'dist/css'

# coffee task
gulp.task 'coffee', ->
  gulp.src 'src/coffee/**/*.coffee'
    .pipe coffee(bare: true).on 'error', gutil.log
    .pipe gulp.dest 'src/js'
#    .pipe gulp.dest 'dist/js'

# scripts
gulp.task 'scripts', ['coffee'], ->
  gulp.src ['bower_components/jquery/dist/jquery.js', 'src/js/**/*.js']
    .pipe concat 'demo.js'
    .pipe rename
      suffix: '.min'
    .pipe uglify()
    .pipe gulp.dest 'dist/js'

# html task
gulp.task 'html', ->
  gulp.src 'src/jade/*.jade'
    .pipe jade(
      pretty: true
    ).on 'error', gutil.log
#    .pipe minifyHtml()
    .pipe gulp.dest './'

# clean up task
gulp.task 'clean', ->
  del [
    'dist',
    'src/css/**/*.css',
    'src/js/**/*.js'
  ]

# default task
#gulp.task 'default', ['clean', 'styles', 'coffee', 'html']#, 'scripts', 'images']
gulp.task 'default', ['clean', 'styles', 'scripts']

# watch task
gulp.task 'watch', ->
  # Watch .scss files
  gulp.watch 'src/sass/**/*.scss', ['styles']
  # Watch .coffee files
  gulp.watch 'src/coffee/**/*.coffee', ['scripts']
#  gulp.watch 'src/coffee/**/*.coffee', ['coffee']
  # Watch .js files
#  gulp.watch 'src/js/**/*.js', ['scripts']
  # Watch .jade files
  gulp.watch 'src/jade/**/*.jade', ['html']
  # Watch image files
#  gulp.watch 'src/images/**/*', ['images']
