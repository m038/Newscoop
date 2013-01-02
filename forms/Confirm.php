<?php
/**
 */

/**
 */
class Theme_Form_Confirm extends Zend_Form
{
    public function init()
    {
        $this->addElement('text', 'first_name', array(
            'required' => true,
            'filters' => array('stringTrim'),
        ));

        $this->addElement('text', 'last_name', array(
            'required' => true,
            'filters' => array('stringTrim'),
        ));

        $this->addElement('text', 'username', array(
            'required' => true,
            'filters' => array('stringTrim'),
        ));

        $this->addElement('password', 'password', array(
            'required' => true,
            'filters' => array('stringTrim'),
            'validators' => array(
                array('stringLength', false, array(6, 80)),
            ),
        ));

        $this->addElement('password', 'password_confirm', array(
            'label' => 'Password Confirmation*:',
            'required' => true,
            'filters' => array('stringTrim'),
            'validators' => array(
                new Zend_Validate_Callback(function ($value, $context) {
                    return $value == $context['password'];
                }),
            ),
            'errorMessages' => array("Password confirmation does not match your password."),
        ));

        $this->addElement('file', 'image', array(
            'maxFileSize' => 1024000,
        ));

        $this->addElement('checkbox', 'terms', array(
            'required' => true,
            'validators' => array(
                array('greaterThan', true, array('min' => 0)),
            ),
            'errorMessages' => array(
                "Sie können sich nur registrieren, wenn Sie unseren Nutzungsbedingungen zustimmen. Dies geschieht zu Ihrer und unserer Sicherheit.",
            ),
        ));

        $attributes = new Zend_Form_SubForm();

        $attributes->addElement('radio', 'region', array(
            'multioptions' => array(
                '' => 'any',
                'zug' => 'Zug',
                'luzern' => 'Luzern',
            ),
        ));

        $this->addSubForm($attributes, 'attributes');

        $this->addElement('submit', 'submit', array(
            'label' => 'Login',
            'ignore' => true,
        ));
    }
}
