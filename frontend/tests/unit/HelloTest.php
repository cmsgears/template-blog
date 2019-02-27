<?php

namespace frontend\tests\unit;

//use common\fixtures\UserFixture;
//use common\models\entities\CashbackActivity;
/**
 * Hello form test
 */
class HelloTest extends \Codeception\Test\Unit
{
	public function testHello(){
		
		expect( "hello", true )->true();
	}
}
