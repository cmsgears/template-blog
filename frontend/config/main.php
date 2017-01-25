<?php

$params = yii\helpers\ArrayHelper::merge(
    require( dirname( dirname( __DIR__ ) ) . '/common/config/params.php' ),
    require( __DIR__ . '/params.php' )
);

return [
    'id' => 'app-frontend',
    'basePath' => dirname(__DIR__),
    'controllerNamespace' => 'frontend\controllers',
    'defaultRoute' => 'cmgcore/site/index',
	'bootstrap' => [ 'log', 'core', 'cms', 'forms', 'snsLogin', 'newsletter', 'notify', 'foxSlider' ],
	'modules' => [
		'core' => [
			'class'	=> 'cmsgears\core\frontend\Module'
		],
		'cms' => [
			'class' => 'cmsgears\cms\frontend\Module'
		],
		'forms' => [
			'class' => 'cmsgears\forms\frontend\Module'
		],
		'newsletter' => [
			'class' => 'cmsgears\newsletter\frontend\Module'
		],
		'notify' => [
			'class' => 'cmsgears\notify\frontend\Module'
		]
	],
    'components' => [
        'view' => [
			'theme' => [
            	'class' => 'themes\blog\Theme',
            	'childs' => [
            		// Child themes to override theme css and to add additional js 
            	]
			]
        ],
        'request' => [
            'csrfParam' => '_csrf-app',
		    'parsers' => [
		        'application/json' => 'yii\web\JsonParser'
		    ]
        ],
        'user' => [
            'identityCookie' => [ 'name' => '_identity-app', 'httpOnly' => true ]
        ],
        'session' => [
            'name' => 'blog-app'
        ],
        'errorHandler' => [
            'errorAction' => 'core/site/error'
        ],
        'urlManager' => [
	        'rules' => [
				// apix request rules --------------------------
				// Forms - site forms
				'apix/form/<slug:[\w\-]+>' => 'forms/apix/form/submit',
				// Post - 2 and 3 levels
				'apix/post/<controller:[\w\-]+>/<action:[\w\-]+>' => 'cms/apix/post/<controller>/<action>',
				'apix/post/<pcontroller:\w+>/<controller:[\w\-]+>/<action:[\w\-]+>' => 'cms/apix/post/<pcontroller>/<controller>/<action>',
				// Core - 2 levels
				'apix/<controller:\w+>/<action:[\w\-]+>' => 'core/apix/<controller>/<action>',
				// Generic - 3 and 4 levels
				'apix/<module:\w+>/<controller:[\w\-]+>/<action:[\w\-]+>' => '<module>/apix/<controller>/<action>',
				'apix/<module:\w+>/<pcontroller:\w+>/<controller:[\w\-]+>/<action:[\w\-]+>' => '<module>/apix/<pcontroller>/<controller>/<action>',
				// regular request rules -----------------------
	        	// SNS Login
	        	'sns/<controller:\w+>/<action:[\w\-]+>' => 'snslogin/<controller>/<action>',
				// Blog
				'blog/search' => 'cms/post/search',
				'blog/category/<slug:[\w\-]+>' => 'cms/post/category',
				'blog/tag/<slug:[\w\-]+>' => 'cms/post/tag',
				'blog/<slug:[\w\-]+>' => 'cms/post/single',
				// Forms
				'form/<slug:[\w\-]+>' => 'forms/form/single',
				// Core Module Pages
				'<controller:\w+>/<action:[\w\-]+>' => 'core/<controller>/<action>',
				// Module Pages
				'<module:\w+>/<controller:\w+>/<action:[\w\-]+>' => '<module>/<controller>/<action>',
				// Standard Pages
				'<action:(home)>' => 'core/user/<action>',
				'<action:(login|logout|register|forgot-password|reset-password|activate-account|confirm-account)>' => 'core/site/<action>',
				// CMS Pages
				'<slug:[\w\-]+>' => 'cms/page/single'
	        ]
		],
        'core' => [
        	'loginRedirectPage' => '/home'
        ]
    ],
    'params' => $params
];