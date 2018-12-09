<?php

return [
	'yii\web\JqueryAsset' => false,
	'common' => [
		'class' => 'yii\web\AssetBundle',
		'basePath' => '@webroot',
		'baseUrl' => '@web',
		'css' => [ 'blog/cmncmgbl-20181201.css' ],
		'js' => [ 'blog/cmncmgbl-20181201.js' ],
		'depends' => [ 'cmsgears\assets\jquery\Jquery' ]
	],
	'landing' => [
		'class' => 'yii\web\AssetBundle',
		'basePath' => '@webroot',
		'baseUrl' => '@web',
		'css' => [ 'blog/ladcmgbl-20181201.css' ],
		'js' => [ 'blog/ladcmgbl-20181201.js' ],
		'depends' => [ 'common' ]
	],
	'public' => [
		'class' => 'yii\web\AssetBundle',
		'basePath' => '@webroot',
		'baseUrl' => '@web',
		'css' => [ 'blog/pubcmgbl-20181201.css' ],
		'js' => [ 'blog/pubcmgbl-20181201.js' ],
		'depends' => [ 'common' ]
	],
	'private' => [
		'class' => 'yii\web\AssetBundle',
		'basePath' => '@webroot',
		'baseUrl' => '@web',
		'css' => [ 'blog/prvcmgbl-20181201.css' ],
		'js' => [ 'blog/prvcmgbl-20181201.js' ],
		'depends' => [ 'common' ]
	]
];
