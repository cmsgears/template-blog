<?php

return [
	'components' => [
		'db' => [
			'class' => 'yii\db\Connection',
			'dsn' => 'mysql:host=localhost;dbname=blogdemo',
			'username' => 'blogdemo',
			'password' => 'Bd#1xAl*25',
			'charset' => 'utf8',
			// Cache schema specific queries
			// Disable it while doing DB designing
			// The cache in backend/frontend runtime can be cleaned in case it's enabled and DB is changed
			'enableSchemaCache' => true,
			'schemaCache' => 'cache',
			'schemaCacheDuration' => 86400
		],
		'mailer' => [
			'class' => 'yii\swiftmailer\Mailer',
			'viewPath' => '@common/mail',
			'useFileTransport' => true
		]
	]
];
