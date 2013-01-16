<li>
    {{ if $user->identifier }}
        {{ if $user->is_active }}<a href="{{ $view->url(['username' => $user->uname], 'user') }}">{{ strip }}
            {{ include file="_tpl/user-image.tpl" size="small" }}
        {{ /strip }}</a>{{ /if }}
    {{ else }}
        <img src="{{ url static_file="pictures/user-thumb-small-default.jpg" }}" alt="" />
    {{ /if }}
    <h5>{{ $gimme->comment->subject }} {{ if $gimme->comment->user->identifier && $gimme->comment->user->is_author }}<small class="red-mark">REDAKTION</small>{{ /if }}</h5>
    <time>von {{ if $user->identifier }}{{ if $user->is_active }}<a href="{{ $view->url(['username' => $user->uname], 'user') }}">{{ include file="_tpl/user-name.tpl" user=$user }}</a>{{ /if }}{{ else }}{{ $gimme->comment->nickname }}{{ /if }} um {{ $gimme->comment->submit_date|camp_date_format:"%e.%m.%Y um %H:%iUhr" }}</time>
    <p>{{ $gimme->comment->content|create_links|nl2br }}</p>
</li>
