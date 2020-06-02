{**
 * templates/frontend/components/redi_pas_desc.tpl
 *
 * Copyright (c) 2020 Marc Bria ~ Universitat Autònoma de Barcelona
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Display a heading for the current page.
 *
 * @uses $currentTitle string The title to use for the current page.
 * @uses $currentTitleKey string Translation key for title of current page.
 *}

{* assign var=issueCover value=$issue->getLocalizedCoverImageUrl() *}

DESCRIPTION:
{if $issue->hasDescription()}
{* <img src="{$issue->getLocalizedCoverImageUrl()}" /> *}
	<div class="description">
		{assign var=issueDescription value=$issue->getLocalizedDescription()|strip_unsafe_html}
		{if $issueDescription|strlen < 500}
			<div class="description_text">
				{$issueDescription}
			</div>
		{elseif $requestedPage|escape !== "issue"}
			<div class="description_text">
			{$issueDescription|substr:0:500|mb_convert_encoding:'UTF-8'|replace:'?':''}
				<span class="three_dots">...</span>
				<a class="more_button"
					href="{url op="view" page="issue"
					path=$issue->getBestIssueId()}">
					{translate key="plugins.themes.redi.more"}
				</a>
			</div>
		{else}
			<div class="description_text">
				{$issueDescription}
			</div>
		{/if}
	</div>
{/if}