{{extends file="layout.tpl"}}

{{block page_name}}Community{{/block}}

{{block content}}
<div class="top-line">
    <div class="profile-tabs">
    <h4>Registrieren</h4>

				<p>Das Abonnieren von Newslettern ist Community-Mitgliedern vorbehalten. Bitte registrieren Sie sich!</p>
    <form method="{{ $form->getMethod() }}" action="{{ $form->getAction() }}">
        <input type="hidden" name="terms_of_use" value="1" />

    <ul class="form">
        <li class="bottom-line">
            <label for="email">E-Mail-Adresse</label>
            <input id="email" type="text" name="email" value="{{ $form->email->getValue()|escape }}" />
            {{ if $form->email->hasErrors() && !$form->email->getValue() }}
            <div class="infobox error">Sie haben keine Email-Adresse eingetragen. Bitte geb Sie hier Ihre Email-Adresse ein.</div>
            {{ elseif $form->email->hasErrors() }}
            <div class="infobox error">"{{ $form->email->getValue()|escape }}" ist keine gültige E-Mail-Adresse</div>
            {{ /if }}
        </li>
        <li>
            <input type="submit" class="button large red center" value="Registrieren" />
        </li>
    </ul>
    </form>

    </div>
</div>

<script type="text/javascript">
$('#email').change(function() {
    $.post('{{ $view->url(['controller' => 'register', 'action' => 'check-email'], 'default') }}?format=json', {
        'email': $(this).val()
    }, function (data) {
        if (data.status) {
            $('#email').css('color', 'green');
        } else {
            $('#email').css('color', 'red');
        }
    }, 'json');
}).keyup(function() {
    $(this).change();
});
</script>
{{/block}}
