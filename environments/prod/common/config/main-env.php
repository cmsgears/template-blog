<?php

return [
	'components' => [
		'db' => [
			'class' => 'yii\db\Connection',
			'dsn' => 'mysql:host=localhost;dbname=blogdemo',
			'username' => 'blogdemo',
			'password' => 'Bd#lvl*2x*2',
			'charset' => 'utf8',
			// Cache schema specific queries
			// The cache in backend/frontend runtime can be cleaned in case it's enabled and DB is changed
			'enableSchemaCache' => true,
			'schemaCache' => 'cache',
			'schemaCacheDuration' => 86400
		],
		'mailer' => [
			'class' => 'yii\swiftmailer\Mailer',
			'viewPath' => '@common/mail'
		]
	]
];
