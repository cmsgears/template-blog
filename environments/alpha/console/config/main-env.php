<?php

return [
	'bootstrap' => [ 'gii' ],
	'modules' => [
		'gii' => 'yii\gii\Module'
	],
	'components' => [
		'urlManager' => [
			'class' => 'yii\web\UrlManager',
			'baseUrl' => 'https://alpha.cmsgears.com/blogdemo/frontend/web'
		],
		// CMG Modules - Core
		'migration' => [
			'class' => 'cmsgears\core\common\components\Migration',
			'cmgPrefix' => 'cmg_',
			'sitePrefix' => 'site_',
			'siteName' => 'CMSGears',
			'siteTitle' => 'Blog Demo',
			'siteMaster' => 'demomaster',
			'primaryDomain' => 'cmsgears.com',
			'defaultSite' => 'https://alpha.cmsgears.com/blogdemo/frontend/web',
			'defaultAdmin' => 'https://alpha.cmsgears.com/blogdemo/backend/web',
			'uploadsUrl' => 'https://alpha.cmsgears.com/blogdemo/uploads'
		]
	]
];
