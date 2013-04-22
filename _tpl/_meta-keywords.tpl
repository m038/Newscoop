    <meta name="keywords" content="{{ strip }}
    {{ if $gimme->publication->identifier == 2 }}
    		{{ if $gimme->template->name == "front.tpl" }}
    		zentral+, zentralplus, Luzern, Zug, Zeitung, Nachrichten
    		{{ elseif ($gimme->section->number > 70) && ($gimme->section->number <= 80) }}

        {{* AUSGEHEN *}}
        {{ if $gimme->section->number == 71 }}
        Veranstaltungen, Veranstaltungskalender, Events, Theater, Kino, Konzert
        {{ /if }}
        {{ if $gimme->section->number == 72 }}
        Kino, Film, Bourbaki, Stattkino, Maxx
        {{ /if }}
        {{ if $gimme->section->number == 73 }}
        Restaurant, essen, trinken, reservieren, Menü
        {{ /if }}
        {{ if $gimme->section->number == 80 }}
        Ausgehen, Kino, Theater, Musik, Konzerte, Ausgehtipp
        {{ /if }}

      {{* DIALOGUE *}}
      {{ elseif $gimme->section->number == "90" }}
        Pro & Contra, Debatte, Dialog, Meinung

        {{* DOSSIER *}}
      {{ elseif $gimme->section->number == 100 }}
        Dossier, Verkehr, Asyl, Städtebau, Bildung, Steuern  

    		{{ elseif $gimme->template->name == "section.tpl" }}
        {{* STANDARD SECTIONS *}}
        {{ if $gimme->section->number == 10 }}
        Politik, Steuern, Verkehr, Gesundheit, Bildung, Asyl
        {{ /if }}

        {{ if $gimme->section->number == 20 }}
        Wirtschaft, Steuern, Arbeit, Armut, Geld 
        {{ /if }}

        {{ if $gimme->section->number == 30 }}
        Kultur, Theater, Kino, KKL, Literatur
        {{ /if }}

        {{ if $gimme->section->number == 40 }}
        Gesellschaft, Familie, Jugend, Armut, Mittelstand 
        {{ /if }}

        {{ if $gimme->section->number == 50 }}
        Sport, Fussball, Eishockey, FCL, EVZ, tschuttiheftli	
        {{ /if }}

        {{ if $gimme->section->number == 60 }}
        Luzern, Zug, Zentralschweiz, Ausgehen, Freizeit, Restaurant, Bar, Kino, Theater, Musik, Konzert, Tipps, Kulturkalender, Märkte, Club, kaufen, tanzen 
        {{ /if }}

        {{ if $gimme->section->number == 70 }}
        Wissen, Technik, Natur, Ökologie, Umwelt, Energie 
        {{ /if }}
    		
    		{{ elseif $gimme->article->defined }}
    		
      {{ if $gimme->article->type_name == "static_page" }}    
        {{ $gimme->article->SEO_keywords|strip_tags|escape:'html'|trim }}    		
    			{{ elseif $gimme->article->keywords|strip_tags|trim !== "" }}
    				{{ $gimme->article->keywords|strip_tags|escape:'html'|trim }}
				{{ else }}
    				{{ list_article_topics }}{{ $gimme->topic->name }}{{ if $gimme->current_list->at_end }}{{ else }}, {{ /if }}{{ /list_article_topics }}
    			{{ /if }}
    		{{ /if }}
    {{ elseif $gimme->publication->identifier == 4 }}
        	{{ if $gimme->article->defined }}
    			{{ if $gimme->article->keywords|strip_tags|trim !== "" }}
    				{{ $gimme->article->keywords|strip_tags|escape:'html'|trim }}
				{{ else }}
    				{{ list_article_topics }}{{ $gimme->topic->name }}{{ if $gimme->current_list->at_end }}{{ else }}, {{ /if }}{{ /list_article_topics }}
    			{{ /if }}
    		{{ elseif $gimme->section->defined }}
    			{{ list_articles length="1" constraints="type is bloginfo" }}
    				{{ if $gimme->article->keywords|strip_tags|trim !== "" }}
    					{{ $gimme->article->keywords|strip_tags|escape:'html'|trim }}
					{{ else }}
    					{{ list_article_topics }}{{ $gimme->topic->name }}{{ if $gimme->current_list->at_end }}{{ else }}, {{ /if }}{{ /list_article_topics }}
    				{{ /if }}    				
    			{{ /list_articles }}
    		{{ else }}
    			Blog, Gastrokritik, Literatur, tschuttiheftli, Tourismus, Architektur
    		{{ /if }}
    {{ /if }}
    {{ /strip }}">
    