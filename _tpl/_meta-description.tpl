    <meta name="description" content="{{ strip }}
    
{{ if $gimme->publication->identifier == 2 }}
    {{ if $gimme->template->name == "front.tpl" }}
        zentral+ ist ein Online-Magazin aus der Zentralschweiz. Es liefert Hintergründe, Analysen und Nachrichten zu Politik, Gesellschaft, Wirtschaft, Sport, Kultur und Freizeit in den Kantonen Luzern und Zug.
    {{ elseif $gimme->template->name == "section.tpl" }}
        {{* STANDARD SECTIONS *}}
        {{ if $gimme->section->number == 10 }}
        Hintergründe, Analysen und Nachrichten aus dem Bereich Politik in den beiden Zentralschweizer Kantonen Luzern und Zug. zentral+ greift Themen auf zu Verkehrspolitik, Steuerpolitik, Raumplanung, Asylwesen, Sicherheitspolitik, Gesundheitspolitik, Sozialpolitik und Bildungspolitik.
        {{ /if }}

        {{ if $gimme->section->number == 20 }}
        Hintergründe, Analysen und Nachrichten aus dem Bereich Wirtschaft in den beiden Zentralschweizer Kantonen Luzern und Zug. zentral+ greift Themen auf zu Steuerpolitik, Steuerwettbewerb, Arbeitgeber und Arbeitnehmer, Arbeitsplätze, Wirtschaftsstandort und Wirtschaftskriminalität. 
        {{ /if }}

        {{ if $gimme->section->number == 30 }}
        Hintergründe, Analysen und Nachrichten aus dem Bereich Kultur in den beiden Zentralschweizer Kantonen Luzern und Zug. zentral+ berichtet über Kultursubventionen, Kulturstrategien, Kulturförderung und kulturelle Tätigkeiten. 
        {{ /if }}

        {{ if $gimme->section->number == 40 }}
        Hintergründe, Analysen und Nachrichten aus dem Bereich Gesellschaft in den beiden Zentralschweizer Kantonen Luzern und Zug. zentral+ greift Themen auf zu sozialer Durchmischung, demografischer Entwicklung, Sozialstruktur, Familienleben und gesellschaftlichen Entwicklungen. 
        {{ /if }}

        {{ if $gimme->section->number == 50 }}
        Hintergründe, Analysen und Nachrichten aus dem Bereich Sport in den beiden Zentralschweizer Kantonen Luzern und Zug. zentral+ berichtet über Sicherheitsaspekte, Fanarbeit und Jugendarbeit; im Fokus stehen dabei unter anderem der FCL und der EVZ.	
        {{ /if }}

        {{ if $gimme->section->number == 60 }}
        Hintergründe, Analysen und Nachrichten aus dem Bereich Freizeit in den beiden Zentralschweizer Kantonen Luzern und Zug. zentral+ liefert Ausgehtipps und Kinotipps, berichtet über Märkte und Dinge, die es sich zu kaufen lohnt. 
        {{ /if }}

        {{ if $gimme->section->number == 70 }}
        Hintergründe, Analysen und Nachrichten aus den Zentralschweizer Kantonen Luzern und Zug. +entral+ greift Themen auf zu technischen Erneuerungen, Innovationen und ökologischen Projekten. 
        {{ /if }}

        {{* DOSSIER *}}
        {{ if $gimme->section->number == 100 }}
        Hintergründe, Analysen und Nachrichten zu Politik, Gesellschaft, Wirtschaft, Sport, Kultur und Freizeit in den beiden Zentralschweizer Kantonen Luzern und Zug.  
        {{ /if }}

    {{ elseif $gimme->article->defined }}    
    
    		{{ if $gimme->article->lede|strip_tags:false !== "" }}
    			{{ $gimme->article->lede|strip_tags|escape:'html'|trim }}
    		{{ elseif $gimme->article->teaser|strip_tags:false !== "" }}
    			{{ $gimme->article->teaser|strip_tags|escape:'html'|trim }}
    		{{ else }}
    			{{ $gimme->article->body|strip_tags|escape:'html'|trim|truncate:150 }}
    		{{ /if }}
    		
    {{ /if }} 

{{ elseif $gimme->publication->identifier == 4 }}
		{{ if $gimme->template->name == "blogs.tpl" }}  

		{{ elseif $gimme->template->name == "section.tpl" }}
			{{ list_articles length="1" constraints="type is bloginfo" }}
				{{ $gimme->article->infolong|strip_tags|escape:'html'|trim }}
			{{ /list_articles }}

		{{ elseif $gimme->article->defined }}			
				{{ $gimme->article->lede|strip_tags|escape:'html'|trim }}	
		{{ /if }}    
{{ /if }}    
    {{ /strip }}">