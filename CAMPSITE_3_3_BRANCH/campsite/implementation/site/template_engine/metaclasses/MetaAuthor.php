<?php
/**
 * @package Campsite
 */

/**
 * Includes
 */
require_once($GLOBALS['g_campsiteDir'].'/classes/Author.php');
require_once($GLOBALS['g_campsiteDir'].'/classes/Language.php');
require_once($GLOBALS['g_campsiteDir'].'/template_engine/metaclasses/MetaDbObject.php');

/**
 * @package Campsite
 */
final class MetaAuthor extends MetaDbObject {

    public function __construct($p_idOrName = null)
    {
        $this->m_dbObject = new Author($p_idOrName);
        if (!$this->m_dbObject->exists()) {
            $this->m_dbObject = new Author();
        }

        $this->m_properties['identifier'] = 'Id';
        $this->m_properties['first_name'] = 'first_name';
        $this->m_properties['last_name'] = 'last_name';
        $this->m_properties['email'] = 'email';

        $this->m_customProperties['name'] = 'getName';
        $this->m_customProperties['defined'] = 'defined';
    } // fn __construct


    protected function getName($p_format = '%_FIRST_NAME %_LAST_NAME')
    {
    	return $this->m_dbObject->getName($p_format);
    }


    public static function GetTypeName()
    {
        return 'author';
    }
} // class MetaAuthor

?>