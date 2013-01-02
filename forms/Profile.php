<?php
/**
 * @package Newscoop
 * @copyright 2013 Sourcefabric o.p.s.
 * @license http://www.gnu.org/licenses/gpl-3.0.txt
 */

/**
 */
class Theme_Form_Profile extends Zend_Form
{
    public function init()
    {
        $this->addElement('text', 'first_name', array(
            'filters' => array('stringTrim'),
        ));

        $this->addElement('text', 'last_name', array(
            'filters' => array('stringTrim'),
        ));

        $this->addElement('text', 'username', array(
            'filters' => array('stringTrim'),
            'required' => true,
        ));

        $this->addElement('password', 'password', array(
        ));

        $this->addElement('file', 'image', array(
        ));

        $profile = new Zend_Form_SubForm();

        $profile->addElement('radio', 'gender', array(
            'multioptions' => array(
                'male' => 'Male',
                'female' => 'Female',
            ),
        ));

        $profile->addElement('textarea', 'bio', array(
            'filters' => array('stringTrim'),
            'cols' => 60,
            'rows' => 4,
        ));

        $profile->addElement('text', 'birth_date', array(
            'class' => 'date',
            'filters' => array('stringTrim'),
        ));

        $profile->addElement('text', 'website', array(
            'filters' => array('stringTrim'),
        ));

        $profile->addElement('text', 'twitter', array(
            'filters' => array('stringTrim'),
        ));

        $profile->addElement('text', 'facebook', array(
            'filters' => array('stringTrim'),
        ));

        $profile->addElement('text', 'google', array(
            'filters' => array('stringTrim'),
        ));

        $profile->addElement('checkbox', 'email_public', array(
            'label' => 'Allow sending emails',
        ));

        $profile->addElement('radio', 'region', array(
            'multioptions' => array(
                '' => 'any',
                'zug' => 'Zug',
                'luzern' => 'Luzern',
            ),
        ));

        $this->addSubForm($profile, 'attributes');

        $this->addElement('submit', 'submit', array(
            'label' => 'Save profile',
            'ignore' => true,
        ));
    }
}
