    <meta name="keywords" content="{{ strip }}
    {{ if $gimme->publication->identifier == 2 }}
    		{{ if $gimme->template->name == "front.tpl" }}
    		Zentral+, Zentralplus, Luzern, Zug, Zentralschweiz, Hintergrund, Analyse, News, Region, Stadt, Kanton, Nachrichten, Politik, Wirtschaft, Gesellschaft, Sport, Kultur, Freizeit, Wissen, Wetter, Presse, Medien, Online Journal, online Medien, Gemeinde, Blogs, FCL Blog, EVZ Blog, online, Zeitung, Zuger Zeitung, Luzerner Zeitung, neue, aktuell,  Ausgehen, zentral-+, infozentral
    		{{ elseif $gimme->template->name == "section.tpl" }}
        {{* STANDARD SECTIONS *}}
        {{ if $gimme->section->number == 10 }}
        Luzern, Zug, Stadt, Kanton, Gemeinde, Zentralschweiz, Politik, Regierungsrat, Stadtrat, Regierung, Kantonsrat, Grosser Gemeinderat, GGR, Grosser Stadtrat, Steuern, Raumplanung, Verkehr, Sozialwesen, Gesundheit, Asyl, Bildung, Budget, Rechnung, sparen, erhöhen, Kommission, Vorlage, Geschäft, Beschluss, Behörden, Parteien
        {{ /if }}

        {{ if $gimme->section->number == 20 }}
        Luzern, Zug, Wirtschaft, Steuern, Wirtschaftsstandort, Wettbewerb, Steuerwettbewerb, Zentralschweiz, Nationaler Finanzausgleich, NFA, Armut, Geld, Reichtum, Mittelstand, Oberschicht, Unterschicht 
        {{ /if }}

        {{ if $gimme->section->number == 30 }}
        Luzern, Zug, Kultur, Subvention, Kulturförderung, Kulturkalender, KKL, Theater Casino Zug, Zentralschweiz, Kulturkonkordat, Geld, Aufführungen, Bühne
        {{ /if }}

        {{ if $gimme->section->number == 40 }}
        Luzern, Zug, Gesellschaft, Familie, soziale Durchmischung, soziales Gefüge, Sozialstaat, alleinerziehend, familienergänzende Betreuung, ausserfamiliäre Betreuung, Rentner, Senioren, Jugendgewalt, Jugend, Aggression, Armut, Mittelstand 
        {{ /if }}

        {{ if $gimme->section->number == 50 }}
        Luzern, Zug, Zentralschweiz, Sport, Fussball, Eishockey, FCL, EVZ, Fan, Chaoten, Krawalle, Ausschreitungen, Stadion, Spiel, Match	
        {{ /if }}

        {{ if $gimme->section->number == 60 }}
        Luzern, Zug, Zentralschweiz, Ausgehen, Freizeit, Restaurant, Bar, Kino, Theater, Musik, Konzert, Tipps, Kulturkalender, Märkte, Club, kaufen, tanzen 
        {{ /if }}

        {{ if $gimme->section->number == 70 }}
        Luzern, Zug, Zentralschweiz, Wissen, Hintergrund, Analyse, Industrie, Dienstleistung, Technik, Natur, Ökologie, Umwelt, Energie, sparen, Rohstoffe, Tierwelt, Flora, Fauna, Physik, Chemie, Naturwissenschaften 
        {{ /if }}

        {{* DOSSIER *}}
        {{ if $gimme->section->number == 100 }}
        Luzern, Zug, Zentralschweiz, Dossier, Verkehr, Asylwesen, Bildung, Steuern, Steuerwettbewerb, Nationaler Finanzausgleich, Raumplanung, Verkehrsplanung, soziale Durchmischung, Sozialstruktur, Kultur, Politik, Gesellschaft, Sport, Wirtschaft  
        {{ /if }}    		
    		{{ elseif $gimme->article->defined }}
    		
    		{{ /if }}
    {{ elseif $gimme->publication->identifier == 4 }}
    
    {{ /if }}
    {{ /strip }}">