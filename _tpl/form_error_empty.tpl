{{ if $form->$field->hasErrors() && !$form->$field->getValue() }}
<div class="infobox error">Angabe ist erforderlich und kann nicht leer sein.</div>
{{ /if }}
