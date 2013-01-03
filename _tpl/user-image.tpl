{{strip}}
    {{ if !$user->is_active || !$user->image() }}
        {{ uri static_file="pictures/user-thumb-big-default.jpg" }}
    {{ else }}
        {{ $user->image($width, $height) }}
    {{ /if }}
{{/strip}}
