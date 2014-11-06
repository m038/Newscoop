<?php
/**
 * @param mixed p_dbColumns
 * @param object p_user The User object
 * @param int p_editorLanguage The current or selected language
 * @param array options Override tinyMCE options
 *
 * @return void
 */
function editor_load_tinymce($p_dbColumns, $p_user, $p_editorLanguage, $options=array())
{
    global $Campsite;

    $stylesheetFile = $Campsite['WEBSITE_URL'] . '/admin/articles/article_stylesheet.css';

    // Defaults, can be overridden via $options parameter
    $toolbarlength      = 33;

    // hangle options
    if (array_key_exists('toolbar_length', $options)) {
        $toolbarlength = $options['toolbar_length'];
        unset($options['toolbar_length']);
    }

    /** STEP 1 ********************************************************
     * What are the names of the textareas you will be turning
     * into editors?
     ******************************************************************/
    $editors = array();
    if (is_array($p_dbColumns)) {
        $editors = $p_dbColumns;
    } else {
        $editors[] = $p_dbColumns;
    }
    $textareas = implode(',', array_map(function($value) {
        return '#'.$value;
    }, $editors));

    /** STEP 2 ********************************************************
     * Now, what are the plugins you will be using in the editors
     * on this page.  List all the plugins you will need, even if not
     * all the editors will use all the plugins.
     ******************************************************************/
    $plugins = array();
    if ($p_user->hasPermission('EditorCopyCutPaste')) {
        $plugins[] = 'paste';
    }
    if ($p_user->hasPermission('EditorFindReplace')) {
        $plugins[] = 'searchreplace';
    }
    if ($p_user->hasPermission('EditorEnlarge')) {
        $plugins[] = 'fullscreen';
    }
    if ($p_user->hasPermission('EditorLink')) {
        $plugins[] = 'campsiteinternallink';
    }
    if ($p_user->hasPermission('EditorFontColor')) {
        $plugins[] = 'codehighlighting';
    }
    if ($p_user->hasPermission('EditorTextDirection')) {
        $plugins[] = 'directionality';
    }

    $plugins_list = implode(",", $plugins);

    $statusbar_location = "none";
    if ($p_user->hasPermission('EditorStatusBar')) {
        $statusbar_location = "bottom";
    }

    /** STEP 3 ********************************************************
     * We create a default configuration to be used by all the editors.
     * If you wish to configure some of the editors differently this
     * will be done in step 4.
     ******************************************************************/
    $toolbar1 = array();
    if ($p_user->hasPermission('EditorBold')) {
        $toolbar1[] = "bold";
    }
    if ($p_user->hasPermission('EditorItalic')) {
        $toolbar1[] = "italic";
    }
    if ($p_user->hasPermission('EditorUnderline')) {
        $toolbar1[] = "underline";
    }
    if ($p_user->hasPermission('EditorStrikethrough')) {
        $toolbar1[] = "strikethrough";
        $toolbar1[] = "blockquote";
    }
    if ($p_user->hasPermission('EditorTextAlignment')) {
        $toolbar1[] = "|";
        $toolbar1[] = "justifyleft";
        $toolbar1[] = "justifycenter";
        $toolbar1[] = "justifyright";
        $toolbar1[] = "justifyfull";
    }
    if ($p_user->hasPermission('EditorIndent')) {
        $toolbar1[] = "|";
        $toolbar1[] = "outdent";
        $toolbar1[] = "indent";
    }
    if ($p_user->hasPermission('EditorCopyCutPaste')) {
        $toolbar1[] = "|";
        $toolbar1[] = "copy";
        $toolbar1[] = "cut";
        $toolbar1[] = "paste";
        $toolbar1[] = "pastetext";
        $toolbar1[] = "pasteword";
    }
    if ($p_user->hasPermission('EditorUndoRedo')) {
        $toolbar1[] = "|";
        $toolbar1[] = "undo";
        $toolbar1[] = "redo";
    }
    if ($p_user->hasPermission('EditorTextDirection')) {
        $toolbar1[] = "|";
        $toolbar1[] = "ltr";
        $toolbar1[] = "rtl";
    }

    if ($p_user->hasPermission('EditorLink')) {
        $toolbar1[] = "|";
        $toolbar1[] = "campsiteinternallink";
        $toolbar1[] = "link";
    }
    if ($p_user->hasPermission('EditorSourceView')) {
        $toolbar1[] = "code";
    }
    if ($p_user->hasPermission('EditorEnlarge')) {
        $toolbar1[] = "fullscreen";
    }
    if ($p_user->hasPermission('EditorHorizontalRule')) {
        $toolbar1[] = "hr";
    }
    if ($p_user->hasPermission('EditorFontColor')) {
        $toolbar1[] = "forecolor";
        $toolbar1[] = "backcolor";
        $toolbar1[] = 'codehighlighting';
    }
    if ($p_user->hasPermission('EditorSubscript')) {
        $toolbar1[] = "sub";
    }
    if ($p_user->hasPermission('EditorSuperscript')) {
        $toolbar1[] = "sup";
    }

    $toolbar2 = array();
    $toolbar3 = array();

    // Slice up the toolbars if they are too long.
    if (count($toolbar1) > $toolbarlength) {
        $toolbar2   = array_splice($toolbar1, $toolbarlength);
    }
    if (count($toolbar2) > $toolbarlength) {
        $toolbar3   = array_splice($toolbar2, $toolbarlength);
    }

    if ($p_user->hasPermission('EditorCharacterMap')) {
        $toolbar2[] = "charmap";
    }

    // This is to put the bulleted and numbered list controls
    // on the most appropriate line of the toolbar.
    if ($p_user->hasPermission('EditorListBullet') && $p_user->hasPermission('EditorListNumber') && count($toolbar1) < 19) {
        $toolbar1[] = "|";
        $toolbar1[] = "bullist";
        $toolbar1[] = "numlist";
    } elseif ($p_user->hasPermission('EditorListBullet') && !$p_user->hasPermission('EditorListNumber') && count($toolbar1) < 34) {
        $toolbar1[] = "|";
        $toolbar1[] = "bullist";
    } elseif (!$p_user->hasPermission('EditorListBullet') && $p_user->hasPermission('EditorListNumber') && count($toolbar1) < 20) {
        $toolbar1[] = "|";
        $toolbar1[] = "numlist";
    } else {
        $hasSeparator = false;
        if ($p_user->hasPermission('EditorListBullet')) {
            $toolbar2[] = "|";
            $toolbar2[] = "bullist";
            $hasSeparator = true;
        }
        if ($p_user->hasPermission('EditorListNumber')) {
            if (!$hasSeparator) {
                $toolbar2[] = "|";
            }
            $toolbar2[] = "numlist";
        }
    }

    if ($p_user->hasPermission('EditorFontFace')) {
        $toolbar2[] = "|";
        $toolbar2[] = "formatselect";
    }
    if ($p_user->hasPermission('EditorFontSize')) {
        $toolbar2[] = "fontsizeselect";
    }

    $theme_buttons1 = (count($toolbar1) > 0) ? implode(',', $toolbar1) : '';
    $theme_buttons2 = (count($toolbar2) > 0) ? implode(',', $toolbar2) : '';
    $theme_buttons3 = (count($toolbar3) > 0) ? implode(',', $toolbar3) : '';

    $localeFile = $Campsite['CAMPSITE_DIR'] . '/js/tinymce/langs/' . $p_editorLanguage . '.js';
    if (!file_exists($localeFile)) {
        $p_editorLanguage = 'en';
    }

    // Convert resting options to json
    $optionsAsJson = json_encode($options);
?>

<!-- Load TinyMCE -->
<script type="text/javascript" src="<?php echo $Campsite['WEBSITE_URL']; ?>/js/tinymce/jquery.tinymce.js"></script>
<script type="text/javascript">

$().ready(function() {

    var tinyMceOptions = {

        // Location of TinyMCE script
        script_url : '<?php echo $Campsite['WEBSITE_URL']; ?>/js/tinymce/tiny_mce.js',

        // General options
        language : "<?php p($p_editorLanguage); ?>",
        theme : "advanced",
        plugins : "<?php p($plugins_list); ?>",

        forced_root_block : "",
        relative_urls : false,

        // Theme options
        theme_advanced_buttons1 : "<?php p($theme_buttons1); ?>",
        theme_advanced_buttons2 : "<?php p($theme_buttons2); ?>",
        theme_advanced_buttons3 : "<?php p($theme_buttons3); ?>",

        theme_advanced_toolbar_location : "external",
        theme_advanced_toolbar_align : "left",
        theme_advanced_resizing : false,
        theme_advanced_statusbar_location: "<?php p($statusbar_location); ?>",

        // Limit characters
        max_chars : 0,
        max_chars_indicator : ".maxCharsSpan",

        // Example content CSS (should be your site CSS)
        content_css : "<?php echo $stylesheetFile; ?>",

        // Drop lists for link/image/media/template dialogs
        template_external_list_url : "lists/template_list.js",
        external_link_list_url : "lists/link_list.js",
        external_image_list_url : "lists/image_list.js",
        media_external_list_url : "lists/media_list.js",

        // paste options
        paste_auto_cleanup_on_paste: true,
        paste_convert_headers_to_strong: true,
        paste_remove_spans: true,
        paste_remove_styles: true,
        paste_block_drop: true,

        // not escaping greek characters
        entity_encoding: 'raw',

        <?php if ($p_user->hasPermission('EditorSpellcheckerEnabled')): ?>
        gecko_spellcheck : true,
        <?php endif; ?>

        <?php
        $translator = \Zend_Registry::get('container')->getService('translator');
        ?>
        setup : function(ed) {
            var wordcount = false;

            ed.onKeyUp.add(function(ed, l) {
                var row = tinymce.DOM.get(tinyMCE.activeEditor.id + '_path_row');
                if (!wordcount) {
                    tinymce.DOM.add(row.parentNode, 'div', {'style': 'float: right'}, '<?php echo $translator->trans("Characters", array(), 'articles'); ?>: ' + '<span id="' + tinyMCE.activeEditor.id + '-wordcount">0</span>');
                    wordcount = true;
                }
                var strip = (tinyMCE.activeEditor.getContent()).replace(/(<([^>]+)>)/ig,"");
                tinymce.DOM.setHTML(tinyMCE.activeEditor.id + '-wordcount', strip.length);
            });
        },
    };

    $.extend(tinyMceOptions, <?php echo $optionsAsJson; ?>);

    // Remove option when value is  '0'. '0' indicates no character limit but
    // plugin doesn't support this functionality.
    if (tinyMceOptions.max_chars == 0) {
        delete tinyMceOptions.max_chars;
    }
 
    // Default skin
    $('<?php echo $textareas;?>').tinymce(tinyMceOptions);

    function tinyMCECharsValid(editor, maxChars) {
        if (maxChars == 0) return true;
        var text = editor.getContent().replace(/<[^>]*>/g, '').replace(/\s+/g, ' ');
        text = text.replace(/^\s\s*/, '').replace(/\s\s*$/, '');
        return (text.length <= maxChars);
    }

    <?php
        $prefService = \Zend_Registry::get('container')->getService('preferences');
        if ($prefService->MediaRichTextCaptions == 'Y') {
    ?>

    function validateTinyMCEEditors() {

        if (typeof(tinyMceOptions.max_chars) == 'undefined') {
            return true;
        }

        var valid = true;
        var invalidInstances = [];

        for (inst in tinyMCE.editors) {
            // Check if entry is valid tinyMCE instance and skip numeric instances
            if (tinyMCE.editors[inst].getContent && isNaN(inst)) {
                if (!tinyMCECharsValid(tinyMCE.editors[inst], tinyMceOptions.max_chars)) {
                    valid = false;
                    invalidInstances.push(inst);
                }
            }
        }

        if (!valid) {
            // TODO: Translate this
            alert('<?php echo $translator->trans('An image caption is too long. The character limit is $1.', array(), 'media_archive'); ?>'.replace('$1', tinyMceOptions.max_chars));
            // Focus first instance
            tinymce.execCommand('mceFocus', false, invalidInstances[0]);
        }

        return valid;
    }

    <?php
        } else {
    ?>
        function validateTinyMCEEditors() {
            return true;
        }
    <?php
        }
    ?>
});
</script>
<!-- /TinyMCE -->
<?php
} // fn editor_load_tinymce
?>
