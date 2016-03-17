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
        ],
        'cmgsnslogin' => [
            'class' => 'cmsgears\social\login\frontend\Module'
        ]
    ],
    'components' => [
        'view' => [
            'theme' => 'themes\blog\Theme'
        ],
        'urlManager' => [
	        'rules' => [
	        	// apix request rules --------------------------
	        	// Forms
	        	'apix/form/<slug:[\w\-]+>' => 'cmgforms/apix/site/index',
	        	// Core Module Actions
	        	'apix/<controller:\w+>/<action:[\w\-]+>' => 'cmgcore/apix/<controller>/<action>',
	        	// Module Actions
	        	'apix/<module:\w+>/<controller:[\w\-]+>/<action:[\w\-]+>' => '<module>/apix/<controller>/<action>',
				// regular request rules -----------------------
	        	// SNS Login
	        	'sns/<controller:\w+>/<action:[\w\-]+>' => 'cmgsnslogin/<controller>/<action>',
	        	// Blog Posts
	        	'post/<slug:[\w\-]+>' => 'cmgcms/site/post',
	        	// Forms
	        	'form/<slug:[\w\-]+>' => 'cmgforms/site/index',
	        	// Core Module Pages
	        	'<controller:\w+>/<action:[\w\-]+>' => 'cmgcore/<controller>/<action>',
	        	// Module Pages
	        	'<module:\w+>/<controller:\w+>/<action:[\w\-]+>' => '<module>/<controller>/<action>',
	        	// Standard Pages
	        	'<action:(home)>' => 'cmgcore/user/<action>',
	        	'<action:(login|logout|register|forgot-password|reset-password|activate-account|confirm-account)>' => 'cmgcore/site/<action>',
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