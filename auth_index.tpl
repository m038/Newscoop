{{extends file="layout.tpl"}}

{{block page_name}}Community{{/block}}

{{block content}}
<div class="top-line">
    <div class="profile-tabs form-content">
    <h4>Anmelden</h4>

    {{ if $form->getMessages() && !$form->email->hasErrors() && !$form->password->hasErrors() }}
    <div class="infobox error">Invalid credentials</div>
    {{ /if }}
    
    <form method="{{ $form->getMethod() }}" action="{{ $form->getAction() }}">
    <ul class="form bottom-line">
        <li>
            <label for="email">Email</label>
            <input id="email" type="text" name="email" value="{{ $form->email->getValue()|escape }}" />
            {{ include file="_tpl/form_error_empty.tpl" field="email" }}
        </li>
        <li class="bottom-line">
            <label for="password">Passwort ändern</label>
            <input id="password" type="password" name="password" value="{{ $form->password->getValue()|escape }}" />
            {{ include file="_tpl/form_error_empty.tpl" field="password" }}
        </li>
        <li>
            <input type="submit" class="button large red center" value="Anmelden" />
        </li>
    </ul>
    </form>

<ul class="form links">
    <li><a href="{{ $view->url(['action' => 'password-restore'], 'default') }}">{{ $view->translate('Restore password') }}</a></li>
</ul>
<p class="center">oder</p>

<a href="{{ $view->url(['action' => 'social', 'provider' => 'Facebook']) }}" class="button large fb-loggin-button center"><span>Login mit Facebook</span></a>



    </div><!-- /.profile-tabs -->
</div>
{{/block}}
