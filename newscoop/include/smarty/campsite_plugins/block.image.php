<?php
/**
 * @license http://www.gnu.org/licenses/gpl-3.0.txt
 */

/**
 * Image block
 *
 * @param array $params
 * @param string $content
 * @param Smarty_Internal_Template $smarty
 * @param bool $repeat
 * @return void
 */
function smarty_block_image(array $params, $content, Smarty_Internal_Template $smarty, &$repeat)
{
    if (!$repeat) {
        $content = $smarty->getTemplateVars('image') ? $content : '';
        $smarty->assign('image', null);
        return $content;
    }

    if (!array_key_exists('rendition', $params)) {
        throw new \InvalidArgumentException("Rendition not set");
    }

    $cacheService = \Zend_Registry::get('container')->getService('newscoop.cache');
    $renditionService = \Zend_Registry::get('container')->getService('image.rendition');

    $cacheKey = $cacheService->getCacheKey(array('theme_renditions'), 'theme');
    if ($cacheService->contains($cacheKey)) {
        $renditions = $cacheService->fetch($cacheKey);
    } else {
        $renditions = $renditionService->getRenditions();
        $cacheService->save($cacheKey, $renditions);
    }

    if (!array_key_exists($params['rendition'], $renditions)) {
        throw new \InvalidArgumentException("Unknown rendition");
    }

    $article = $smarty->getTemplateVars('gimme')->article;
    if (!$article) {
        throw new \RuntimeException("Not in article context.");
    }

    $imageService = \Zend_Registry::get('container')->getService('image');

    $articleRenditions = $article->getRenditions();
    $articleRendition = $articleRenditions[$renditions[$params['rendition']]];
    if ($articleRendition === null) {
        $smarty->assign('image', false);
        $repeat = false;
        return;
    }

    $image = null;
    if (array_key_exists('width', $params) && array_key_exists('height', $params)) {
        $image = $renditionService->getArticleRenditionImage($article->number, $params['rendition'], $params['width'], $params['height']);
    } else {
        $image = $renditionService->getArticleRenditionImage($article->number, $params['rendition']);
    }

    $smarty->assign('image', (object) array(
        'src' => \Zend_Registry::get('view')->url(array('src' => $image['src']), 'image', true, false),
        'width' => $image['width'],
        'height' => $image['height'],
        'caption' => $imageService->getCaption($articleRendition->getImage(), $article->number, $article->language->number),
        'description' => $articleRendition->getImage()->getDescription(),
        'photographer' => $articleRendition->getImage()->getPhotographer(),
        'original' => $image['original'],
    ));
}
