var gulp = require('gulp');
var sass = require('gulp-sass');
var minifyCss = require('gulp-minify-css');
var concat = require('gulp-concat');
var uglify = require('gulp-uglify');
var watch = require('gulp-watch');

//scssコンパイル
gulp.task('sass', function(){
    return gulp.src(['./resources/sass/*.scss'])
        .pipe(sass({style : 'expanded'}))
        .pipe(gulp.dest('./resources/css'));
});

gulp.task('minify', function() {
    gulp.src(['./resources/css/*.css'])
        .pipe(concat('style.min.css'))
        .pipe(minifyCss())
        .pipe(gulp.dest('./public/css/'));
    return gulp.src(['./resources/js/*/*.js', './resources/js/*.js'])
        .pipe(concat('script.min.js'))
        .pipe(uglify())
        .pipe(gulp.dest('./public/js/'));
});

gulp.task('default', function() {
    gulp.watch(['./resources/sass/*.scss', './resources/js/*.js'], gulp.series( gulp.series('sass', 'minify')));
});

