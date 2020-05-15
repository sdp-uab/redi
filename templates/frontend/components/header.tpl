{**
 * lib/pkp/templates/frontend/components/header.tpl
 *
 * Copyright (c) 2020 Marc Bria Ramírez (Universitat Autònoma de Barcelona)
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Common frontend site header.
 *
 * @uses $isFullWidth bool Should this page be displayed without sidebars? This
 *       represents a page-level override, and doesn't indicate whether or not
 *       sidebars have been configured for thesite.
 *}
{strip}
	{* Determine whether a logo or title string is being displayed *}
	{assign var="showingLogo" value=true}
	{if $displayPageHeaderTitle && !$displayPageHeaderLogo && is_string($displayPageHeaderTitle)}
		{assign var="showingLogo" value=false}
	{/if}
{/strip}
<!DOCTYPE html>
<html lang="{$currentLocale|replace:"_":"-"}" xml:lang="{$currentLocale|replace:"_":"-"}">
{if !$pageTitleTranslated}{capture assign="pageTitleTranslated"}{translate key=$pageTitle}{/capture}{/if}
{include file="frontend/components/headerHead.tpl"}
<body class="pkp_page_{$requestedPage|escape|default:"index"} pkp_op_{$requestedOp|escape|default:"index"}" dir="{$currentLocaleLangDir|escape|default:"ltr"}">

	<div class="pkp_structure_page">

		{* Header *}
		<header class="pkp_structure_head" id="headerNavigationContainer" role="banner">
			<div class="pkp_head_wrapper">
				{include file="frontend/components/redi_headerImage.tpl"}

				<div class="pkp_head_responsive">
					<button class="pkp_site_nav_toggle">
						<span>Open Menu</span>
					</button>

					{if !$requestedPage || $requestedPage === 'index'}
						<h1 class="pkp_screen_reader">{$displayPageHeaderTitle|escape}</h1>
					{/if}
				</div>

				{* Primary site navigation *}
				{include file="frontend/components/skipLinks.tpl"}

				{capture assign="primaryMenu"}
					{load_menu name="primary" id="navigationPrimary" ulClass="pkp_navigation_primary"}
				{/capture}

				<nav class="pkp_site_nav_menu" aria-label="{translate|escape key="common.navigation.site"}">
					<a id="siteNav"></a>
					<div class="pkp_navigation_primary_row">
						<div class="pkp_navigation_primary_wrapper">
							{* Primary navigation menu for current application *}
							{$primaryMenu}
							<ul class="headerShortcuts">
								<li>
									<a href="{url router=$smarty.const.ROUTE_PAGE page="search" op="search"}" class="headerShortcuts__send">
										{translate|escape key="plugins.themes.redi.send"}
									</a>
								</li>
								<li>
									<a href="{url router=$smarty.const.ROUTE_PAGE page="search" op="search"}" class="headerShortcuts__register">
										{translate|escape key="plugins.themes.redi.register.reviewer"}
									</a>
								</li>
							</ul>

						</div>
					</div>
					{if $currentContext}
						{* Search form *}
						{include file="frontend/components/searchForm_simple.tpl" className="pkp_search_mobile"}
					{/if}
				</nav>



			</div><!-- .pkp_head_wrapper -->
		</header><!-- .pkp_structure_head -->

		{include file="frontend/components/redi_pastilla.tpl" pageTitleTranslated=$currentJournal->getLocalizedName()}

		{* Wrapper for page content and sidebars *}
		{if $isFullWidth}
			{assign var=hasSidebar value=0}
		{/if}
		<div class="pkp_structure_content{if $hasSidebar} has_sidebar{/if}">
			<div class="pkp_structure_main" role="main">
				<a id="pkp_content_main"></a>
