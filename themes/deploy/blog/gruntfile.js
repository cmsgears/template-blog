module.exports = function( grunt ) {

	grunt.loadNpmTasks( 'grunt-contrib-sass' );
	grunt.loadNpmTasks('grunt-contrib-concat');
	grunt.renameTask( 'concat', 'concatFa' );
 	grunt.loadNpmTasks( 'grunt-contrib-concat' );
	grunt.renameTask( 'concat', 'concatCssCommon' );
 	grunt.loadNpmTasks( 'grunt-contrib-concat' );
	grunt.renameTask( 'concat', 'concatCssLanding' );
 	grunt.loadNpmTasks( 'grunt-contrib-concat' );
	grunt.renameTask( 'concat', 'concatCssPublic' );
 	grunt.loadNpmTasks( 'grunt-contrib-concat' );
	grunt.renameTask( 'concat', 'concatCssPrivate' );
 	grunt.loadNpmTasks( 'grunt-contrib-concat' );
	grunt.renameTask( 'concat', 'concatJsLazy' );
	grunt.loadNpmTasks('grunt-contrib-concat');
	grunt.renameTask( 'concat', 'concatJsCommon' );
	grunt.loadNpmTasks('grunt-contrib-concat');
	grunt.renameTask( 'concat', 'concatJsLanding' );
	grunt.loadNpmTasks('grunt-contrib-concat');
	grunt.renameTask( 'concat', 'concatJsPublic' );
	grunt.loadNpmTasks('grunt-contrib-concat');
	grunt.renameTask( 'concat', 'concatJsPrivate' );
	grunt.loadNpmTasks( 'grunt-contrib-cssmin' );
	grunt.loadNpmTasks( 'grunt-contrib-uglify' );
	grunt.loadNpmTasks( 'grunt-contrib-copy' );

    grunt.initConfig({
        pkg: grunt.file.readJSON( 'package.json' ),
		sass: {
			dist: {
				options: {
					style: 'expanded',
					loadPath: [ '../../../../../../projects-vc/css/cmt-ui/breeze/src/scss', '../../../../../../projects-vc/css/cmt-ui/breeze-templates/src/scss' ]
				},
				files: {
					'../../../frontend/web/blog/ladbtblg-20200401-src.css': '../../../themes/blog/resources/styles/scss/landing.scss',
					'../../../frontend/web/blog/pubbtblg-20200401-src.css': '../../../themes/blog/resources/styles/scss/public.scss',
					'../../../frontend/web/blog/prvbtblg-20200401-src.css': '../../../themes/blog/resources/styles/scss/private.scss'
				}
			}
		},
        concatFa: {
      		options: {
        		separator: '\n\n'
      		},
      		dist: {
        		src: [
					'../../../themes/blog/resources/styles/fixes/font-fix-fa.css',
					'../../../vendor/bower-asset/fontawesome/web-fonts-with-css/css/fontawesome-all.min.css'
				],
        		dest: '../../../frontend/web/blog/fawbtblg-20200401-src.css'
      		}
    	},
        concatCssCommon: {
      		options: {
        		separator: '\n\n'
      		},
      		dist: {
        		src: [
					'../../../themes/blog/resources/styles/fixes/font-fix-breeze.css',
					'../../../vendor/bower-asset/animate.css/animate.min.css',
					'../../../vendor/bower-asset/cmt-breeze-icons/dist/css/breeze-icons-core.min.css',
					'../../../vendor/bower-asset/cmt-breeze-icons/dist/css/breeze-icons-brand.min.css',
					'../../../vendor/bower-asset/cmt-breeze-icons/dist/css/breeze-icons-currency.min.css',
					//'../../../vendor/bower-asset/nouislider/distribute/nouislider.min.css',
					'../../../vendor/bower-asset/chart.js/dist/Chart.min.css',
					'../../../vendor/bower-asset/aos/dist/aos.css',
					'../../../vendor/bower-asset/intl-tel-input/build/css/intlTelInput.min.css'
				],
        		dest: '../../../frontend/web/blog/cmnbtblg-20200401-src.css'
      		}
    	},
        concatCssLanding: {
      		options: {
        		separator: '\n\n'
      		},
      		dist: {
        		src: [
					'../../../frontend/web/blog/ladbtblg-20200401-src.css'
				],
        		dest: '../../../frontend/web/blog/ladbtblg-20200401-src.css'
      		}
    	},
        concatCssPublic: {
      		options: {
        		separator: '\n\n'
      		},
      		dist: {
        		src: [
					'../../../vendor/bower-asset/datetimepicker/build/jquery.datetimepicker.min.css',
					'../../../frontend/web/blog/pubbtblg-20200401-src.css'
				],
        		dest: '../../../frontend/web/blog/pubbtblg-20200401-src.css'
      		}
    	},
        concatCssPrivate: {
      		options: {
        		separator: '\n\n'
      		},
      		dist: {
        		src: [
					'../../../vendor/bower-asset/datetimepicker/build/jquery.datetimepicker.min.css',
					//'../../../assets/fullcalendar/dist/fullcalendar.min.css',
					'../../../frontend/web/blog/prvbtblg-20200401-src.css'
				],
        		dest: '../../../frontend/web/blog/prvbtblg-20200401-src.css'
      		}
    	},
        concatJsLazy: {
      		options: {
        		separator: '\n\n'
      		},
      		dist: {
        		src: [
					'../../../vendor/bower-asset/cmt-velocity/src/solo/lazy.js'
				],
        		dest: '../../../frontend/web/blog/lzybtblg-20200401-src.js'
      		}
    	},
        concatJsCommon: {
      		options: {
        		separator: '\n\n'
      		},
      		dist: {
        		src: [
					//'../../../vendor/bower-asset/jquery/dist/jquery.min.js',
					'../../../vendor/bower-asset/jquery-ui/jquery-ui.min.js',
					'../../../vendor/foxslider/cmg-plugin/widgets/resources/scripts/foxslider-core.js',
					//'../../../vendor/bower-asset/conditionizr/dist/conditionizr.min.js',
					'../../../vendor/bower-asset/imagesloaded/imagesloaded.pkgd.min.js',
					'../../../vendor/bower-asset/handlebars/handlebars.min.js',
					'../../../vendor/bower-asset/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js',
					//'../../../vendor/bower-asset/nouislider/distribute/nouislider.min.js',
					//'../../../vendor/bower-asset/progressbar.js/dist/progressbar.min.js',
					'../../../vendor/bower-asset/chart.js/dist/Chart.min.js',
					'../../../vendor/bower-asset/aos/dist/aos.js',
					'../../../vendor/bower-asset/intl-tel-input/build/js/utils.js',
					'../../../vendor/bower-asset/intl-tel-input/build/js/intlTelInput-jquery.min.js',
					'../../../vendor/cmgtools/velocity/dist/velocity.js',

					'../../../vendor/cmgtools/velocity-apps/src/apps/core/base.js',
					'../../../vendor/cmgtools/velocity-apps/src/apps/core/grid.js',
					'../../../vendor/cmgtools/velocity-apps/src/apps/core/autoload.js',
					'../../../vendor/cmgtools/velocity-apps/src/apps/core/controllers/site.js',
					'../../../vendor/cmgtools/velocity-apps/src/apps/core/controllers/province.js',
					'../../../vendor/cmgtools/velocity-apps/src/apps/core/controllers/region.js',
					'../../../vendor/cmgtools/velocity-apps/src/apps/core/controllers/city.js',
					'../../../vendor/cmgtools/velocity-apps/src/apps/core/controllers/comment.js',

					'../../../vendor/cmgtools/velocity-apps/src/apps/forms/base.js',
					'../../../vendor/cmgtools/velocity-apps/src/apps/forms/controllers/form.js',

					'../../../vendor/cmgtools/velocity-apps/src/apps/notify/base.js',
					'../../../vendor/cmgtools/velocity-apps/src/apps/notify/controllers/notification.js',

					'../../../themes/blog/resources/scripts/templates/public.js',

					'../../../themes/blog/resources/scripts/apix/public.js',

					'../../../themes/blog/resources/scripts/apps/public.js',

					'../../../themes/blog/resources/scripts/apps/core/base.js',
					'../../../themes/blog/resources/scripts/apps/core/autoload.js',
					'../../../themes/blog/resources/scripts/apps/core/controllers/site.js'
				],
        		dest: '../../../frontend/web/blog/cmnbtblg-20200401-src.js'
      		}
    	},
        concatJsLanding: {
      		options: {
        		separator: '\n\n'
      		},
      		dist: {
        		src: [
					'../../../themes/blog/resources/scripts/main.js',
					'../../../themes/blog/resources/scripts/landing.js',
					'../../../themes/blog/resources/scripts/search.js',
					'../../../themes/blog/resources/scripts/sliders.js',
					'../../../themes/blog/resources/scripts/popups.js'
				],
        		dest: '../../../frontend/web/blog/ladbtblg-20200401-src.js'
      		}
    	},
        concatJsPublic: {
      		options: {
        		separator: '\n\n'
      		},
      		dist: {
        		src: [
					'../../../vendor/bower-asset/datetimepicker/build/jquery.datetimepicker.full.min.js',

					'../../../themes/blog/resources/scripts/main.js',
					'../../../themes/blog/resources/scripts/public.js',
					'../../../themes/blog/resources/scripts/search.js',
					'../../../themes/blog/resources/scripts/sliders.js',
					'../../../themes/blog/resources/scripts/popups.js'
				],
        		dest: '../../../frontend/web/blog/pubbtblg-20200401-src.js'
      		}
    	},
        concatJsPrivate: {
      		options: {
        		separator: '\n\n'
      		},
      		dist: {
        		src: [
					'../../../vendor/bower-asset/datetimepicker/build/jquery.datetimepicker.full.min.js',
					'../../../vendor/bower-asset/moment/min/moment.min.js',
					//'../../../themes/assets/vendor/fullcalendar/lib/main/fullcalendar.min.js',

					'../../../vendor/cmgtools/velocity-apps/src/apps/core/services/address.js',
					'../../../vendor/cmgtools/velocity-apps/src/apps/core/services/data.js',
					'../../../vendor/cmgtools/velocity-apps/src/apps/core/services/file.js',
					'../../../vendor/cmgtools/velocity-apps/src/apps/core/services/gallery.js',
					'../../../vendor/cmgtools/velocity-apps/src/apps/core/services/location.js',
					'../../../vendor/cmgtools/velocity-apps/src/apps/core/services/mapper.js',
					'../../../vendor/cmgtools/velocity-apps/src/apps/core/services/meta.js',
					'../../../vendor/cmgtools/velocity-apps/src/apps/core/services/model.js',
					'../../../vendor/cmgtools/velocity-apps/src/apps/core/services/social.js',
					'../../../vendor/cmgtools/velocity-apps/src/apps/core/services/user.js',
					'../../../vendor/cmgtools/velocity-apps/src/apps/core/controllers/main.js',
					'../../../vendor/cmgtools/velocity-apps/src/apps/core/controllers/address.js',
					'../../../vendor/cmgtools/velocity-apps/src/apps/core/controllers/data.js',
					'../../../vendor/cmgtools/velocity-apps/src/apps/core/controllers/file.js',
					'../../../vendor/cmgtools/velocity-apps/src/apps/core/controllers/gallery.js',
					'../../../vendor/cmgtools/velocity-apps/src/apps/core/controllers/location.js',
					'../../../vendor/cmgtools/velocity-apps/src/apps/core/controllers/mapper.js',
					'../../../vendor/cmgtools/velocity-apps/src/apps/core/controllers/meta.js',
					'../../../vendor/cmgtools/velocity-apps/src/apps/core/controllers/model.js',
					'../../../vendor/cmgtools/velocity-apps/src/apps/core/controllers/social.js',
					'../../../vendor/cmgtools/velocity-apps/src/apps/core/controllers/user.js',

					'../../../vendor/cmgtools/velocity-apps/src/apps/notify/base.js',
					'../../../vendor/cmgtools/velocity-apps/src/apps/notify/controllers/notification.js',

					'../../../themes/blog/resources/scripts/templates/private.js',

					'../../../themes/blog/resources/scripts/apix/private.js',

					'../../../themes/blog/resources/scripts/apps/private.js',

					'../../../themes/blog/resources/scripts/apps/core/services/user.js',
					'../../../themes/blog/resources/scripts/apps/core/controllers/main.js',
					'../../../themes/blog/resources/scripts/apps/core/controllers/user.js',

					'../../../themes/blog/resources/scripts/main.js',
					'../../../themes/blog/resources/scripts/private.js',
					'../../../themes/blog/resources/scripts/search.js',
					'../../../themes/blog/resources/scripts/sliders.js',
					'../../../themes/blog/resources/scripts/popups.js'
				],
        		dest: '../../../frontend/web/blog/prvbtblg-20200401-src.js'
      		}
    	},
    	cssmin: {
			options: {

			},
      		target: {
	        	files: {
					'../../../frontend/web/blog/fawbtblg-20200401.css': [ '../../../frontend/web/blog/fawbtblg-20200401-src.css' ],
					'../../../frontend/web/blog/cmnbtblg-20200401.css': [ '../../../frontend/web/blog/cmnbtblg-20200401-src.css' ],
	          		'../../../frontend/web/blog/ladbtblg-20200401.css': [ '../../../frontend/web/blog/ladbtblg-20200401-src.css' ],
					'../../../frontend/web/blog/pubbtblg-20200401.css': [ '../../../frontend/web/blog/pubbtblg-20200401-src.css' ],
					'../../../frontend/web/blog/prvbtblg-20200401.css': [ '../../../frontend/web/blog/prvbtblg-20200401-src.css' ]
	        	}
      		}
    	},
    	uglify: {
			options: {

			},
      		main_target: {
	        	files: {
	          		'../../../frontend/web/blog/lzybtblg-20200401.js': [ '../../../frontend/web/blog/lzybtblg-20200401-src.js' ],
					'../../../frontend/web/blog/cmnbtblg-20200401.js': [ '../../../frontend/web/blog/cmnbtblg-20200401-src.js' ],
					'../../../frontend/web/blog/ladbtblg-20200401.js': [ '../../../frontend/web/blog/ladbtblg-20200401-src.js' ],
					'../../../frontend/web/blog/pubbtblg-20200401.js': [ '../../../frontend/web/blog/pubbtblg-20200401-src.js' ],
					'../../../frontend/web/blog/prvbtblg-20200401.js': [ '../../../frontend/web/blog/prvbtblg-20200401-src.js' ]
	        	}
      		}
    	},
		copy: {
			main: {
				files: [
					{ expand: true, cwd: '../../../themes/blog/resources/fonts/poppins/', src: ['**'], dest: '../../../frontend/web/fonts/poppins/', filter: 'isFile' },
					{ expand: true, cwd: '../../../vendor/bower-asset/cmt-breeze-icons/dist/fonts/breeze/', src: ['**'], dest: '../../../frontend/web/fonts/breeze/', filter: 'isFile' },
					{ expand: true, cwd: '../../../vendor/bower-asset/fontawesome/web-fonts-with-css/webfonts/', src: ['**'], dest: '../../../frontend/web/webfonts/', filter: 'isFile' },
					{ expand: true, cwd: '../../../themes/blog/resources/images/blog/', src: ['**'], dest: '../../../frontend/web/images/blog/', filter: 'isFile' },
					{ expand: true, cwd: '../../../themes/blog/resources/images/blog/icons/', src: ['**'], dest: '../../../frontend/web/images/blog/icons/', filter: 'isFile' }
				]
			}
		}
    });

	grunt.registerTask( 'default', [ 'sass', 'concatFa', 'concatCssCommon', 'concatCssLanding', 'concatCssPublic', 'concatCssPrivate', 'concatJsLazy', 'concatJsCommon', 'concatJsLanding', 'concatJsPublic', 'concatJsPrivate', 'cssmin', 'uglify', 'copy' ] );
};
