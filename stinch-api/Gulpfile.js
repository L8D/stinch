'use strict';

const gulp = require('gulp');
const smaps = require('gulp-sourcemaps');

gulp.task('default', ['build']);

gulp.task('build', function() {
    const babel = require('gulp-babel');

    return gulp.src('src/**/*.js')
        .pipe(smaps.init())
        .pipe(babel())
        .pipe(smaps.write('.', {sourceRoot: '../src'}))
        .pipe(gulp.dest('lib'));
});
