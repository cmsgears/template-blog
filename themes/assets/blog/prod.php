<?php

return [
	'yii\web\JqueryAsset' => false,
	'common' => [
		'class' => 'yii\web\AssetBundle',
		'basePath' => '@webroot',
		'baseUrl' => '@web',
		'css' => [ 'blog/cmnbtblg-20181228.css' ],
		'js' => [ 'blog/cmnbtblg-20181228.js' ],
		'depends' => [ 'cmsgears\assets\jquery\Jquery' ]
	],
	'landing' => [
		'class' => 'yii\web\AssetBundle',
		'basePath' => '@webroot',
		'baseUrl' => '@web',
		'css' => [ 'blog/ladbtblg-20181228.css' ],
		'js' => [ 'blog/ladbtblg-20181228.js' ],
		'depends' => [ 'common' ]
	],
	'public' => [
		'class' => 'yii\web\AssetBundle',
		'basePath' => '@webroot',
		'baseUrl' => '@web',
		'css' => [ 'blog/pubbtblg-20181228.css' ],
		'js' => [ 'blog/pubbtblg-20181228.js' ],
		'depends' => [ 'common' ]
	],
	'private' => [
		'class' => 'yii\web\AssetBundle',
		'basePath' => '@webroot',
		'baseUrl' => '@web',
		'css' => [ 'blog/prvbtblg-20181228.css' ],
		'js' => [ 'blog/prvbtblg-20181228.js' ],
		'depends' => [ 'common' ]
	]
];
