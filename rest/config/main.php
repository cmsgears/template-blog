<?php

$params = yii\helpers\ArrayHelper::merge(
	require __DIR__ . '/../../common/config/params.php',
	require __DIR__ . '/params.php'
);

return [
	'id' => 'app-rest',
	'name' => 'Blog Demo',
	'version' => '1.0.0',
	'basePath' => dirname( __DIR__ ),
	'controllerNamespace' => 'api\controllers',
	'defaultRoute' => 'core/site/index',
	//'catchAll' => [ 'core/site/maintenance' ],
	'bootstrap' => [
		'log',
		'core', 'coreFactory', 'forms', 'formsFactory', 'cms', 'cmsFactory', 'breeze',
		'newsletter', 'newsletterFactory', 'notify', 'notifyFactory',
		'snsConnect', 'snsConnectFactory',
		'foxSlider',
		'blogCoreFactory'
	],
	'modules' => [
		'core' => [
			'class' => 'modules\core\api\Module'
		],
		'forms' => [
			'class' => 'cmsgears\forms\api\Module'
		],
        'cms' => [
            'class' => 'cmsgears\cms\api\Module'
        ],
		'newsletter' => [
			'class' => 'cmsgears\newsletter\api\Module'
		],
		'notify' => [
			'class' => 'cmsgears\notify\api\Module'
		],
		'snsconnect' => [
			'class' => 'cmsgears\social\connect\api\Module'
		],
        'foxslider' => [
            'class' => 'foxslider\api\Module'
        ]
	],
	'components' => [
		'request' => [
			'parsers' => [
				'application/json' => 'yii\web\JsonParser'
			]
		],
		'errorHandler' => [
			'errorAction' => 'core/site/error'
		],
		'urlManager' => [
			'rules' => [
				// rest request rules ---------------------------
				// Generic - 2, 3, 4 and 5 levels - catch all
				'<controller:[\w\-]+>/<action:[\w\-]+>' => 'core/api/<controller>/<action>',
				'<module:\w+>/<controller:[\w\-]+>/<action:[\w\-]+>' => '<module>/api/<controller>/<action>',
				'<module:\w+>/<controller:[\w\-]+>/<pcontroller:[\w\-]+>/<action:[\w\-]+>' => '<module>/api/<controller>/<pcontroller>/<action>',
				'<module:\w+>/<pcontroller1:\w+>/<pcontroller2:\w+>/<controller:\w+>/<action:[\w\-]+>' => '<module>/api/<pcontroller1>/<pcontroller2>/<controller>/<action>'
			]
		]
	],
	'params' => $params
];
