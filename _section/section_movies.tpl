{{ if $smarty.get.movie_key }}
    {{ include file="_ausgehen/api-detail-movie.tpl" }}
{{ else }}
    {{ include file="_ausgehen/api-list-movies.tpl" }}
{{ /if }}
