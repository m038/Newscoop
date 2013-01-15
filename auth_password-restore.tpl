{{extends file="layout.tpl"}}

{{block page_name}}Community{{/block}}

{{block content}}
<div class="tabs top-line">
    <div class="profile-tabs">
        <h4>Restore password</h4>

        {{ capture name="error_empty" }}Angabe ist erforderlich und kann nicht leer sein.{{ /capture }}

        <form method="{{ $form->getMethod() }}" action="{{ $form->getAction() }}">
        <ul class="form">
        <li class="bottom-line">
            <label for="email">Email</label>
            <input id="email" type="text" name="email" value="{{ $form->email->getValue()|escape }}" />
            {{ include file="_tpl/form_error_empty.tpl" field="email" }}
            {{ if $form->email->hasErrors() && $form->email->getValue() }}
            <div class="infobox error">Email not found.</div>
            {{ /if }}
        </li>
        <li>
            <input type="submit" class="button large red center" value="Restore" />
        </li>
    </ul>
    </form>

    </div><!-- /.profile-tabs -->
</div>
{{/block}}
