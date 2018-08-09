var gulp = require('gulp');
var coffee = require('gulp-coffee');
var exec = require('child_process').exec;
var replace = require('gulp-replace');
var watch = require('gulp-watch');

var srcs = {
    coffeeToJs: [
      '!./node_modules/*.coffee',
      '!./node_modules/**/*.coffee',
      './*.coffee',
      './**/*.coffee'
    ]
};

gulp.task('clean', function() {
  exec('rm -rf js');
});

gulp.task('coffee to js', function() {
  var coffeeToJs = function () {
    gulp.src(srcs.coffeeToJs)
      .pipe(replace('.coffee', '.js'))
      .pipe(replace('require \'../', 'require \'../../'))
      .pipe(coffee({ bare: true }))
      .pipe(gulp.dest('js'));
  }

  coffeeToJs();

  return watch(srcs.coffeeToJs, function () {
    coffeeToJs();
  });
});

gulp.task('default', ['coffee to js']);
