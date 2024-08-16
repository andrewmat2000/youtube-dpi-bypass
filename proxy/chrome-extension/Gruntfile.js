module.exports = function (grunt) {

    grunt.initConfig({
        compress: {
            main: {
                options: {
                    archive: 'target.zip'
                },
                files: [
                    { expand: true, cwd: 'src/', src: ['**/*', '!node_modules/**', '!.DS_Store', '!archive/**', '!tests/**'], dest: '/', filter: 'isFile' }
                ]
            }
        }
    });

    grunt.loadNpmTasks('grunt-contrib-compress');
    grunt.registerTask('default', ['compress']);
};