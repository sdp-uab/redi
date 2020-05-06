<?php

/**
 * @file plugins/themes/default/rediThemePlugin.inc.php
 *
 * Copyright (c) 2020 Marc Bria Ramírez (Universitat Autònoma de Barcelona)
 * Copyright (c) 2014-2016 Simon Fraser University Library
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @class rediThemePlugin
 * @ingroup plugins_themes_default
 *
 * @brief ReDi theme
 */
import('lib.pkp.classes.plugins.ThemePlugin');

class rediThemePlugin extends ThemePlugin {
	/**
	 * Initialize the theme's styles, scripts and hooks. This is only run for
	 * the currently active theme.
	 *
	 * @return null
	 */
	public function init() {
		$this->setParent('defaultthemeplugin');

		$this->modifyStyle('stylesheet', array('addLess' => array('styles/rediVariables.less')));

		// DEBUG: print_r($this);

		// Change the ID of this stylesheet slug to `redi`.
		// This ensures that it won't clash with the parent's stylesheet.
		// $this->addStyle('redi', 'styles/header.less');
	}

	/**
	 * Get the display name of this plugin
	 * @return string
	 */
	function getDisplayName() {
		return __('plugins.themes.redi.name');
	}

	/**
	 * Get the description of this plugin
	 * @return string
	 */
	function getDescription() {
		return __('plugins.themes.redi.description');
	}
}

?>
