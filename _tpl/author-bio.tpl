{{* if $author->user->defined && !empty($author->user['bio']) }}{{ $author->user['bio'] }}{{ elseif $author->biography->text }}{{ $author->biography->text }}{{ else }}...{{ /if *}}

{{ if $author->biography->text }}{{ $author->biography->text }}{{ elseif $author->user->defined && !empty($author->user['bio']) }}{{ $author->user['bio'] }}{{ else }}...{{ /if }}
