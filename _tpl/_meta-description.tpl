    <meta name="description" content="{{ strip }}
    
{{ if $gimme->publication->identifier == 2 }}
    {{ if $gimme->template->name == "front.tpl" }}
        zentral+ ist eine Online Zeitung aus der Zentralschweiz. zentralplus liefert Hintergrund, News und Nachrichten zu Politik, Gesellschaft, Wirtschaft, Sport, Kultur und Freizeit in den Kantonen Luzern und Zug.
    {{ elseif ($gimme->section->number > 70) && ($gimme->section->number <= 80) }}

        {{* AUSGEHEN *}}
        {{ if $gimme->section->number == 71 }}
        Der Veranstaltungskalender für die Zentralschweiz.
        {{ /if }}
        {{ if $gimme->section->number == 72 }}
        Das vollständige Programm der Zentralschweizer Kinos mit Vorschau, Filmbesprechung, Trailer.
        {{ /if }}
        {{ if $gimme->section->number == 73 }}
        Essen und trinken in den Kantonen Luzern und Zug.
        {{ /if }}
        {{ if $gimme->section->number == 80 }}
        Ausgehtipps zu Luzern und Zug.
        {{ /if }}

    {{* DIALOGUE *}}
    {{ elseif $gimme->section->number == 90 }}
        Hintergrund, Analyse, Pro & Contra und Nachrichten zu Politik, Gesellschaft, Wirtschaft, Sport, Kultur und Freizeit in Luzern und Zug.
        
    {{* DOSSIER *}}
    {{ elseif $gimme->section->number == 100 }}
        Im Dossier finden Sie wichtige Hintergründe, Analysen und Nachrichten zu Politik, Gesellschaft, Wirtschaft, Sport, Kultur und Freizeit in Luzern und Zug.          

    {{ elseif $gimme->template->name == "section.tpl" }}
        {{* STANDARD SECTIONS *}}
        {{ if $gimme->section->number == 10 }}
        Hintergrund, News, Analysen und Nachrichten aus dem Bereich Politik in Luzern und Zug. zentral+ greift Themen auf zu Verkehr, Steuen, Raumplanung, Asylwesen, Sicherheit, Gesundheit, Sozialpolitik und Bildung.
        {{ /if }}

        {{ if $gimme->section->number == 20 }}
        Hintergründe, Analysen und Nachrichten aus der Wirtschaft in den Zentralschweizer Kantonen Luzern und Zug. zentral+ greift Themen auf zu Steuern, Steuerpolitik, Steuerwettbewerb, Arbeitgeber und Arbeitnehmer, Wirtschaftsstandort und Wirtschaftskriminalität 
        {{ /if }}

        {{ if $gimme->section->number == 30 }}
        Hintergrund, Analysen und Nachrichten aus dem Bereich Kultur in Luzern und Zug. zentral+ berichtet über Ausgehen, Events, Essen, Kino, Theater, Tanz, Film, Kleintheater, Cabaret, Kultursubventionen, Kulturstrategien, Kulturförderung und kulturelle Tätigkeiten. 
        {{ /if }}

        {{ if $gimme->section->number == 40 }}
        Hintergrund, Analysen und Nachrichten aus dem Bereich Gesellschaft in den Kantonen Luzern und Zug. zentral+ greift Themen auf zu Armut, Geld, Asyl, sozialer Durchmischung, demografischer Entwicklung, Sozialstruktur, Familienleben und gesellschaftlichen Entwicklungen. 
        {{ /if }}

        {{ if $gimme->section->number == 50 }}
        Hintergründe, Analysen und Nachrichten aus dem Sport in den Kantonen Luzern und Zug. zentral+ berichtet über Sieg, Niederlage, Sportpolitik, Sicherheit, Fans; im Fokus stehen dabei unter anderem der FCL und der EVZ.	
        {{ /if }}

        {{ if $gimme->section->number == 60 }}
        Hintergründe, Analysen und Nachrichten zur Freizeit in Luzern und Zug. zentralplus liefert Tipps zu Ausgehen, Kino, Theater, Musik, Konzerten, Wandern. 
        {{ /if }}

        {{ if $gimme->section->number == 70 }}
        Hintergründe, Analysen und Nachrichten aus den Zentralschweizer Kantonen Luzern und Zug. Zentral+ greift Themen auf zu technischen Erneuerungen, Innovationen und ökologischen Projekten. 
        {{ /if }}

    {{ elseif $gimme->article->defined }}    
    
      {{ if $gimme->article->type_name == "static_page" }}    
        {{ $gimme->article->SEO_description|strip_tags|escape:'html'|trim }}
    		{{ elseif $gimme->article->lede|strip_tags:false !== "" }}
    			{{ $gimme->article->lede|strip_tags|escape:'html'|trim }}
    		{{ elseif $gimme->article->teaser|strip_tags:false !== "" }}
    			{{ $gimme->article->teaser|strip_tags|escape:'html'|trim }}
    		{{ else }}
    			{{ $gimme->article->body|strip_tags|escape:'html'|trim|truncate:150 }}
    		{{ /if }}
    		
    {{ /if }} 

{{ elseif $gimme->publication->identifier == 4 }}
		{{ if $gimme->template->name == "blogs.tpl" }}  
       Spannende Blogs zu Fussball, Architektur, Ausgehen, Musik, Literatur und Politik aus den Kantonen Luzern und Zug.
		{{ elseif $gimme->template->name == "section.tpl" }}
			{{ list_articles length="1" constraints="type is bloginfo" }}
				{{ $gimme->article->infolong|strip_tags|escape:'html'|trim }}
			{{ /list_articles }}

		{{ elseif $gimme->article->defined }}			
				{{ $gimme->article->lede|strip_tags|escape:'html'|trim }}	
		{{ /if }}    
{{ /if }}    
    {{ /strip }}">
    