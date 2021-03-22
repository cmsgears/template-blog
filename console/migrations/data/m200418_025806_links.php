<?php
// CMG Imports
use cmsgears\cms\common\config\CmsGlobal;

use cmsgears\core\common\models\entities\Site;
use cmsgears\core\common\models\entities\User;
use cmsgears\cms\common\models\entities\Menu;
use cmsgears\cms\common\models\entities\Page;
use cmsgears\cms\common\models\resources\Link;
use cmsgears\cms\common\models\mappers\ModelLink;

use cmsgears\core\common\utilities\DateUtil;

// Blog Imports
use modules\core\common\config\CoreGlobal;

class m200418_025806_links extends \cmsgears\core\common\base\Migration {

	// Public Variables

	// Private Variables

	private $cmgPrefix;
	private $sitePrefix;

	private $site;

	private $master;

	public function init() {

		// Table prefix
		$this->cmgPrefix	= Yii::$app->migration->cmgPrefix;
		$this->sitePrefix	= Yii::$app->migration->sitePrefix;

		$this->site		= Site::findBySlug( CoreGlobal::SITE_MAIN );
		$this->master	= User::findByUsername( Yii::$app->migration->getSiteMaster() );

		Yii::$app->core->setSite( $this->site );
	}

	public function up() {

		$this->insertLinks();

		$this->insertLinkMappings();
	}

	private function insertLinks() {

		$site	= $this->site;
		$master	= $this->master;

		// Pages
		//$newsPage = Page::findBySlugType( 'news', CmsGlobal::TYPE_PAGE );

		$columns = [ 'id', 'siteId', 'pageId', 'createdBy', 'modifiedBy', 'name', 'title', 'url', 'type', 'icon', 'order', 'absolute', 'private', 'createdAt', 'modifiedAt', 'htmlOptions', 'urlOptions', 'data' ];

		$links = [
			//[ 10001, $site->id, $newsPage->id, $master->id, $master->id, 'News', NULL, NULL, 'site', NULL, 0, 1, 0, DateUtil::getDateTime(), DateUtil::getDateTime(), NULL, NULL, NULL ],
			//[ 10002, $site->id, NULL, $master->id, $master->id, 'Facebook', NULL, 'https://www.facebook.com', 'site', 'icon fab fa-facebook-square', 0, 1, 0, DateUtil::getDateTime(), DateUtil::getDateTime(), NULL, NULL, NULL ]
		];

		$this->batchInsert( $this->cmgPrefix . 'cms_link', $columns, $links );
	}

	private function insertLinkMappings() {

		$site	= $this->site;
		$master	= $this->master;

		$mainMenu	= Menu::findBySlugType( 'main', CmsGlobal::TYPE_MENU );
		$secMenu	= Menu::findBySlugType( 'secondary', CmsGlobal::TYPE_MENU );
		$linksMenu	= Menu::findBySlugType( 'links', CmsGlobal::TYPE_MENU );
		$pagesMenu	= Menu::findBySlugType( 'pages', CmsGlobal::TYPE_MENU );
		$socialMenu	= Menu::findBySlugType( 'social', CmsGlobal::TYPE_MENU );

		$homeLink		= Link::findFirstByName( 'Home' );
		$loginLink		= Link::findFirstByName( 'Login' );
		$registerLink	= Link::findFirstByName( 'Register' );
		$aboutLink		= Link::findFirstByName( 'About' );
		$helpLink		= Link::findFirstByName( 'Help' );
		$termsLink		= Link::findFirstByName( 'Terms' );
		$privacyLink	= Link::findFirstByName( 'Privacy' );
		$contactLink	= Link::findFirstByName( 'Contact Us' );
		$feedbackLink	= Link::findFirstByName( 'Feedback' );
		$testiLink		= Link::findFirstByName( 'Testimonial' );
		$faqsLink		= Link::findFirstByName( 'FAQs' );
		$blogLink		= Link::findFirstByName( 'Blog' );
		$articlesLink	= Link::findFirstByName( 'Articles' );

		ModelLink::deleteByParent( $mainMenu->id, CmsGlobal::TYPE_MENU );
		ModelLink::deleteByParent( $secMenu->id, CmsGlobal::TYPE_MENU );
		ModelLink::deleteByParent( $linksMenu->id, CmsGlobal::TYPE_MENU );
		ModelLink::deleteByParent( $pagesMenu->id, CmsGlobal::TYPE_MENU );
		ModelLink::deleteByParent( $socialMenu->id, CmsGlobal::TYPE_MENU );

		$columns = [ 'id', 'modelId', 'parentId', 'parentType', 'type', 'order', 'active' ];

		$mappings = [
			[ 100001, $homeLink->id, $mainMenu->id, 'menu', NULL, 0, 1 ],
			[ 100002, $aboutLink->id, $mainMenu->id, 'menu', NULL, 0, 1 ],
			[ 100003, $helpLink->id, $mainMenu->id, 'menu', NULL, 0, 1 ],
			[ 100004, $termsLink->id, $mainMenu->id, 'menu', NULL, 0, 1 ],
			[ 100005, $homeLink->id, $secMenu->id, 'menu', NULL, 0, 1 ],
			[ 100006, $aboutLink->id, $secMenu->id, 'menu', NULL, 0, 1 ],
			[ 100007, $helpLink->id, $secMenu->id, 'menu', NULL, 0, 1 ],
			[ 100008, $faqsLink->id, $secMenu->id, 'menu', NULL, 0, 1 ],
			[ 100009, $privacyLink->id, $linksMenu->id, 'menu', NULL, 0, 1 ],
			[ 100010, $contactLink->id, $linksMenu->id, 'menu', NULL, 0, 1 ],
			[ 100011, $feedbackLink->id, $linksMenu->id, 'menu', NULL, 0, 1 ],
			[ 100012, $testiLink->id, $linksMenu->id, 'menu', NULL, 0, 1 ]
		];

		$this->batchInsert( $this->cmgPrefix . 'cms_model_link', $columns, $mappings );
	}

	public function down() {

		echo "m200418_025806_links will be deleted with m160621_014408_core.\n";
	}

}
