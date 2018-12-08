<?php

return [
	'components' => [
		'db' => [
			'class' => 'yii\db\Connection',
			'dsn' => 'mysql:host=localhost;dbname=blogdemo',
			'username' => 'blogdemo',
			'password' => 'Bd#lvl*2x*2',
			'charset' => 'utf8'
		],
		'mailer' => [
			'class' => 'yii\swiftmailer\Mailer',
			'viewPath' => '@common/mail'
		]
	]
];
