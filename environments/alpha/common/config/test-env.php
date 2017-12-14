<?php
return yii\helpers\ArrayHelper::merge(
	require( __DIR__ . '/main.php' ),
	require( __DIR__ . '/main-env.php' ),
	require( __DIR__ . '/test.php' ),
	[
		'components' => [
			'db' => [
				'class' => 'yii\db\Connection',
				'dsn' => 'mysql:host=localhost;dbname=blogdemotest',
				'username' => 'blogdemo',
				'password' => 'Demo#Blog*6',
				'charset' => 'utf8'
			],
		]
	]
);