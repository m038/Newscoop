{{extends file="layout.tpl"}}

{{block page_name}}Community{{/block}}

{{block content}}
<div class="top-line">
    <div class="profile-tabs">
    <h4>Passwort ändern</h4>

    <form method="{{ $form->getMethod() }}" action="{{ $form->getAction() }}">
    <ul class="form">
        <li>
            <label for="password">Passwort</label>
            <input id="password" type="password" name="password" value="{{ $form->password->getValue()|escape }}" />
            {{ include file="_tpl/form_error_empty.tpl" field="password" }}
            {{ if $form->password->hasErrors() && $form->password->getValue() }}
            <div class="infobox error">Passwort muss mindestens 6 Zeichen lang sein.</div>
            {{ /if }}
        </li>
        <li class="bottom-line">
            <label for="password_confirm">Passwort bestätigen</label>
            <input id="password_confirm" type="password" name="password_confirm" value="{{ $form->password_confirm->getValue()|escape }}" />
            {{ include file="_tpl/form_error_empty.tpl" field="password_confirm" }}
            {{ if $form->password_confirm->hasErrors() && $form->password_confirm->getValue() }}
            <div class="infobox error">Passwörter stimmen nicht überein</div>
            {{ /if }}
        </li>
        <li>
            <input type="submit" class="button large red center" value="Passwort ändern" />
        </li>
    </ul>
    </form>

    </div>
</div>
{{/block}}