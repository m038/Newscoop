<article>
    <figure>
        <a href="{{ $view->url(['username' => $user->uname], 'user') }}" title="{{ $user->uname|escape }}">{{ strip }}
            {{ include file="_tpl/user-image.tpl" }}
        {{ /strip }}</a>
    </figure>
    <h3>
        <a href="{{ $view->url(['username' => $user->uname], 'user') }}" title="{{ $user->uname|escape }}">{{ $user->uname|escape }}</a>
        {{ if $user->is_author }}
        <small class="red-mark">REDAKTION</small>
        {{ /if }}
    </h3>
    <time>Registriert seit {{ $user->created }} <span class="comm">{{ $user->posts_count }}</span></time></p>
</article>
