<?php

return [
	'yii\web\JqueryAsset' => false,
	'cmtjs' => [
		'class' => 'themes\admin\assets\CmtJsAssets'
	],
	'public' => [
		'class' => 'themes\admin\assets\PublicAssets'
	],
	'private' => [
		'class' => 'themes\admin\assets\PrivateAssets'
	],
	'child' => [
		'class' => 'themes\adminchild\assets\ChildAssets'
	]
];
