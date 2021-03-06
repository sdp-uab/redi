{**
 * templates/frontend/objects/issue_summary.tpl
 *
 * Copyright (c) 2014 Marc Bria (Universitat Autònoma de Barcelona)
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief View of an Issue which displays a summary for use in lists
 *
 * @uses $issue Issue The issue
 *}
{if $issue->getShowTitle()}
{assign var=issueTitle value=$issue->getLocalizedTitle()}
{/if}
{assign var=issueSeries value=$issue->getIssueSeries()}
{assign var=issueCover value=$issue->getLocalizedCoverImageUrl()}

<div class="obj_issue_summary">

	{if $issueCover}
		<a class="cover" href="{url op="view" path=$issue->getBestIssueId()}">
			<img src="{$issueCover|escape}" alt="{$issue->getLocalizedCoverImageAltText()|escape|default:''}">
		</a>
	{/if}

	<h2>
		<a class="title" href="{url op="view" path=$issue->getBestIssueId()}">
			{if $issueSeries}
				<span class="series">
					{$issueSeries|escape}
				</span>
			{/if}
			{if $issueTitle}
				<span class="issue_title">
					{$issueTitle|escape}
				</span>
			{/if}
		</a>
	</h2>

{*	<div class="description">
		{$issue->getLocalizedDescription()|strip_unsafe_html}
	</div>
*}
</div><!-- .obj_issue_summary -->
