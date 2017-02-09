<?php

$config = yii\helpers\ArrayHelper::merge(
	require( __DIR__ . '/main.php' ),
	require( __DIR__ . '/main-env.php' ),
	require( __DIR__ . '/test.php' ),
	[
		'components' => [
			'db' => [
				'class' => 'yii\db\Connection',
				'dsn' => 'mysql:host=localhost;dbname=cmgdemoblog',
				'username' => 'cmgdemoblog',
				'password' => 'Cmg#Blog*6',
				'charset' => 'utf8'
			]
		]
	]
);

return $config;