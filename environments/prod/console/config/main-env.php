<?php

return [
	'components' => [
		'urlManager' => [
			'class' => 'yii\web\UrlManager',
			'baseUrl' => 'https://demo.cmsgears.com/template/blog'
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
			'defaultSite' => 'https://demo.cmsgears.com/template/blog',
			'defaultAdmin' => 'https://demo.cmsgears.com/template/blog/admin',
			'uploadsUrl' => 'https://demo.cmsgears.com/template/blog/uploads'
		]
	]
];
