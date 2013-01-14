{{extends file="layout.tpl"}}

{{block content}}
<div class="profile-tabs">
<h4>{{ $view->translate('Sign in') }}</h4>

{{ if !empty($error) }}
<p style="color: #c00;"><strong>{{ $error }}</strong></p>
{{ /if }}

{{ $form }}

<ul class="links">
    <li><a href="{{ $view->url(['action' => 'password-restore'], 'default') }}">{{ $view->translate('Restore password') }}</a></li>
</ul>

<h3>{{ $view->translate("Sign via") }}</h3>
<ul class="social">
    <li><a href="{{ $view->url(['action' => 'social', 'provider' => 'Facebook']) }}">Facebook</a></li>
</ul>
</div>

{{/block}}
