{**
 * templates/frontend/components/header.tpl
 *
 * Copyright (c) 2019 Universitat Autònoma de Barcelona
 * Copyright (c) 2019 Marc Bria Ramírez
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Site-wide header; includes service and journal logo, user menu, and primary menu
 *
 *}

{strip}
        {assign var="showingLogo" value=true}
        {if $displayPageHeaderTitle && !$displayPageHeaderLogo && is_string($displayPageHeaderTitle)}
                {assign var="showingLogo" value=false}
        {/if}

        {if $currentContext && $multipleContexts}
                {capture assign="homeUrl"}{url page="index" router=$smarty.const.ROUTE_PAGE}{/capture}
        {else}
                {capture assign="homeUrl"}{url context="index" router=$smarty.const.ROUTE_PAGE}{/capture}
        {/if}
{/strip}

{capture assign="journalLogo"}
        {if $displayPageHeaderLogo && is_array($displayPageHeaderLogo)}
                <img class="journal-logo" src="{$publicFilesDir}/{$displayPageHeaderLogo.uploadName|escape:"url"}"
                     {if $displayPageHeaderLogo.altText != ''}alt="{$displayPageHeaderLogo.altText|escape}"
                     {else}alt="{translate key="common.pageHeaderLogo.altText"}"{/if}>
        {elseif $displayPageHeaderTitle && !$displayPageHeaderLogo && is_string($displayPageHeaderTitle)}
                <div class="journal-logo-text">{$displayPageHeaderTitle}</div>
        {elseif $displayPageHeaderTitle && !$displayPageHeaderLogo && is_array($displayPageHeaderTitle)}
                <img class="journal-logo" src="{$publicFilesDir}/{$displayPageHeaderTitle.uploadName|escape:"url"}"
                     alt="{$displayPageHeaderTitle.altText|escape}">
        {else}
                <img class="journal-logo" src="{$baseUrl}/templates/images/structure/logo.png" alt="{$applicationName|escape}">
        {/if}
{/capture}

<!DOCTYPE html>
<html lang="{$currentLocale|replace:"_":"-"}" xml:lang="{$currentLocale|replace:"_":"-"}">
{if !$pageTitleTranslated}
        {capture assign="pageTitleTranslated"}{translate key=$pageTitle}{/capture}
{/if}
{include file="frontend/components/headerHead.tpl"}
<body>
<header>
        <div class="header container-flow fixed-top scrolling-navbar">
                <div class="container no-side-margin">
                <div class="upper-header row no-side-margin">
                        <h1 class="redi-wrapper col-md-4">
                                <a href="https://revistes.uab.cat" class="home-link">
                <img src="https://revistes.uab.cat/comu/logos/logoReDi.jpg" alt="Revistes Digitals de la UAB"/>
                                </a>
                        </h1>

                        <h1 class="logo-wrapper col-md-4">
                                <a href="{$homeUrl}" class="home-link">
                                        {$journalLogo}
                                <div class="redi-subtitle hidden-sm">Revista de investigación sobre lo fantásticoooo</div>
                                </a>
                        </h1>
                        <div id="user-nav-wraper" class="col-md-4">
                                {* user navigation manu *}
                                {load_menu name="user" id="navigationUser" ulClass="pkp_navigation_user"}
                                {* language toggle block *}
                                {include file="frontend/components/languageSwitcher.tpl" id="languageNav"}
                        </div>
                </div>
                </div>


                {capture assign="primaryMenu"}
      <nav class="container">
                        {load_menu name="primary" id="navigationPrimary" ulClass="pkp_navigation_primary"}
      </nav>
                {/capture}

                {* Show the primary menu only if it is set *}
                {if !empty(trim($primaryMenu)) || $currentContext}
                        <div class="lower-header">
                                <ul id="nav-small" class="nav nav-tabs">
                                        <li class="nav-item">
                                                <a id="show-modal" class="nav-link">
                                                        <ion-icon name="menu"></ion-icon>
                                                        <span class="ion-icon-text">{translate key="plugins.themes.redi3.menu"}</span>
                                                </a>
                                        </li>
                                </ul>
                                {* modal div is added for menu adaptation for small screens *}
                                <div id="modal-on-small" class="nav-modal hide">
                                        <div id="primary-nav-wraper">
            <span id="close-small-modal">
              <ion-icon name="close"></ion-icon>
            </span>
                                                {$primaryMenu}
                                        </div>
                                </div>
                        </div>
                {/if}
        </div>
</header>
