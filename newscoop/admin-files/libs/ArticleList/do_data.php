<?php
/**
 * @package Campsite
 *
 * @author Petr Jasek <petr.jasek@sourcefabric.org>
 * @copyright 2010 Sourcefabric o.p.s.
 * @license http://www.gnu.org/licenses/gpl.txt
 * @link http://www.sourcefabric.org
 */


require_once dirname(__FILE__) . '/ArticleList.php';
require_once WWW_DIR . '/classes/Article.php';

require_once($GLOBALS['g_campsiteDir'].'/classes/ArticleType.php');

$list = new ArticleList(TRUE);

// start >= 0
$start = max(0,
    empty($_REQUEST['iDisplayStart']) ? 0 : (int) $_REQUEST['iDisplayStart']);

// results num >= 10 && <= 100
$limit = min(100, max(10,
    empty($_REQUEST['iDisplayLength']) ? 0 : (int) $_REQUEST['iDisplayLength']));

// filters - common
$articlesParams = array();
$filters = array(
    'publication' => array('is', 'integer'),
    'issue' => array('is', 'integer'),
    'section' => array('is', 'integer'),
    'language' => array('is', 'integer'),
    'publish_date' => array('is', 'date'),
    'publish_date_from' => array('greater_equal', 'date'),
    'publish_date_to' => array('smaller_equal', 'date'),
    'author' => array('is', 'integer'),
    'topic' => array('is', 'integer'),
    'workflow_status' => array('is', 'string'),
    'creator' => array('is', 'integer'),
    'type' => array('is', 'string'),
);

// mapping form name => db name
$fields = array(
    'publish_date_from' => 'publish_date',
    'publish_date_to' => 'publish_date',
    'language' => 'idlanguage',
    'creator' => 'iduser',
);

//fix for the new issue filters
if( isset($_REQUEST['issue']) && $_REQUEST['issue'] > 0 ) {
	if($_REQUEST['issue'] != 0) {
		$issueFiltersArray = explode('_', $_REQUEST['issue']);
		if(count($issueFiltersArray) > 1) {
            if (empty($_REQUEST['publication'])) {
			    $_REQUEST['publication'] = $issueFiltersArray[0];
            }

			$_REQUEST['issue'] = $issueFiltersArray[1];
			$_REQUEST['language'] = $issueFiltersArray[2];
		}
	}
}

//fix for the new section filters
if( isset($_REQUEST['section']) && $_REQUEST['section'] > 0 ) {
	if($_REQUEST['section'] != 0) {
		$sectionFiltersArray = explode('_', $_REQUEST['section']);
		if(count($sectionFiltersArray) > 1) {
            if (empty($_REQUEST['publication'])) {
			    $_REQUEST['publication'] = $sectionFiltersArray[0];
            }

            if (empty($_REQUEST['language'])) {
			    $_REQUEST['language'] = $sectionFiltersArray[2];
            }

			$_REQUEST['section'] = $sectionFiltersArray[3];
		}
	}
}

foreach ($filters as $name => $opts) {
    if (isset($_REQUEST[$name])
    && (!empty($_REQUEST[$name]) || $_REQUEST[$name] === 0)) {
        $field = !empty($fields[$name]) ? $fields[$name] : $name;
        $articlesParams[] = new ComparisonOperation($field, new Operator($opts[0], $opts[1]), $_REQUEST[$name]);
    }
}

if (empty($_REQUEST['showtype']) || $_REQUEST['showtype'] != 'with_filtered') { // limit articles of filtered types by default

    foreach((array) \ArticleType::GetArticleTypes(true) as $one_art_type_name) {
        $one_art_type = new \ArticleType($one_art_type_name);
        if ($one_art_type->getFilterStatus()) {
            $articlesParams[] = new ComparisonOperation('type', new Operator('not', 'string'), $one_art_type->getTypeName());
        }
    }

}

// search
if (isset($_REQUEST['sSearch']) && strlen($_REQUEST['sSearch']) > 0) {
    $search_phrase = $_REQUEST['sSearch'];
    //$articlesParams[] = new ComparisonOperation('search_phrase', new Operator('is', 'integer'), $search_phrase);
    $articlesParams[] = new ComparisonOperation('search_phrase', new Operator('like', 'string'), "__match_all.".$search_phrase);
}

// sorting
$cols = $list->getColumnKeys();
$sortOptions = array(
    'Number' => 'bynumber',
    'Order' => 'bysectionorder',
    'Name' => 'byname',
    'Comments' => 'bycomments',
    'Reads' => 'bypopularity',
    'CreateDate' => 'bycreationdate',
    'PublishDate' => 'bypublishdate',
    'Author' => 'byauthor',
    'Status' => 'bystatus'
);

$sortBy = 'bysectionorder';
$sortDir = 'asc';
$sortingCols = min(1, (int) $_REQUEST['iSortingCols']);
for ($i = 0; $i < $sortingCols; $i++) {
    $sortOptionsKey = (int) $_REQUEST['iSortCol_' . $i];
    if (!empty($sortOptions[$cols[$sortOptionsKey]])) {
        $sortBy = $sortOptions[$cols[$sortOptionsKey]];
        $sortDir = $_REQUEST['sSortDir_' . $i];
        break;
    }
}

// get articles
$articles = Article::GetList($articlesParams, array(array('field' => $sortBy, 'dir' => $sortDir)), $start, $limit, $articlesCount, true);

$return = array();
foreach($articles as $article) {
    $return[] = $list->processItem($article);
}
return array(
    'iTotalRecords' => Article::GetTotalCount(),
    'iTotalDisplayRecords' => $articlesCount,
    'sEcho' => (int) $_REQUEST['sEcho'],
    'aaData' => $return,
);
