<?php
// CMG Imports
use cmsgears\core\common\models\entities\Site;
use cmsgears\core\common\models\entities\Template;
use cmsgears\core\common\models\entities\User;
use cmsgears\core\common\models\resources\Form;
use cmsgears\core\common\models\resources\FormField;

use cmsgears\core\common\utilities\DateUtil;

// Blog Imports
use modules\core\common\config\CoreGlobal;

class m200413_031480_forms extends \cmsgears\core\common\base\Migration {

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

		$this->insertForms();
		$this->insertFormFields();

		$this->updateForms();
		$this->updateFormFields();
		$this->updateFormContent();
		$this->updateFormTemplates();

		$this->insertObjectMappings();
	}

	private function insertFiles() {

		$site	= $this->site;
		$master	= $this->master;

		$columns = [ 'id', 'siteId', 'createdBy', 'modifiedBy', 'name', 'code', 'title', 'description', 'extension', 'directory', 'size', 'visibility', 'type', 'storage', 'url', 'medium', 'small', 'thumb', 'placeholder', 'smallPlaceholder', 'ogg', 'webm', 'caption', 'altText', 'link', 'shared', 'srcset', 'sizes', 'createdAt', 'modifiedAt', 'content', 'data', 'gridCache', 'gridCacheValid', 'gridCachedAt' ];

		$files = [
			//[ 108001, $site->id, $master->id, $master->id, 'test', NULL, 'test', '', 'jpg', 'banner', 0.123, 1500, 'image', NULL, '2020-08-11/banner/test.jpg', '2020-08-11/banner/test-medium.jpg', '2020-08-11/banner/test-small.jpg', '2020-08-11/banner/test-thumb.jpg', '2020-08-11/banner/test-pl.jpg', '2020-08-11/banner/test-small-pl.jpg', NULL, NULL, NULL, NULL, NULL, 0, '1920,1152,576', '(max-width: 1920px) 100vw, 1920px', DateUtil::getDateTime(), DateUtil::getDateTime(), NULL, NULL, NULL, 0, NULL ]
		];

		$this->batchInsert( $this->cmgPrefix . 'core_file', $columns, $files );
	}

	private function insertForms() {

		$site	= $this->site;
		$master	= $this->master;

		$vis	= Form::VISIBILITY_PUBLIC;
		$status	= Form::STATUS_ACTIVE;

		$formTemplate = Template::findGlobalBySlugType( 'default', CoreGlobal::TYPE_FORM );

		$columns = [ 'id', 'siteId', 'templateId', 'createdBy', 'modifiedBy', 'name', 'slug', 'type', 'icon', 'title', 'description', 'success', 'captcha', 'visibility', 'status', 'userMail', 'adminMail', 'createdAt', 'modifiedAt', 'content', 'data' ];

		$models = [
			//[ 10001, $site->id, $formTemplate->id, $master->id, $master->id, 'Enquiry', 'enquiry', CoreGlobal::TYPE_FORM, null, null, null, 'Thanks for contacting us.', true, $vis, $status, false, true, DateUtil::getDateTime(), DateUtil::getDateTime(), null, null ]
		];

		$this->batchInsert( $this->cmgPrefix . 'core_form', $columns, $models );

		$summary = null;
		$content = null;

		$columns = [ 'id', 'parentId', 'parentType', 'seoName', 'seoDescription', 'seoKeywords', 'seoRobot', 'summary', 'content', 'publishedAt' ];

		$formsContent = [
			//[ 15001, Form::findBySlugType( 'enquiry', CoreGlobal::TYPE_FORM )->id, CoreGlobal::TYPE_FORM, null, null, null, null, $summary, $content, DateUtil::getDateTime() ]
		];

		$this->batchInsert( $this->cmgPrefix . 'cms_model_content', $columns, $formsContent );
	}

	private function insertFormFields() {

		//$contactForm = Form::findBySlugType( 'contact-us', CoreGlobal::TYPE_FORM );
		//$enquiryForm = Form::findBySlugType( 'enquiry', CoreGlobal::TYPE_FORM );

		$columns = [ 'id', 'formId', 'name', 'label', 'type', 'compress', 'validators', 'order', 'icon', 'htmlOptions' ];

		$fields	= [
			//[ 100001, $enquiryForm->id, 'name', 'Name', FormField::TYPE_TEXT, false, 'required', 0, NULL, '{"field":{placeholder":"Name"}}' ],
			//[ 100002, $enquiryForm->id, 'email', 'Email', FormField::TYPE_TEXT, false, 'required', 0, NULL, '{"field":{placeholder":"Email"}}' ],
			//[ 100003, $enquiryForm->id, 'mobile', 'Mobile Number', FormField::TYPE_INTL_TEL_MOBILE, false, 'required', 0, NULL, '{"field":{placeholder":"Mobile Number"}}' ],
			//[ 100004, $enquiryForm->id, 'message', 'Message', FormField::TYPE_TEXT, false, 'required', 0, NULL, '{"field":{placeholder":"Message"}}' ],
			//[ 100005, $contactForm->id, 'phone', 'Phone Number', FormField::TYPE_INTL_TEL_PHONE, false, NULL, 1, NULL, '{"field":{"placeholder":"Phone Number", "class": "intl-tel-field intl-tel-field-ph"}, "wrapper":{"options":{"class":"form-group col col2"}}}' ]
		];

		$this->batchInsert( $this->cmgPrefix . 'core_form_field', $columns, $fields );
	}

	private function updateForms() {

		$desc = [
			'Contact Form'
		];

		$setting = [
			'{"settings":{"defaultAvatar":"0","lazyAvatar":"0","resAvatar":"0","defaultBanner":"1","lazyBanner":"0","resBanner":"0","fixedBanner":"0","scrollBanner":"0","parallaxBanner":"0","fluidBanner":"0","background":"0","backgroundClass":"","backgroundVideo":null,"texture":"1","header":"1","headerIcon":"0","headerTitle":"1","headerInfo":"0","headerContent":"0","headerIconUrl":"","headerFluid":"0","headerBanner":"1","headerGallery":"0","headerScroller":"0","headerElements":"0","headerElementType":"","content":"1","contentTitle":"0","contentInfo":"0","contentSummary":"0","contentData":"1","maxCover":"0","contentAvatar":"0","contentBanner":"0","contentGallery":"0","contentClass":"","contentDataClass":"","styles":"","scripts":"","footer":"0","footerIcon":"0","footerIconClass":null,"footerIconUrl":"","footerTitle":"0","footerTitleData":"","footerInfo":"0","footerInfoData":"","footerContent":"0","footerContentData":"","footerElements":"0","footerElementType":"","formClass":"","formCaptchaAction":"","wrapCaptcha":"1","wrapActions":"1","labels":"1","split4060":"0","elements":"0","elementsBeforeContent":"0","elementsWithContent":"0","elementsOrder":"","elementType":"","boxWrapClass":"","boxWrapper":"","boxClass":"","widgets":"0","widgetsBeforeContent":"0","widgetsWithContent":"0","widgetsOrder":"","widgetType":"","widgetWrapClass":"","widgetWrapper":"","widgetClass":"","blocks":"1","blocksBeforeContent":"0","blocksWithContent":"0","blocksOrder":"","blockType":"","sidebars":"0","sidebarsBeforeContent":"0","sidebarsWithContent":"0","sidebarsOrder":"","sidebarType":"","topSidebar":"0","topSidebarSlugs":"","bottomSidebar":"0","bottomSidebarSlugs":"","leftSidebar":"0","leftSidebarSlug":"","rightSidebar":"0","rightSidebarSlug":"","footerSidebar":null,"footerSidebarSlug":null,"purifySummary":"1","purifyContent":"1","amp":"0","ampGoogleScripts":"","ampScriptUrl":"","ampStylePath":"","ampSchema":"","ampMetas":""}}'
		];

		$options = [
			'{ "class": "row max-cols-100" }'
		];

		// Contact Form
		$contactForm = Form::findBySlugType( 'contact-us', 'form' );

		// Update Form
		$this->update( $this->cmgPrefix . 'core_form', [ 'texture' => 'texture texture-black', 'title' => 'Contact Us', 'description' => $desc[ 0 ], 'data' => $setting[ 0 ], 'htmlOptions' => $options[ 0 ] ], [ 'id' => $contactForm->id ] );
	}

	private function updateFormFields() {

		// Contact Form
		$contactForm = Form::findBySlugType( 'contact-us', 'form' );

		// Update Form Fields
		$this->update( $this->cmgPrefix . 'core_form_field', [ 'htmlOptions' => '{"field":{"placeholder":"Name"}, "wrapper":{"options":{"class":"form-group col col2"}}}' ], [ 'formId' => $contactForm->id, 'name' => 'name' ] );
		$this->update( $this->cmgPrefix . 'core_form_field', [ 'htmlOptions' => '{"field":{"placeholder":"Email"}, "wrapper":{"options":{"class":"form-group col col2"}}}' ], [ 'formId' => $contactForm->id, 'name' => 'email' ] );
		$this->update( $this->cmgPrefix . 'core_form_field', [ 'htmlOptions' => '{"field":{"placeholder":"Subject"}, "wrapper":{"options":{"class":"form-group col col1"}}}' ], [ 'formId' => $contactForm->id, 'name' => 'subject' ] );
		$this->update( $this->cmgPrefix . 'core_form_field', [ 'htmlOptions' => '{"field":{"placeholder":"Message"}, "wrapper":{"options":{"class":"form-group col col1"}}}' ], [ 'formId' => $contactForm->id, 'name' => 'message' ] );
	}

	private function updateFormContent() {

		$summary = [
			'Contact Us',
			'Enquire Us'
		];

		$seo = [
			[ 'Contact Us', 'Contact Us to know more about us and for queries and clarifications.', 'Site, Contact' ],
			//[ 'Enquire Us', 'Enquire Us to for any queries and clarifications.', 'Site, Contact' ]
		];

		$content = [
			null,
			null
		];

		$contactForm = Form::findBySlugType( 'contact-us', 'form' );
		//$enquiryForm = Form::findBySlugType( 'enquiry', 'form' );

		$this->update( $this->cmgPrefix . 'cms_model_content', [ 'bannerId' => null, 'summary' => $summary[ 0 ], 'seoName' => $seo[ 0 ][ 0 ], 'seoDescription' => $seo[ 0 ][ 1 ], 'seoKeywords' => $seo[ 0 ][ 2 ], 'content' => $content[ 0 ] ], [ 'parentId' => $contactForm->id, 'parentType' => 'form' ] );
		//$this->update( $this->cmgPrefix . 'cms_model_content', [ 'bannerId' => null, 'summary' => $summary[ 1 ], 'seoName' => $seo[ 1 ][ 1 ], 'seoDescription' => $seo[ 1 ][ 1 ], 'seoKeywords' => $seo[ 1 ][ 2 ], 'content' => $content[ 1 ] ], [ 'parentId' => $enquiryForm->id, 'parentType' => 'form' ] );
	}

	private function updateFormTemplates() {

		// Update Template View
		//$this->update( $this->cmgPrefix . 'core_template', [ 'viewPath' => 'views/templates/form/contact' ], [ 'slug' => 'contact', 'type' => 'form' ] );
	}

	private function insertObjectMappings() {

		// Contact Form
		$contactForm = Form::findBySlugType( 'contact-us', 'form' );

		$columns = [ 'id', 'modelId', 'parentId', 'parentType', 'type', 'order', 'active', 'pinned', 'featured', 'popular', 'nodes' ];

		$mappings = [
			//[ 170001, 10089, $contactForm->id, 'form', 'block', 0, 1, 0, 0, 0, NULL ]
		];

		$this->batchInsert( $this->cmgPrefix . 'core_model_object', $columns, $mappings );
	}

	public function down() {

		echo "m200413_031480_forms will be deleted with m160621_014408_core.\n";
	}

}
