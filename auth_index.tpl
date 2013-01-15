{{extends file="layout.tpl"}}

{{block page_name}}Community{{/block}}

{{block content}}
<div class="tabs top-line">
    <div class="profile-tabs">
    <h4>Anmelden</h4>

    {{ if $form->getMessages() && !$form->email->hasErrors() && !$form->password->hasErrors() }}
    <div class="infobox error">Invalid credentials</div>
    {{ /if }}
    
    {{ capture name="error_empty" }}Angabe ist erforderlich und kann nicht leer sein.{{ /capture }}
    <form method="{{ $form->getMethod() }}" action="{{ $form->getAction() }}">
    <ul class="form bottom-line">
        <li>
            <label for="email">Email</label>
            <input id="email" type="text" name="email" value="{{ $form->email->getValue()|escape }}" />
            {{ if $form->email->hasErrors() }}
            <div class="infobox error">{{ $smarty.capture.error_empty|escape }}</div>
            {{ /if }}
        </li>
        <li class="bottom-line">
            <label for="password">Passwort ändern</label>
            <input id="password" type="password" name="password" value="{{ $form->password->getValue()|escape }}" />
            {{ if $form->password->hasErrors() }}
            <div class="infobox error">{{ $smarty.capture.error_empty|escape }}</div>
            {{ /if }}
        </li>
        <li>
            <input type="submit" class="button red center" value="Anmelden" />
        </li>
    </ul>
    </form>

<ul class="links">
    <li><a href="{{ $view->url(['action' => 'password-restore'], 'default') }}">{{ $view->translate('Restore password') }}</a></li>
</ul>

<h3>{{ $view->translate("Sign via") }}</h3>
<ul class="social">
    <li><a href="{{ $view->url(['action' => 'social', 'provider' => 'Facebook']) }}">Facebook</a></li>
</ul>

    </div><!-- /.profile-tabs -->
</div>
{{/block}}
