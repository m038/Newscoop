<?php
/**
 */

/**
 */
class Theme_Form_Confirm extends Application_Form_Confirm
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
            'required' => true,
            'filters' => array('stringTrim'),
            'validators' => array(
                new Zend_Validate_Callback(function ($value, $context) {
                    return $value == $context['password'];
                }),
            ),
            'errorMessages' => array("Password confirmation does not match your password."),
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

        $this->addAttributesForm();

        $this->addElement('submit', 'submit', array(
            'label' => 'Login',
            'ignore' => true,
            'order' => 100,
        ));
    }

    /**
     * Add attributes form
     *
     * @return void
     */
    private function addAttributesForm()
    {
        $form = new Zend_Form_SubForm();

        $form->addElement('radio', 'region', array(
            'multioptions' => array(
                '' => 'any',
                'zug' => 'Zug',
                'luzern' => 'Luzern',
            ),
        ));

        $this->addSubForm($form, 'attributes');
    }
}
