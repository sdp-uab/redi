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
{assign var=descriptionLength value=950}

{* If issue has a description, show it in the user's lang or default's... *}
{if $issue->hasDescription()}
{* <img src="{$issue->getLocalizedCoverImageUrl()}" /> *}
	<div class="description">
		{assign var=issueDescription value=$issue->getLocalizedDescription()|strip_unsafe_html}
		{if $issueDescription|strlen < $descriptionLength}
			<div class="description_text">
				{$issueDescription}
			</div>
		{else $requestedPage|escape !== "issue"}
			<div class="description_text">
				{$issueDescription|substr:0:$descriptionLength|mb_convert_encoding:'UTF-8'|replace:'?':''}
				<span class="three_dots">...</span>
				<a class="more_button"
					href="{url op="view" page="issue"
					path=$issue->getBestIssueId()}">
					{translate key="plugins.themes.redi.more"}
				</a>
			</div>
		{/if}
	</div>
{else}
{* Otherwise, show the journal's description... *}
	<div class="description">
		{assign var=issueDescription value=$currentContext->getLocalizedData('description')|strip_unsafe_html}
		{if $issueDescription|strlen < $descriptionLength}
			<div class="description_text">
				{$issueDescription}
			</div>
		{else $requestedPage|escape !== "issue"}
			<div class="description_text">
			{$issueDescription|substr:0:$descriptionLength|mb_convert_encoding:'UTF-8'|replace:'?':''}
				<span class="three_dots">...</span>
				<a class="more_button"
					href="{url op="view" page="issue"
					path=$issue->getBestIssueId()}">
					{translate key="plugins.themes.redi.more"}
				</a>
			</div>
		{/if}
	</div>
{/if}
