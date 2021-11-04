<?php
// CMG Imports
use cmsgears\cms\common\config\CmsGlobal;

use cmsgears\core\common\models\entities\ObjectData;
use cmsgears\core\common\models\entities\Site;
use cmsgears\core\common\models\entities\Template;
use cmsgears\core\common\models\entities\User;
use cmsgears\core\common\models\mappers\ModelObject;

use cmsgears\cms\common\models\entities\Block;
use cmsgears\cms\common\models\entities\Sidebar;
use cmsgears\cms\common\models\entities\Widget;

use cmsgears\core\common\utilities\DateUtil;

// Blog Imports
use modules\core\common\config\CoreGlobal;

class m200411_046641_objects extends \cmsgears\core\common\base\Migration {

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

		$this->insertFiles();

		$this->insertMenus();

		$this->insertElements();
		$this->insertWidgets();
		$this->insertBlocks();
		$this->insertSidebars();

		$this->insertMappings();

		$this->updateWidgetTemplates();
		$this->updateWidgets();

		$this->updateBlockTemplates();
		$this->updateBlocks();

		$this->updateElements();
	}

	private function insertFiles() {

		$site	= $this->site;
		$master	= $this->master;

		$columns = [ 'id', 'siteId', 'createdBy', 'modifiedBy', 'name', 'code', 'title', 'description', 'extension', 'directory', 'size', 'visibility', 'type', 'storage', 'url', 'medium', 'small', 'thumb', 'placeholder', 'smallPlaceholder', 'ogg', 'webm', 'caption', 'altText', 'link', 'shared', 'srcset', 'sizes', 'createdAt', 'modifiedAt', 'content', 'data', 'gridCache', 'gridCacheValid', 'gridCachedAt' ];

		$files = [
			//[ 104001, $site->id, $master->id, $master->id, 'test', NULL, 'test', '', 'jpg', 'banner', 0.123, 1500, 'image', NULL, '2020-08-11/banner/test.jpg', '2020-08-11/banner/test-medium.jpg', '2020-08-11/banner/test-small.jpg', '2020-08-11/banner/test-thumb.jpg', '2020-08-11/banner/test-pl.jpg', '2020-08-11/banner/test-small-pl.jpg', NULL, NULL, NULL, NULL, NULL, 0, '1920,1152,576', '(max-width: 1920px) 100vw, 1920px', DateUtil::getDateTime(), DateUtil::getDateTime(), NULL, NULL, NULL, 0, NULL ]
		];

		$this->batchInsert( $this->cmgPrefix . 'core_file', $columns, $files );
	}

	private function insertMenus() {

		$site	= $this->site;
		$master	= $this->master;

		$status	= ObjectData::STATUS_ACTIVE;
		$vis	= ObjectData::VISIBILITY_PUBLIC;

		$columns = [ 'id', 'siteId', 'themeId', 'templateId', 'parentId', 'avatarId', 'bannerId', 'videoId', 'galleryId', 'createdBy', 'modifiedBy', 'name', 'slug', 'type', 'icon', 'texture', 'title', 'description', 'classPath', 'link', 'status', 'visibility', 'order', 'pinned', 'featured', 'popular', 'shared', 'createdAt', 'modifiedAt', 'htmlOptions', 'summary', 'content', 'data', 'gridCache', 'gridCacheValid', 'gridCachedAt' ];

		$models = [
			//[ 8001, $site->id, NULL, NULL, NULL, NULL ,NULL, NULL, NULL, $master->id, $master->id, 'Test 1', 'test-1', CmsGlobal::TYPE_MENU, NULL, NULL, NULL, 'Test 1', NULL, NULL, $status, $vis, 0, 0, 0, 0, 1, DateUtil::getDateTime(), DateUtil::getDateTime(), NULL, NULL, NULL, NULL, NULL, 0, NULL ]
		];

		$this->batchInsert( $this->cmgPrefix . 'core_object', $columns, $models );
	}

	private function insertElements() {

		$site	= $this->site;
		$master	= $this->master;

		// Templates
		$cardElement	= Template::findGlobalBySlugType( 'card', CmsGlobal::TYPE_ELEMENT );
		$boxElement		= Template::findGlobalBySlugType( 'box', CmsGlobal::TYPE_ELEMENT );

		$status	= ObjectData::STATUS_ACTIVE;
		$vis	= ObjectData::VISIBILITY_PUBLIC;

		$columns = [ 'id', 'siteId', 'themeId', 'templateId', 'parentId', 'avatarId', 'bannerId', 'videoId', 'galleryId', 'createdBy', 'modifiedBy', 'name', 'slug', 'type', 'icon', 'texture', 'title', 'description', 'classPath', 'viewPath', 'link', 'status', 'visibility', 'order', 'pinned', 'featured', 'popular', 'shared', 'createdAt', 'modifiedAt', 'htmlOptions', 'summary', 'content', 'data', 'gridCache', 'gridCacheValid', 'gridCachedAt' ];

		$models = [
			//[ 10001, $site->id, NULL, NULL, NULL, 104001, NULL, NULL, NULL, $master->id, $master->id, 'Test 1', 'test-1', CmsGlobal::TYPE_ELEMENT, 'icon', 'texture', NULL, NULL, NULL, NULL, NULL, $status, $vis, 0, 0, 0, 0, 1, DateUtil::getDateTime(), DateUtil::getDateTime(), '{ "class": "box box-info-footer" }', NULL, NULL, NULL, NULL, 0, NULL ]
		];

		$this->batchInsert( $this->cmgPrefix . 'core_object', $columns, $models );

		$columns = [ 'id', 'modelId', 'name', 'label', 'type', 'active', 'order', 'valueType', 'value', 'data' ];

		$metas = [
			//[ 100001, 10001, 'facebook', 'Facebook', 'social', 1, 0, 'text', 'https://www.facebook.com/site', NULL ],
			//[ 100002, 10001, 'twitter', 'Twitter', 'social', 1, 0, 'text', 'https://twitter.com/site', NULL ]
		];

		$this->batchInsert( $this->cmgPrefix . 'core_object_meta', $columns, $metas );
	}

	private function insertWidgets() {

		$site	= $this->site;
		$master	= $this->master;

		// Templates
		$defaultWidget = Template::findGlobalBySlugType( 'default', CmsGlobal::TYPE_WIDGET );

		$status	= ObjectData::STATUS_ACTIVE;
		$vis	= ObjectData::VISIBILITY_PUBLIC;

		$columns = [ 'id', 'siteId', 'themeId', 'templateId', 'parentId', 'avatarId', 'bannerId', 'videoId', 'galleryId', 'createdBy', 'modifiedBy', 'name', 'slug', 'type', 'icon', 'texture', 'title', 'description', 'classPath', 'viewPath', 'link', 'status', 'visibility', 'order', 'pinned', 'featured', 'popular', 'shared', 'createdAt', 'modifiedAt', 'htmlOptions', 'summary', 'content', 'data', 'gridCache', 'gridCacheValid', 'gridCachedAt' ];

		$models = [
			//[ 11001, $site->id, NULL, NULL, NULL, 104001, NULL, NULL, NULL, $master->id, $master->id, 'Test 1', 'test-1', CmsGlobal::TYPE_WIDGET, 'icon', 'texture', NULL, NULL, NULL, NULL, NULL, $status, $vis, 0, 0, 0, 0, 1, DateUtil::getDateTime(), DateUtil::getDateTime(), '{ "class": "box box-info-footer" }', 'Test 1.', NULL, NULL, NULL, 0, NULL ]
		];

		$this->batchInsert( $this->cmgPrefix . 'core_object', $columns, $models );
	}

	private function insertBlocks() {

		$site	= $this->site;
		$master	= $this->master;

		// Templates
		$defaultBlock	= Template::findGlobalBySlugType( 'default', CmsGlobal::TYPE_BLOCK );
		$fxsBlock		= Template::findGlobalBySlugType( 'foxslider', CmsGlobal::TYPE_BLOCK );
		$testiBlock		= Template::findGlobalBySlugType( 'testimonial', CmsGlobal::TYPE_BLOCK );

		$status	= ObjectData::STATUS_ACTIVE;
		$vis	= ObjectData::VISIBILITY_PUBLIC;

		$columns = [ 'id', 'siteId', 'themeId', 'templateId', 'parentId', 'avatarId', 'bannerId', 'videoId', 'galleryId', 'createdBy', 'modifiedBy', 'name', 'slug', 'type', 'icon', 'texture', 'title', 'description', 'classPath', 'viewPath', 'link', 'status', 'visibility', 'order', 'pinned', 'featured', 'popular', 'shared', 'createdAt', 'modifiedAt', 'htmlOptions', 'summary', 'content', 'data', 'gridCache', 'gridCacheValid', 'gridCachedAt' ];

		$models = [
			//[ 12001, $site->id, NULL, NULL, NULL, 104001, NULL, NULL, NULL, $master->id, $master->id, 'Test 1', 'test-1', CmsGlobal::TYPE_BLOCK, 'icon', 'texture', NULL, NULL, NULL, NULL, NULL, $status, $vis, 0, 0, 0, 0, 1, DateUtil::getDateTime(), DateUtil::getDateTime(), '{ "class": "box box-info-footer" }', 'Test 1.', NULL, NULL, NULL, 0, NULL ]
		];

		$this->batchInsert( $this->cmgPrefix . 'core_object', $columns, $models );
	}

	private function insertSidebars() {

		$site	= $this->site;
		$master	= $this->master;

		// Templates
		$defaultSidebar	= Template::findGlobalBySlugType( 'default', CmsGlobal::TYPE_SIDEBAR );
		$vertSidebar	= Template::findGlobalBySlugType( 'vsidebar', CmsGlobal::TYPE_SIDEBAR );
		$horizSidebar	= Template::findGlobalBySlugType( 'hsidebar', CmsGlobal::TYPE_SIDEBAR );

		$status	= ObjectData::STATUS_ACTIVE;
		$vis	= ObjectData::VISIBILITY_PUBLIC;

		$columns = [ 'id', 'siteId', 'themeId', 'templateId', 'parentId', 'avatarId', 'bannerId', 'videoId', 'galleryId', 'createdBy', 'modifiedBy', 'name', 'slug', 'type', 'icon', 'texture', 'title', 'description', 'classPath', 'viewPath', 'link', 'status', 'visibility', 'order', 'pinned', 'featured', 'popular', 'shared', 'createdAt', 'modifiedAt', 'htmlOptions', 'summary', 'content', 'data', 'gridCache', 'gridCacheValid', 'gridCachedAt' ];

		$models = [
			//[ 13001, $site->id, NULL, NULL, NULL, 104001, NULL, NULL, NULL, $master->id, $master->id, 'Test 1', 'test-1', CmsGlobal::TYPE_SIDEBAR, 'icon', 'texture', NULL, NULL, NULL, NULL, NULL, $status, $vis, 0, 0, 0, 0, 1, DateUtil::getDateTime(), DateUtil::getDateTime(), '{ "class": "box box-info-footer" }', 'Test 1.', NULL, NULL, NULL, 0, NULL ]
		];

		$this->batchInsert( $this->cmgPrefix . 'core_object', $columns, $models );
	}

	private function insertMappings() {

		$mainSidebar	= Sidebar::findBySlugType( 'main-right', CmsGlobal::TYPE_SIDEBAR );
		$pgrSidebar		= Sidebar::findBySlugType( 'page-right', CmsGlobal::TYPE_SIDEBAR );
		$psrSidebar		= Sidebar::findBySlugType( 'post-right', CmsGlobal::TYPE_SIDEBAR );
		$psbSidebar		= Sidebar::findBySlugType( 'post-bottom', CmsGlobal::TYPE_SIDEBAR );
		$pssrSidebar	= Sidebar::findBySlugType( 'post-search-right', CmsGlobal::TYPE_SIDEBAR );
		$pscrSidebar	= Sidebar::findBySlugType( 'post-category-right', CmsGlobal::TYPE_SIDEBAR );
		$pscbSidebar	= Sidebar::findBySlugType( 'post-category-bottom', CmsGlobal::TYPE_SIDEBAR );
		$pstrSidebar	= Sidebar::findBySlugType( 'post-tag-right', CmsGlobal::TYPE_SIDEBAR );
		$pstbSidebar	= Sidebar::findBySlugType( 'post-tag-bottom', CmsGlobal::TYPE_SIDEBAR );
		$frmrSidebar	= Sidebar::findBySlugType( 'form-right', CmsGlobal::TYPE_SIDEBAR );

		$pscWidget	= Widget::findBySlugType( 'post-categories', CmsGlobal::TYPE_WIDGET );
		$psfWidget	= Widget::findBySlugType( 'featured-site-posts', CmsGlobal::TYPE_WIDGET );
		$pspWidget	= Widget::findBySlugType( 'popular-site-posts', CmsGlobal::TYPE_WIDGET );
		$psrWidget	= Widget::findBySlugType( 'recent-site-posts', CmsGlobal::TYPE_WIDGET );

		$nlWidget	= Widget::findBySlugType( 'newsletter', CmsGlobal::TYPE_WIDGET );

		ModelObject::deleteByParent( $pgrSidebar->id, CmsGlobal::TYPE_SIDEBAR );

		$columns = [ 'id', 'modelId', 'parentId', 'parentType', 'type', 'order', 'active', 'pinned', 'featured', 'popular', 'nodes' ];

		$mappings = [
			[ 100001, $pspWidget->id, $mainSidebar->id, 'sidebar', 'widget', 0, 1, 0, 0, 0, NULL ],
			[ 100011, $psrWidget->id, $pgrSidebar->id, 'sidebar', 'widget', 0, 1, 0, 0, 0, NULL ],
			[ 100021, $psrWidget->id, $psrSidebar->id, 'sidebar', 'widget', 0, 1, 0, 0, 0, NULL ],
			[ 100031, $pspWidget->id, $frmrSidebar->id, 'sidebar', 'widget', 0, 1, 0, 0, 0, NULL ],
			[ 100041, $psrWidget->id, $frmrSidebar->id, 'sidebar', 'widget', 0, 1, 0, 0, 0, NULL ]
		];

		$this->batchInsert( $this->cmgPrefix . 'core_model_object', $columns, $mappings );
	}

	private function updateWidgetTemplates() {

		//$postCardTemplate	= Template::findGlobalBySlugType( 'post-card', CmsGlobal::TYPE_WIDGET );
		//$postBoxTemplate	= Template::findGlobalBySlugType( 'post-box', CmsGlobal::TYPE_WIDGET );
		//$postSearchTemplate	= Template::findGlobalBySlugType( 'post-search', CmsGlobal::TYPE_WIDGET );
		//$newsletterTemplate	= Template::findGlobalBySlugType( 'newsletter', CmsGlobal::TYPE_WIDGET );

		//$this->update( $this->cmgPrefix . 'core_template', [ 'viewPath' => '@themeTemplates/widget/post' ], "id=$postCardTemplate->id" );
		//$this->update( $this->cmgPrefix . 'core_template', [ 'viewPath' => '@themeTemplates/widget/post' ], "id=$postBoxTemplate->id" );
		//$this->update( $this->cmgPrefix . 'core_template', [ 'viewPath' => '@themeTemplates/widget/post' ], "id=$postSearchTemplate->id" );
		//$this->update( $this->cmgPrefix . 'core_template', [ 'viewPath' => '@themeTemplates/widget/newsletter' ], "id=$newsletterTemplate->id" );

		//$this->update( $this->cmgPrefix . 'core_template', [ 'viewPath' => '@themeTemplates/widget/model', 'view' => 'card' ], "slug IN ('page-card', 'post-card', 'article-card')" );
	}

	private function updateWidgets() {

		$settings = [
			//'{"settings":{"defaultAvatar":"0","defaultBanner":"0","bkg":"0","bkgClass":"","texture":"0","header":"0","headerIcon":"0","headerTitle":"0","headerIconUrl":"","content":"1","contentTitle":"0","contentInfo":"0","contentSummary":"0","contentData":"0","contentClass":"","contentDataClass":"","styles":"","metas":"0","metaType":"","metaWrapClass":""},"config":{"route":"","allPath":"all","singlePath":"single","wrapperOptions":"{ \"class\": \"box-home-wrap\" }","singleOptions":"{ \"class\": \"box box-default box-home\" }","excludeParams":"{\"params\": [ \"slug\" ] }","widget":"recent","texture":"","defaultBanner":"0","authorParam":"0","categoryParam":"0","tagParam":"0","wrap":"1","options":"{ \"class\": \"widget-basic widget-box-home widget-box-home-post\" }","wrapSingle":"1","singleWrapper":"div","basePath":"","showAllPath":"0","pagination":"1","paging":"1","nextLabel":"&raquo;","prevLabel":"&laquo;","limit":"10","ajaxPagination":"0","ajaxPageApp":"pagination","ajaxPageController":"page","ajaxPageAction":"getPage","ajaxUrl":"","textLimit":"250","excludeMain":"0","siteModels":"0","wrapper":"div","loadAssets":"0","templateDir":null,"template":"default","factory":true,"cache":false,"cacheDb":false,"cacheFile":false,"autoload":"0","autoloadTemplate":"autoload","autoloadApp":"autoload","autoloadController":"autoload","autoloadAction":"autoload","autoloadUrl":""}}'
		];

		//$this->update( $this->cmgPrefix . 'core_object', [ 'data' => $settings[ 0 ] ], [ 'slug' => 'home-posts', 'type' => 'widget' ] );
	}

	private function updateBlockTemplates() {

		//$defaultTemplate = Template::findGlobalBySlugType( 'default', CmsGlobal::TYPE_BLOCK );

		//$this->update( $this->cmgPrefix . 'core_template', [ 'viewPath' => '@themeTemplates/block/default' ], "id=$defaultTemplate->id" );

		//$textTemplate = Template::findGlobalBySlugType( 'text', CmsGlobal::TYPE_BLOCK );

		//$this->update( $this->cmgPrefix . 'core_template', [ 'viewPath' => '@themeTemplates/block/text' ], "id=$textTemplate->id" );

		//$newsletterTemplate	= Template::findGlobalBySlugType( 'newsletter', CmsGlobal::TYPE_BLOCK );

		//$this->update( $this->cmgPrefix . 'core_template', [ 'viewPath' => '@themeTemplates/block/newsletter' ], "id=$newsletterTemplate->id" );
	}

	private function updateBlocks() {

		//$this->update( $this->cmgPrefix . 'core_object', [ 'templateId' => $multisite->id ], [ 'slug' => 'multisite-posts', 'type' => 'block' ] );
	}

	private function updateElements() {

		$content = [
			'Intro'
		];

		$settings = [
			'{"settings":{"defaultAvatar":"0","lazyAvatar":"0","resAvatar":"0","defaultBanner":"0","lazyBanner":"0","resBanner":"0","bkg":"0","bkgClass":"","bkgVideo":"0","texture":"0","header":"0","headerIcon":"0","headerTitle":"0","headerInfo":"0","headerContent":"0","headerIconUrl":"","content":"1","contentTitle":"0","contentInfo":"0","contentSummary":"0","contentData":"1","contentRaw":"","maxCover":"0","contentClass":"reader margin margin-small-v","contentDataClass":"","styles":"","scripts":"","footer":"0","footerIcon":"0","footerIconClass":null,"footerIconUrl":"","footerTitle":"0","footerTitleData":"","footerInfo":"0","footerInfoData":"","footerContent":"0","footerContentData":"","metas":"0","metaTypes":"","metaWrapClass":"","purifySummary":"1","purifyContent":"1"}}'
		];

		//$this->update( $this->cmgPrefix . 'core_object', [ 'content' => $content[ 0 ], 'data' => $settings[ 0 ] ], [ 'slug' => 'intro', 'type' => CmsGlobal::TYPE_ELEMENT ] );
	}

	public function down() {

		echo "m200411_046641_objects will be deleted with m160621_014408_core.\n";
	}

}
