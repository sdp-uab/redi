{capture assign="homeUrl"}
	{if $currentContext && $multipleContexts}
		{url page="index" router=$smarty.const.ROUTE_PAGE}
	{else}
		{url context="index" router=$smarty.const.ROUTE_PAGE}
	{/if}
{/capture}

<div class="headerTop">
	<div class="pkp_site_name_wrapper">
		{* Owners: ReDi & UAB *}
		<div class="headerTop__item owners">
			<a href="https://revistes.uab.cat" class="is_img">
				<img class="owners_logo" src="{$rediThemePath}/templates/images/logoReDi-thumb.png" />
			</a>
			<a href="https://www.uab.cat" class="is_img">
				<img class="owners_logo" src="{$rediThemePath}/templates/images/logoUAB-thumb.png" />
			</a>
		</div>

		{* Logo: journalLogo (aka. homepageImage) *}
		{$homepageImageBackground="{$publicFilesDir}/{$homepageImage.uploadName}"}
		{* $homepageImageBackground="https://dummyimage.com/460x50/5A71A6/cccccc" *}
		<div class="headerTop__item journalLogo">
			{if $requestedPage|escape|default:"index" == 'index' }
				<a href="{$homeUrl}" class="is_img" style="background-image: url('{$homepageImageBackground}');"</a>

<!--				<a href="{$homeUrl}" class="is_img">
					{if $homepageImage.uploadName}
					<img class="journalLogo__image" src="{$publicFilesDir}/{$homepageImage.uploadName|escape:"url"}" {if $homepageImage.altText != ''}alt="{$homepageImage.altText|escape}"{/if}/>
					{else}
					<img class="journalLogo__image" src="https://dummyimage.com/460x100/777/ccc" alt="'A header image that is still not set" />
					{/if}
				</a>
-->
			{else}
			<a href="{$homeUrl}" class="is_img">
				<img class="journalLogo__image" src="https://dummyimage.com/460x50/5A71A6/cccccc" alt="'A header image that is still not set" />
			</a>
			{/if}
		</div>

		{* Nav: menuUser (topRight) *}
		<div class="headerTop__item menuUser">
			<div class="pkp_navigation_user_wrapper" id="navigationUserWrapper">
				{* Minimal searcher (icon+link) *}
				<a href="{url router=$smarty.const.ROUTE_PAGE page="search" op="search"}" class="userMenu__search">
					<span aria-hidden=”true” aria-label='{translate key="common.search"}'></span>
				</a>

				{* Language Toggle menu *}
				{include file="frontend/components/languageSwitcher.tpl" id="languageNav"}

				{* User Profile menu *}
				{load_menu name="user" id="navigationUser" ulClass="pkp_navigation_user" liClass="profile"}
			</div>
		</div>
	</div>
</div>
