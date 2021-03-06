{**
 * templates/frontend/pages/issue.tpl
 *
 * Copyright (c) 2020 Marc Bria Ramírez (Universitat Autònoma de Barcelona)
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Display a landing page for a single issue. It will show the table of contents
 *  (toc) or a cover image, with a click through to the toc.
 *
 * @uses $issue Issue The issue
 * @uses $issueIdentification string Label for this issue, consisting of one or
 *       more of the volume, number, year and title, depending on settings
 * @uses $issueGalleys array Galleys for the entire issue
 * @uses $primaryGenreIds array List of file genre IDs for primary types
 *}
{include file="frontend/components/header.tpl" pageTitleTranslated=$issueIdentification}

{if $issue->getShowTitle()}
{assign var=issueTitle value=$issue->getLocalizedTitle()}
{/if}
{if $issue->getIssueSeries()}
{assign var=issueSeries value=$issue->getIssueSeries()}
{/if}

<div class="page page_issue">

	{* Display a message if no current issue exists *}
	{if !$issue}
		{include file="frontend/components/breadcrumbs_issue.tpl" currentTitleKey="current.noCurrentIssue"}
		<h1>
			{translate key="current.noCurrentIssue"}
		</h1>
		{include file="frontend/components/notification.tpl" type="warning" messageKey="current.noCurrentIssueDesc"}

	{* Display an issue with the Table of Contents *}
	{else}
		{include file="frontend/components/breadcrumbs_issue.tpl" currentTitle=$issueIdentification}

{*		<h1>{$issueIdentification|escape}</h1>*}

{* issueIdentification is not segmented. Spliting it: *}
		{if $issueSeries}
			<h1 class="issue_serie">
				{$issueSeries|escape}
			</h1>
		{/if}
		{if $issueTitle}
			<h1 class="issue_title">
				{$issueTitle|escape}
			</h1>
		{else}
			<h1 class="issue_title">
				{translate key="issue.toc"}
			</h1>
		{/if}

		{include file="frontend/objects/issue_toc.tpl"}
	{/if}
</div>

{include file="frontend/components/footer.tpl"}
