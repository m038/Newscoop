<?php
camp_load_translation_strings("article_types");
require_once($GLOBALS['g_campsiteDir'].'/classes/Log.php');
require_once($GLOBALS['g_campsiteDir'].'/classes/Input.php');
require_once($GLOBALS['g_campsiteDir'].'/classes/Article.php');
require_once($GLOBALS['g_campsiteDir'].'/classes/ArticleType.php');

// Check permissions
if (!$g_user->hasPermission('ManageArticleTypes')) {
	camp_html_display_error(getGS("You do not have the right to rename article types."));
	exit;
}

$articleTypeName = Input::Get('f_article_type');
$errorMsgs = array();

$articleType = new ArticleType($articleTypeName);
if ($articleType->exists()) {
    $articleType->setCommentsEnabled(!$articleType->commentsEnabled());
}
camp_html_goto_page("/$ADMIN/article_types/");

?>