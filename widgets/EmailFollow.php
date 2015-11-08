<?php
namespace widgets;

use \Yii;
use yii\base\Widget;
use yii\base\InvalidConfigException;  

class EmailFollow extends Widget {

	// Variables ---------------------------------------------------

	// Public Variables ------- 
 
 	public $options	= [];

	// Constructor and Initialisation ------------------------------
	
	// yii\base\Object

    public function init() {

        parent::init();
    }

	// Instance Methods --------------------------------------------

	// yii\base\Widget

    public function run() {
		 
        echo $this->renderWidget( $this->options );
    }

	// Nav
	public function renderWidget( $options = [] ) {
		
		$htmlData = '';
		
		$frmAction		= '#';
		$frmClass		= '';
		$frmPlaceholder	= 'Email';
		$frmSubmitValue	= 'Follow';
		$frmBtnClass	= '';
		
		if( isset( $options['action'] ) && $options['action'] != null ) {
				
			$frmAction			= $options['action'];
		}
		
		if( isset( $options['class'] ) && $options['frmClass'] != null ) {
				
			$frmClass			= $options['frmClass'];
		}
		
		if( isset( $options['placeholder'] ) && $options['placeholder'] != null ) {
				
			$frmPlaceholder		= $options['placeholder'];
		}
		
		if( isset( $options['submitValue'] ) && $options['submitValue'] != null ) {
				
			$frmSubmitValue		= $options['submitValue'];
		}
		
		if( isset( $options['btnClass'] ) && $options['btnClass'] != null ) {
				
			$frmBtnClass		= $options['btnClass'];
		}
		 	   		
		return $htmlData	.= '<div class="widget-follow-email">
									<form action="'.$frmAction.'" class="'.$frmClass.'">
									<input type="text" placeholder="'.$frmPlaceholder.'">
									<input type="submit" class="'.$frmBtnClass.'" value="'.$frmSubmitValue.'">
									</form>
								</div>'; 						 
    }
}

?>