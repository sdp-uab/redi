<?php

/**
 * @defgroup plugins_themes_redi ReDi plugin
 */

/**
 * @file plugins/themes/redi/index.php
 *
 * Copyright (c) 2020 Marc Bria Ramírez (Universitat Autònoma de Barcelona)
 * Copyright (c) 2014-2016 Simon Fraser University Library
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @ingroup plugins_themes_default-child
 * @brief Wrapper for redi (default child) theme plugin.
 *
 */

require_once('rediThemePlugin.inc.php');

return new rediThemePlugin();

?>
