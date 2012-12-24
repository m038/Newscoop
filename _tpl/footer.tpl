	<div class="wide-wrapper">
    
    	<div class="content-wrapper" id="footer">
        
        	<ul class="footer-list equal-heights clearfix">
            	<li>
            		{{ local }}
            		{{ set_publication identifier="2" }}
            		{{ set_current_issue }}
            		{{ set_section number="300" }}
                	<h3>{{ $gimme->section->name }}</h3>
                    <ul>
                     {{ list_articles }}
                    	   <li><a href="{{ url options="article" }}">{{ $gimme->article->name }}</a></li>
                    	{{ /list_articles }}
                    </ul>
                  {{ /local }}
                </li>
                <li>
                	<h3>Themen</h3>
                    <ul>
                    	<li><a href="#">Meine Themen</a></li>
                        <li><a href="#">Politik</a></li>
                        <li><a href="#">Wirtscha</a></li>
                        <li><a href="#">Kultur</a></li>
                        <li><a href="#">Gesellscha</a></li>
                        <li><a href="#">Sport</a></li>
                        <li><a href="#">Freizeit</a></li>
                        <li><a href="#">Wissen</a></li>
                        <li><a href="#">Dossiers</a></li>
                        <li><a href="#">Wetter</a></li>
                    </ul>
                </li>
                <li>
                	<h3>Dialog</h3>
                    <ul>
                    	<li><a href="#">Pro + Contra</a></li>
                        <li><a href="#">Umfrage</a></li>
                        <li><a href="#">Fundstücke</a></li>
                        <li><a href="#">Kommentare</a></li>
                        <li><a href="#">Community</a></li>
                    </ul>
                </li>
                <li>
                	<h3>Blogs</h3>
                    <ul>
                    	<li><a href="#">Agenda</a></li>
                        <li><a href="#">Was gibt’s wo</a></li>
                        <li><a href="#">Olympiablog</a></li>
                        <li><a href="#">GO FC Luzern</a></li>
                        <li><a href="#">Analog und Digital</a></li>
                        <li><a href="#">Netzgemeinde</a></li>
                        <li><a href="#">Freizeitblog</a></li>
                        <li><a href="#">Fotoblog</a></li>
                    </ul>
                </li>
                <li>
                	<h3>Ausgehen</h3>
                    <ul>
{{ local }}
{{* events *}}
{{ set_current_issue }}
{{ set_section number="71" }}
                    	<li><a id="footer_all_link" href="{{ uri options="section" }}?type=event&date={{ $smarty.now|camp_date_format:"%Y-%m-%d" }}&region=region-zentralschweiz">Alles</a></li>
{{* movies *}}
{{ set_current_issue }}
{{ set_section number="72" }}
                        <li><a id="footer_kino_link" href="{{ uri options="section" }}?type=kino&date={{ $smarty.now|camp_date_format:"%Y-%m-%d" }}&region=region-zentralschweiz">Kino</a></li>
{{* events *}}
{{ set_current_issue }}
{{ set_section number="71" }}
                        <li><a id="footer_theater_link" href="{{ uri options="section" }}?type=theater&date={{ $smarty.now|camp_date_format:"%Y-%m-%d" }}&region=region-zentralschweiz">Theater</a></li>
                        <li><a id="footer_musik_link" href="{{ uri options="section" }}?type=concert&date={{ $smarty.now|camp_date_format:"%Y-%m-%d" }}&region=region-zentralschweiz">Konzerte</a></li>
                        <li><a id="footer_party_link" href="{{ uri options="section" }}?type=party&date={{ $smarty.now|camp_date_format:"%Y-%m-%d" }}&region=region-zentralschweiz">Partys</a></li>
                        <li><a id="footer_ausstellung_link" href="{{ uri options="section" }}?type=exhibit&date={{ $smarty.now|camp_date_format:"%Y-%m-%d" }}&region=region-zentralschweiz">Ausstellungen</a></li>
                        <li><a id="footer_andere_link" href="{{ uri options="section" }}?type=misc&date={{ $smarty.now|camp_date_format:"%Y-%m-%d" }}&region=region-zentralschweiz">Diverse</a></li>
{{* restaurants *}}
{{ set_current_issue }}
{{ set_section number="73" }}
                        <li><a id="footer_restaurants_link" href="{{ uri options="section" }}?type=all&date={{ $smarty.now|camp_date_format:"%Y-%m-%d" }}&region=region-zentralschweiz">Restaurants</a></li>
{{ /local }}
                    </ul>
                </li>
                <li>
                	<h3>Folgen Sie uns</h3>
                    <ul class="social">
                    	<li class="facebook"><a href="#">Facebook</a></li>
                        <li class="twitter"><a href="#">Twitter</a></li>
                        <li class="vimeo"><a href="#">Vimeo</a></li>
                        <li class="nletter"><a href="#">Newsletter</a></li>
                    </ul>
                </li>
            </ul><!-- / Footer list -->
            <p>zentral+ ist ein Projekt der MMV online AG – Medien, Meinung, Vielfalt</p>

            <ul class="phone-footer-nav">
            	<li><a href="#">Kontakt</a></li>
            	<li><a href="#">Impressum</a></li>
            	<li><a href="#">AGB</a></li>
            </ul>
            
        </div><!-- / Content wrapper Footer -->
    
    </div><!-- / Wide wrapper -->