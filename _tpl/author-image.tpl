{{ strip }}<figure>
    {{ if $author->user->defined }}
    <a href="{{ $author->url }}" title="{{ $author->user->uname|escape }}">
        {{ include file="_tpl/user-image.tpl" user=$author->user size="mid" }}
    </a>
    {{ else if $author->picture->imageurl }}
    <img src="{{ $author->picture->imageurl }}" alt="{{ $author->name }}" width="{{ $width }}" />
    {{ /if }}
</figure>{{ /strip }}
