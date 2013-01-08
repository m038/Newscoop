{{ if $author->user->defined }}<a rel="author" href="{{ $view->url(['username' => $author->user->uname], 'user') }}">{{ /if }}{{ $author->name }}{{ if $author->user->defined }}</a>{{ /if }}

{{* if $author->has_url }}<a rel="author" href="{{ $author->url }}" title="{{ $author->user->uname }}">{{ $author->user->uname }}</a>{{ else }}{{ $author->name }}{{ /if *}}