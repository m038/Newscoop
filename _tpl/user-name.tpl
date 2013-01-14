{{ strip }}
{{ if $user->is_active }}
    {{ $user->uname|create_links|escape }}
{{ else }}
    Inaktiver Nutzer
{{ /if }}
{{ /strip }}
