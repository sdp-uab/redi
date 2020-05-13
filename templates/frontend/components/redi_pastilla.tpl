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

<section class="redi-pastilla header container container-page">
	<div class="row no-side-margin">
		<div class="redi-box redi-cover col-md-4 redi-left">
			<div class="redi-left">
			  <a class="cover" href="{url op="view" path=$issue->getBestIssueId()}">
				{if $homepageImage}
					<div class="homepage-image">
						<img class="archive_issue_cover" src="{$publicFilesDir}/{$homepageImage.uploadName|escape:"url"}" alt="{$homepageImageAltText|escape}">
					</div>
				{/if}
			  </a>
			</div>

			{* Full-issue galleys *}
			{if $issueGalleys}
			<div class="redi-hover">
				<div class="redi-downlad-icon">
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
			</div>
			{/if}
		</div>

		<div class="redi-box redi-text col-md-8">
			<div class="redi-right">
				{if $issue->getShowVolume() || $issue->getShowNumber() || $issue->getShowYear()}
					{* <a class="issue_summary_title" href="{url op="view" path=$issue->getBestIssueId()}"> *}
					{strip}
					<div class="redi-vol-num">
						{if $issue->getVolume() && $issue->getShowVolume()}
							<span class="current-issue-volume">{translate key="plugins.themes.redi3.volume-abbr"}. {$issue->getVolume()|escape}</span>
						{/if}
						{if $issue->getNumber() && $issue->getShowNumber()}
							<!-- span class="current-issue-number">{translate key="plugins.themes.redi3.number-abbr"} {$issue->getNumber()|escape}</span -->
							<span class="current-issue-number">#{$issue->getNumber()|escape}</span>
						{/if}
					</div>
					<div class="redi-year">
						{if $issue->getYear() && $issue->getShowYear()}
							<span class="current-issue-year">{$issue->getYear()|escape}</span>
						{/if}
					</div>
					{/strip}
					<!-- /a -->
				{/if}
			  <div class="issue-title">
				<header>
					{strip}
					{if $issue->getLocalizedTitle() && $issue->getShowTitle()}
						<!-- a class="issue-title" href="{url op="view" path=$issue->getBestIssueId()}" -->
						{$issue->getLocalizedTitle()|escape}
						<!-- /a -->
					{else}
						{translate key="journal.currentIssue"}
					{/if}
					{/strip}
				</header>
			  </div>
			</div>
			<div class="redi-hover">
				{include file="frontend/components/redi_pas_desc.tpl"}
			</div>
		</div>
	</div>
</section>
