<?php
camp_load_translation_strings("article_types");
require_once($GLOBALS['g_campsiteDir'].'/classes/Log.php');
require_once($GLOBALS['g_campsiteDir'].'/classes/Input.php');
require_once($GLOBALS['g_campsiteDir'].'/classes/Article.php');
require_once($GLOBALS['g_campsiteDir'].'/classes/ArticleType.php');

$articleTypeName = Input::Get('f_article_type');
$articleTypeFieldName = Input::Get('f_field_name');
$move = Input::Get('f_move');
$errorMsgs = array();

$articleTypeField = new ArticleTypeField($articleTypeName, $articleTypeFieldName);
$articleTypeField->reorder($move);

camp_html_goto_page("/$ADMIN/article_types/fields/?f_article_type=".urlencode($articleTypeName));
?>