<?php

$params = yii\helpers\ArrayHelper::merge(
    require( dirname( dirname( __DIR__ ) ) . '/common/config/params.php' ),
    require( __DIR__ . '/params.php' )
);

return [
    'id' => 'app-admin',
    'basePath' => dirname( __DIR__ ),
    'controllerNamespace' => 'admin\controllers',
    'defaultRoute' => 'cmgcore/site/index',
    'bootstrap' => [ 'log', 'cmgCore' ],
    'modules' => [
        'cmgcore' => [
            'class' => 'cmsgears\core\admin\Module'
        ],
        'cmgforms' => [
            'class' => 'cmsgears\forms\admin\Module'
        ],
        'cmgcms' => [
            'class' => 'cmsgears\cms\admin\Module'
        ],
        'cmgsnslogin' => [
            'class' => 'cmsgears\social\login\admin\Module'
        ]
    ],
    'components' => [
        'view' => [
            'theme' => 'themes\admin\Theme'
        ],
        'urlManager' => [
	        'rules' => [
	        	// APIX Rules
	        	'apix/<module:\w+>/<controller:\w+>/<action:[\w\-]+>' => '<module>/apix/<controller>/<action>',
	        	'apix/<controller:\w+>/<action:[\w\-]+>' => 'cmgcore/apix/<controller>/<action>',
	        	// Regular Rules
	        	'<module:\w+>/<controller:\w+>/<action:[\w\-]+>' => '<module>/<controller>/<action>',
	        	'<action:(login|logout|dashboard|forgot-password|reset-password|activate-account)>' => 'cmgcore/site/<action>'
	        ]
		],
        'cmgCore' => [
        	'loginRedirectPage' => '/dashboard',
        	'logoutRedirectPage' => '/login'
        ],
        'sidebar' => [
        	'class' => 'cmsgears\core\admin\components\Sidebar',
        	'modules' => [ 'cmgcms', 'cmgforms', 'cmgcore', 'cmgsnslogin' ],
        	'plugins' => [
        		'socialMeta' => [ 'twitter-meta', 'facebook-meta' ],
        		'fileManager' => [ 'file' ]
        	]
        ],
        'dashboard' => [
        	'class' => 'cmsgears\core\admin\components\Dashboard',
        	'modules' => [ 'cmgcms', 'cmgcore' ]
        ]
    ],
    'params' => $params
];

?>