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

		// Remove the typography options of the parent theme
		// and also dequeue any parent's fonts.
		// `removeOption` was introduced in OJS 3.0.2
		if (method_exists($this, 'removeOption')) {
			$this->removeOption('typography');

			$this->removeStyle('fontNotoSans');
			$this->removeStyle('fontNotoSerif');
			$this->removeStyle('fontNotoSansNotoSerif');
			$this->removeStyle('fontLato');
			$this->removeStyle('fontLora');
			$this->removeStyle('fontLoraOpenSans');
		}

		// Add the option for an hover color
		$this->addOption('hoverColour', 'FieldColor', [
			'label' => __('plugins.themes.redi.color.hover.label'),
			'description' => __('plugins.themes.redi.color.hover.description'),
			'default' => '#F7BC4A',
		]);

		// Start with a fresh array of additionalLessVariables so that we can
		// ignore those added by the parent theme. This gets rid of @font
		// variable overrides from the typography option
		$additionalLessVariables = array();

		// Update colour based on theme option from parent theme
		if ($this->getOption('baseColour') !== '#1E6292') {
			$additionalLessVariables[] = '@bg-base:' . $this->getOption('baseColour') . ';';
			if (!$this->isColourDark($this->getOption('baseColour'))) {
				$additionalLessVariables[] = '@text-bg-base:rgba(0,0,0,0.84);';
			}
		}

		// Update hover colour based on theme option
		if ($this->getOption('hoverColour') !== '#F7BC4A') {
			$additionalLessVariables[] = '@hover:' . $this->getOption('hoverColour') . ';';
		}

		if ($this->getOption('baseColour') && $this->getOption('hoverColour')) {
			$this->modifyStyle('stylesheet', array('addLessVariables' => join('', $additionalLessVariables)));
		}

		$this->addStyle(
			'academicons',
			'https://cdn.rawgit.com/jpswalsh/academicons/master/css/academicons.min.css?display=swap',
			array('baseUrl' => '')
		);

		$this->addStyle(
			'fontBarlowSemiCondensed',
			'//fonts.googleapis.com/css?family=Barlow+Semi+Condensed:200,600&display=swap',
			array('baseUrl' => '')
		);

		$this->addStyle(
			'fontsMerriweather',
			'//fonts.googleapis.com/css?family=Merriweather:300,400,700&display=swap',
			array('baseUrl' => '')
		);

		$this->addStyle(
			'fontsMuli',
			'//fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800&display=swap',
			array('baseUrl' => '')
		);

		//DEBUG: print_r($this->parent);

		$this->modifyStyle('stylesheet',
					array('addLess' => array('styles/variables.less',
											'styles/mixins.less',
											'styles/reset.less',
											'styles/layout.less',
											'styles/typography.less',
											'styles/decoration.less',
											'styles/pages/article.less',
											'styles/pages/archive.less',
											'styles/components/header.less',
											'styles/components/breadcrumbs.less',
											'styles/components/sidebar.less',
											'styles/components/footer.less',
											'styles/objects/announcement_summary.less',
											'styles/responsive.less')));

		// JS libraries
		// $this->addScript('bsScrollspy', 'js/lib/bootstrap/scrollspy.js');
		$this->addScript('cookieconsent', 'js/cookieconsent/cookieconsent.min.js');
		$this->addScript('cookieconfig', 'js/cookieconsent/cookieconsent.config.js');
		$this->addScript('redi', 'js/headerEffect.js');

		// Additional theme information
		HookRegistry::register ('TemplateManager::display', array($this, 'loadTemplateData'));

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

	/**
	 * Fired when the `TemplateManager::display` hook is called.
	 *
	 * @param string $hookname
	 * @param array $args [$templateMgr, $template, $sendContentType, $charset, $output]
	 */
	public function loadTemplateData($hookName, $args) {
		$request = Application::getRequest();

		// Retrieve the TemplateManager
		$templateMgr = $args[0];

		// Template path:
		$templateMgr->assign('rediThemePath', $request->getBaseUrl() . '/' . $this->getPluginPath());

		$templateMgr->assign('rediHeaderLogoPath', $request->getBaseUrl() . '/' . $this->getPluginPath());

		// Journal's CC license badge
		$request = Application::getRequest();
		$journal = $request->getJournal();
		$badge=Application::get()->getCCLicenseBadge($journal->getData('licenseUrl'));
		$templateMgr->assign('ccLicenseBadgeJournal', $badge);
	}

}

?>
