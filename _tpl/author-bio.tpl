{{ if $author->user->defined && !empty($author->user['bio']) }}{{ $author->user['bio']|bbcode }}{{ elseif $author->biography->text }}{{ $author->biography->text }}{{ else }}...{{ /if }}
