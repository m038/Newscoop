{{ if $smarty.get.event_key }}
    {{ include file="_ausgehen/api-detail-event.tpl" }}
{{ else }}
    {{ include file="_ausgehen/api-list-events.tpl" }}
{{ /if }}
