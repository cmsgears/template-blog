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
    'bootstrap' => [ 'log', 'cmgCore' ],
    'modules' => [
        'cmgcore' => [
            'class' => 'cmsgears\core\frontend\Module'
        ],
        'cmgforms' => [
            'class' => 'cmsgears\forms\frontend\Module'
        ],
        'cmgcms' => [
            'class' => 'cmsgears\cms\frontend\Module'
        ]
    ],
    'components' => [
        'view' => [
            'theme' => 'themes\blog\Theme'
        ],
        'urlManager' => [
	        'rules' => [
	        	// apix request rules --------------------------
	        	'apix/<module:\w+>/<controller:\w+>/<action:[\w\-]+>' => '<module>/apix/<controller>/<action>',
	        	'apix/<controller:\w+>/<action:[\w\-]+>' => 'cmgcore/apix/<controller>/<action>',
	        	'apix/<action:(login|register)>' => 'cmgcore/apix/site/<action>',
	        	'apix/<action:(contact)>' => 'cmgforms/apix/site/<action>',
				// regular request rules -----------------------
	        	'<module:\w+>/<controller:\w+>/<action:[\w\-]+>' => '<module>/<controller>/<action>',
	        	// Blog Posts
	        	'post/<slug:[\w\-]+>' => 'cmgcms/site/post',
	        	// Core Module Pages
	        	'<controller:\w+>/<action:[\w\-]+>' => 'cmgcore/<controller>/<action>',
	        	// Standard Pages
	        	'<action:(home|profile)>' => 'cmgcore/user/<action>',
	        	'<action:(login|logout|register|forgot-password|reset-password|activate-account|confirm-account)>' => 'cmgcore/site/<action>',
	        	'<form:(contact-us|feedback)>' => 'cmgforms/site/index',
	        	// CMS Pages
	        	'<slug:[\w\-]+>' => 'cmgcms/site/index'
	        ]
		],
        'cmgCore' => [
        	'loginRedirectPage' => '/home'
        ]
    ],
    'params' => $params
];

?>