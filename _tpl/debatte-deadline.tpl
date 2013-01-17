{{ $timestamp = sprintf('@%d', $gimme->debate->date_end) }}
{{ $closingdate=date_create($timestamp) }}
{{ $deadline=$closingdate->setTime(12, 0) }}
{{ $diff=date_diff($deadline, date_create('now')) }}
{{ if $deadline->getTimestamp() > time() }}
    <p>Noch {{ $diff->days }} Tage, {{ $diff->h }} Stunden, {{ $diff->i }} Minuten {{ if $gimme->article->comment_count }}<span class="comm">{{ $gimme->article->comment_count }}</span>{{ /if }}</p>
{{ else }}
    <p>Diskussion geschlossen am {{ $deadline->format('j.n.Y') }} um 12:00 Uhr {{ if $gimme->article->comment_count }}<span class="comm">{{ $gimme->article->comment_count }}</span>{{ /if }}</p> 						      
{{ /if }}   
