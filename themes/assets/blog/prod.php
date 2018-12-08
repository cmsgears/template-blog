<?php

return [
	'yii\web\JqueryAsset' => false,
	'common' => [
		'class' => 'yii\web\AssetBundle',
		'basePath' => '@webroot',
		'baseUrl' => '@web',
		'css' => [ 'century/cmncmgbl-20181201.css' ],
		'js' => [ 'century/cmncmgbl-20181201.js' ],
		'depends' => [ 'cmsgears\assets\jquery\Jquery' ]
	],
	'landing' => [
		'class' => 'yii\web\AssetBundle',
		'basePath' => '@webroot',
		'baseUrl' => '@web',
		'css' => [ 'century/ladcmgbl-20181201.css' ],
		'js' => [ 'century/ladcmgbl-20181201.js' ],
		'depends' => [ 'common' ]
	],
	'public' => [
		'class' => 'yii\web\AssetBundle',
		'basePath' => '@webroot',
		'baseUrl' => '@web',
		'css' => [ 'century/pubcmgbl-20181201.css' ],
		'js' => [ 'century/pubcmgbl-20181201.js' ],
		'depends' => [ 'common' ]
	],
	'private' => [
		'class' => 'yii\web\AssetBundle',
		'basePath' => '@webroot',
		'baseUrl' => '@web',
		'css' => [ 'century/prvcmgbl-20181201.css' ],
		'js' => [ 'century/prvcmgbl-20181201.js' ],
		'depends' => [ 'common' ]
	]
];
