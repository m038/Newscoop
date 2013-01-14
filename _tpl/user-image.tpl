{{ strip }}
    {{ if isset($size) && $size == "big" }}
        {{ $box = 113 }}
    {{ else }}
        {{ $size = "mid" }}
        {{ $box = 64 }}
    {{ /if }}

    {{ if empty($class) }}
        {{ $class = "" }}
    {{ /if }}

    {{ if $user->is_active && $user->image }}
    <img alt="{{ $user->uname|escape }}" src="{{ $user->image($box, $box) }}" class="{{ $class|escape }}" />
    {{ else }}
    <img alt="{{ $user->uname|escape }}" src="{{ url static_file="pictures/user-thumb-`$size`-default.jpg" }}" class="{{ $class|escape }}" />
    {{ /if }}
{{ /strip }}
