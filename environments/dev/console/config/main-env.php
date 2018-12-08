<?php

return [
	'bootstrap' => [ 'gii' ],
	'modules' => [
		'gii' => 'yii\gii\Module'
	],
	'components' => [
		'urlManager' => [
			'class' => 'yii\web\UrlManager',
			'baseUrl' => 'http://localhost/blogdemo/frontend/web'
		],
		// CMG Modules - Core
		'migration' => [
			'class' => 'cmsgears\core\common\components\Migration',
			'cmgPrefix' => 'cmg_',
			'sitePrefix' => 'blog_',
			'siteName' => 'Blog',
			'siteTitle' => 'Blog Demo',
			'siteMaster' => 'demomaster',
			'primaryDomain' => 'cmsgears.com',
			'defaultSite' => 'http://localhost/blogdemo/frontend/web',
			'defaultAdmin' => 'http://localhost/blogdemo/backend/web',
			'uploadsUrl' => 'http://localhost/blogdemo/uploads'
		]
	]
];
