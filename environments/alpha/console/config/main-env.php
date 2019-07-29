<?php

return [
	'bootstrap' => [ 'gii' ],
	'modules' => [
		'gii' => 'yii\gii\Module'
	],
	'components' => [
		'urlManager' => [
			'class' => 'yii\web\UrlManager',
			'baseUrl' => 'https://dev.vcdevhub.com/basicdemo/frontend/web'
		],
		// CMG Modules - Core
		'migration' => [
			'class' => 'cmsgears\core\common\components\Migration',
			'cmgPrefix' => 'cmg_',
			'sitePrefix' => 'blog_',
			'siteName' => 'Blog',
			'siteTitle' => 'Blog Demo',
			'siteMaster' => 'demomaster',
			'primaryDomain' => 'dev.vcdevhub.com',
			'defaultSite' => 'https://dev.vcdevhub.com/blogdemo/frontend/web',
			'defaultAdmin' => 'https://dev.vcdevhub.com/blogdemo/backend/web',
			'uploadsUrl' => 'https://dev.vcdevhub.com/blogdemo/uploads'
		]
	]
];
