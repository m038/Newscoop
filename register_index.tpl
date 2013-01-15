{{extends file="layout.tpl"}}

{{block page_name}}Community{{/block}}

{{block content}}
<div class="tabs top-line">
    <div class="profile-tabs">
    <h4>Register</h4>


    <form method="{{ $form->getMethod() }}" action="{{ $form->getAction() }}">
        <input type="hidden" name="terms_of_use" value="1" />

    <ul class="form">
        <li>
            <label for="email">Email</label>
            <input id="email" type="text" name="email" value="{{ $form->email->getValue()|escape }}" />
            {{ include file="_tpl/form_error_empty.tpl" field="email" }}
        </li>
        <li>
            <input type="submit" class="button red center" value="Anmelden" />
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
