<?php

$params = array_merge(
    require( dirname( dirname( __DIR__ ) ) . '/common/config/params.php' ),
    require( __DIR__ . '/params.php' )
);

return [
	'id' => 'app-console',
	'basePath' => dirname(__DIR__),
	'bootstrap' => [ 'log', 'core', 'cms', 'forms', 'snsLogin', 'newsletter', 'notify', 'foxSlider' ],
	'controllerNamespace' => 'console\controllers',
	'modules' => [
		// Console Modules
	],
	'components' => [
		// CMG Modules - Core
		'migration' => [
			'class' => 'cmsgears\core\common\components\Migration',
			'siteName' => 'CMSGears',
			'siteTitle' => 'CMSGears Demo',
			'primaryDomain' => 'cmsgears.com',
			'defaultSite' => 'http://demo.cmsgears.com/templates/blog/admin/',
			'defaultAdmin' => 'http://demo.cmsgears.com/templates/blog/',
			'uploadsUrl' => 'http://localhost/cmgdemoblog/uploads/'
		]
	],
	'params' => $params
];