{{ if $gimme->current_list->at_end }}
<ul class="paging center top-line">
    <li>
        {{ if $gimme->current_list->has_previous_elements }}
        <a class="button white prev" href="{{ $uri }}?{{ urlparameters options="previous_items" }}">&lt;</a>
        {{ else }}
        <span class="button white prev">&lt;</a>
        {{ /if }}
    </li>
    {{ $pages = ceil($gimme->current_list->count * 1.0 / $length) }}
    {{ $page = ceil(($gimme->current_list->start + 1.0) / $length) }}
    <li class="caption">{{ $page }} von {{ $pages }}</li>
    <li>
        {{ if $gimme->current_list->has_next_elements }}
        <a class="button white next" href="{{ $uri }}?{{ urlparameters options="next_items" }}">&gt;</a></li>
        {{ else }}
        <span class="button white prev">&gt;</a>
        {{ /if }}
    </li>
</ul>
{{ /if }}
