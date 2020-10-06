{**
 * templates/frontend/components/redi_pastilla.tpl
 *
 * Copyright (c) 2020 Marc Bria ~ Universitat Autònoma de Barcelona
 * Copyright (c) 2014-2019 Simon Fraser University
 * Copyright (c) 2003-2019 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Display a heading for the current page.
 *
 * @uses $currentTitle string The title to use for the current page.
 * @uses $currentTitleKey string Translation key for title of current page.
 *}

{* Set some vars *}
{$homepageImagePath="https://dummyimage.com/380x460/777777/cccccc&text=380x460+-+Crop:+Bottom-Right"}
{if isset($homepageImage.uploadName)}
	{$homepageImagePath="{$publicFilesDir}/{$homepageImage.uploadName}"}
{/if}
{$homepageImageAlt="A placeholder for your homepage image/logo that is still not set."}
{if $homepageImage.altText != ''}
	{$homepageImageAlt=$homepageImage.altText}
{/if}

<!-- a href="{$homeUrl}" class="is_img" style="background-image: url('{$homepageImageBackground}');"</a -->

<section class="banner pkp_structure_content" role="banner">

	{* Banner Image (aka. homepageImage) *}
	{$headerTopImagePath="{$publicFilesDir}/{$headerTopImage.uploadName}"}
	<div class="bannerVisual">
		<div role="img" class="is_img" style="background-image: url('{$homepageImagePath}');" aria-label="{$homepageImageAlt|escape}"></div>
		{* Full-issue galleys *}
		{if $issueGalleys}
		<div class="hoverLayer downloadIcon">

			{* Will take the first element *}
			{foreach from=$issueGalleys item=galley}
				{assign var="page" value="issue"}
				{assign var="parentId" value=$issue->getBestIssueId()}
				{assign var="path" value=$parentId|to_array:$galley->getBestGalleyId()}
				{break}
			{/foreach}

			<a class="is_img" href="{url page=$page op="view" path=$path}" aria-hidden=”true” aria-label='{translate key="issue.fullIssue"}'>
				<img class="icon" src="{$homeUrl}/plugins/themes/redi/images/download.svg" />
			</a>
			<section class="galleys">
				<h4 class="sr-only">
					{translate key="issue.tableOfContents"}
				</h4>
				<ul class="galleys_links">
					{foreach from=$issueGalleys item=galley}
						<li>
							{include file="frontend/objects/galley_link.tpl" parent=$issue purchaseFee=$currentJournal->getSetting('purchaseIssueFee') purchaseCurrency=$currentJournal->getSetting('currency')}
						</li>
					{/foreach}
				</ul>
			</section>
		</div>
		{/if}
	</div>

	<div class="bannerIssue">
		{if $issue->getShowVolume() || $issue->getShowNumber() || $issue->getShowYear()}
			{* <a class="issue_summary_title" href="{url op="view" path=$issue->getBestIssueId()}"> *}
			{strip}
			<div class="bannerIssue__volNum">
				{if $issue->getVolume() && $issue->getShowVolume()}
					<span class="currentVolume">{translate key="plugins.themes.redi.vol.abbr"}. {$issue->getVolume()|escape}</span>
				{/if}
				{if $issue->getNumber() && $issue->getShowNumber()}
					<span class="currentNumber">#{$issue->getNumber()|escape}</span>
				{/if}
			</div>
			<div class="bannerIssue__year">
				{if $issue->getYear() && $issue->getShowYear()}
					<span class="currentYear">{$issue->getYear()|escape}</span>
				{/if}
			</div>
			{/strip}
			<!-- /a -->
		{/if}
		<div class="bannerIssue__title">
			{strip}
			{if $issue->getLocalizedTitle() && $issue->getShowTitle()}
				<!-- a class="issue-title" href="{url op="view" path=$issue->getBestIssueId()}" -->
				{$issue->getLocalizedTitle()|escape}
				<!-- /a -->
			{else}
				{translate key="journal.currentIssue"}
			{/if}
			{/strip}
		</div>
		<div class="hoverLayer issueDescription">
			{include file="frontend/components/redi_pas_desc.tpl"}
		</div>
	</div>
</section>
