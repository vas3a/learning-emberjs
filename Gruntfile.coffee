module.exports = (grunt) ->
	grunt.initConfig
		pkg: grunt.file.readJSON 'package.json'
		uglify:
			options:
				banner: '/*! <%= pkg.name %> <%= grunt.template.today("yyyy-mm-dd") %> */\n'
			application:
				src: 'public/application.js'
				dest: 'public/application.min.js'
			vendors:
				src: 'public/app.vendors.js'
				dest: 'public/app.vendors.min.js'
		concat:
			options:
				separator: ';'
			application:
				src: ['js/*.js', 'js/controllers/*.js', 'js/models/*.js', 'js/views/*.js']
				dest: 'public/application.js'
			vendors:
				src: [
					'js/libs/jquery*.js'
					'js/libs/handlebars*.js'
					'js/libs/ember-1.2.0.js'
					'js/libs/ember-data.js'
					'js/libs/ls_adapter.js'
				]
				dest: 'public/app.vendors.js'

	grunt.loadNpmTasks 'grunt-contrib-uglify'
	grunt.loadNpmTasks 'grunt-contrib-concat'

	grunt.registerTask 'build:app', ['concat:application', 'uglify:application']
	grunt.registerTask 'default', ['concat', 'uglify']