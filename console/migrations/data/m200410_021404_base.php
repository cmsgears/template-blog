<?php
// CMG Imports
use cmsgears\core\common\models\entities\Site;
use cmsgears\core\common\models\entities\User;

// Basic Imports
use modules\core\common\config\CoreGlobal;

class m200410_021404_base extends \cmsgears\core\common\base\Migration {

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

		$this->updateSiteMeta();
	}

	private function updateSiteMeta() {

		$site = $this->site;

		$this->update( $this->cmgPrefix . 'core_site_meta', [ 'value' => 'UTC' ], [ 'modelId' => $site->id, 'name' => 'timezone', 'type' => 'core' ] );

		$this->update( $this->cmgPrefix . 'core_site_meta', [ 'value' => 0 ], [ 'modelId' => $site->id, 'name' => 'change_email', 'type' => 'core' ] );
		$this->update( $this->cmgPrefix . 'core_site_meta', [ 'value' => 0 ], [ 'modelId' => $site->id, 'name' => 'change_username', 'type' => 'core' ] );

		$this->update( $this->cmgPrefix . 'core_site_meta', [ 'value' => 0 ], [ 'modelId' => $site->id, 'name' => 'generate_name', 'type' => 'file' ] );
		$this->update( $this->cmgPrefix . 'core_site_meta', [ 'value' => 1 ], [ 'modelId' => $site->id, 'name' => 'pretty_name', 'type' => 'file' ] );

		$this->update( $this->cmgPrefix . 'core_site_meta', [ 'value' => 'Blog Demo' ], [ 'modelId' => $site->id, 'name' => 'author', 'type' => 'facebook-meta' ] );
		$this->update( $this->cmgPrefix . 'core_site_meta', [ 'value' => null ], [ 'modelId' => $site->id, 'name' => 'app_id', 'type' => 'facebook-meta' ] );

		$this->update( $this->cmgPrefix . 'core_site_meta', [ 'value' => null ], [ 'modelId' => $site->id, 'name' => 'site', 'type' => 'twitter-meta' ] );
		$this->update( $this->cmgPrefix . 'core_site_meta', [ 'value' => null ], [ 'modelId' => $site->id, 'name' => 'creator', 'type' => 'twitter-meta' ] );

		$this->update( $this->cmgPrefix . 'core_site_meta', [ 'value' => 0 ], [ 'modelId' => $site->id, 'name' => 'active', 'type' => 'google-maps' ] );
		$this->update( $this->cmgPrefix . 'core_site_meta', [ 'value' => null ], [ 'modelId' => $site->id, 'name' => 'key', 'type' => 'google-maps' ] );

		$this->update( $this->cmgPrefix . 'core_site_meta', [ 'value' => 1 ], [ 'modelId' => $site->id, 'name' => 'comments_labels', 'type' => 'comment' ] );
		$this->update( $this->cmgPrefix . 'core_site_meta', [ 'value' => null ], [ 'modelId' => $site->id, 'name' => 'comments_disqus_forum', 'type' => 'comment' ] );

		$this->update( $this->cmgPrefix . 'core_site_meta', [ 'value' => '|' ], [ 'modelId' => $site->id, 'name' => 'title_separator', 'type' => 'blog' ] );

		$site->description = 'Blog Demo';

		$site->update();
	}

	public function down() {

		echo "m180502_112711_base will be deleted with m160621_014408_core.\n";
	}

}
