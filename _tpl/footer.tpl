	<div class="wide-wrapper">
    
    	<div class="content-wrapper" id="footer">

{{ local }}        

        	<ul class="footer-list equal-heights clearfix">        	
            	<li>
            		{{ set_publication identifier="2" }}
            		{{ set_current_issue }}
            		{{ set_section number="300" }}
                	<h3>{{ $gimme->section->name }}</h3>
                    <ul>
                     {{ list_articles }}
                    	   <li><a href="{{ url options="article" }}">{{ $gimme->article->name }}</a></li>
                    	{{ /list_articles }}
                    </ul>

                </li>
                <li>
                	<h3>Themen</h3>
                    <ul>
                    		<!-- Delete asterisk (*) when link is created dynamically -->
                    	   <li><a href="#">Meine Themen*</a></li>
                    		{{ list_sections constraints="number smaller_equal 100 number not 71 number not 72 number not 73 number not 80" }}
                        <li><a href="{{ url options="section" }}">{{ $gimme->section->name }}</a></li>
                        {{ /list_sections }}
                        {{ list_articles ignore_issue="true" ignore_section="true" length="1" constraints="type is weather_page" }}
                        <li><a href="{{ url option="article"}}?pg=prognosen">Wetter</a></li>
                        {{ /list_articles }}
                    </ul>
                </li>               
                <li>
                	<h3>Dialog</h3>
                    <ul>
                    		{{ list_articles length="1" ignore_section="true" constraints="type is debatte" }}
                    		<li><a href="{{ url options="article" }}">Pro + Contra</a></li>
                    		{{ /list_articles }}
                        <li><a href="#">Umfrage*</a></li>
                 		   {{ set_publication identifier="4" }}
            				{{ set_current_issue }}
            				{{ set_section number="100" }}
                        <li><a href="{{ url options="section" }}">Fundstücke</a></li>
                        <li><a href="#">Kommentare*</a></li>
                        <li><a href="{{ $view->url(['controller' => 'user', 'action' => 'index'], 'default') }}">Community</a></li>
                    </ul>
                </li>                 
                <li>
                	<h3>Blogs</h3>
                    <ul>
                    		<li><a href="#">Agenda*</a></li>
                    		{{ list_articles ignore_publication="true" ignore_issue="true" ignore_section="true" constraints="type is bloginfo" }}
                        <li><a href="{{ url options="section" }}">{{ $gimme->article->name }}</a></li>
								{{ /list_articles }}
                    </ul>
                </li>              
				{{ /local }}                
				{{ local }}        	
                <li>
                	<h3>Ausgehen</h3>
                    <ul>

{{* events *}}
{{ set_publication identifier="2" }}
{{ set_issue number="10" }}
{{ set_section number="71" }}
                    	<li><a id="footer_all_link" href="{{ url options="section" }}?type=event&date={{ $smarty.now|camp_date_format:"%Y-%m-%d" }}&region=region-zentralschweiz">Alles</a></li>
{{* movies *}}
{{ set_publication identifier="2" }}
{{ set_issue number="10" }}
{{ set_section number="72" }}
                        <li><a id="footer_kino_link" href="{{ url options="section" }}?type=kino&date={{ $smarty.now|camp_date_format:"%Y-%m-%d" }}&region=region-zentralschweiz">Kino</a></li>
{{* events *}}
{{ set_publication identifier="2" }}
{{ set_issue number="10" }}
{{ set_section number="71" }}
                        <li><a id="footer_theater_link" href="{{ url options="section" }}?type=theater&date={{ $smarty.now|camp_date_format:"%Y-%m-%d" }}&region=region-zentralschweiz">Theater</a></li>
                        <li><a id="footer_musik_link" href="{{ url options="section" }}?type=concert&date={{ $smarty.now|camp_date_format:"%Y-%m-%d" }}&region=region-zentralschweiz">Konzerte</a></li>
                        <li><a id="footer_party_link" href="{{ url options="section" }}?type=party&date={{ $smarty.now|camp_date_format:"%Y-%m-%d" }}&region=region-zentralschweiz">Partys</a></li>
                        <li><a id="footer_ausstellung_link" href="{{ url options="section" }}?type=exhibit&date={{ $smarty.now|camp_date_format:"%Y-%m-%d" }}&region=region-zentralschweiz">Ausstellungen</a></li>
                        <li><a id="footer_andere_link" href="{{ url options="section" }}?type=misc&date={{ $smarty.now|camp_date_format:"%Y-%m-%d" }}&region=region-zentralschweiz">Diverse</a></li>
{{* restaurants *}}
{{ set_publication identifier="2" }}
{{ set_issue number="10" }}
{{ set_section number="73" }}
                        <li><a id="footer_restaurants_link" href="{{ url options="section" }}?type=all&date={{ $smarty.now|camp_date_format:"%Y-%m-%d" }}&region=region-zentralschweiz">Restaurants</a></li>
                    </ul>
                </li>                
                <li>
                	<h3>Folgen Sie uns</h3>
                    <ul class="social">
                    	<li class="facebook"><a target="_blank" href="http://www.facebook.com/zentralplus">Facebook</a></li>
                        <li class="twitter"><a target="_blank" href="https://twitter.com/zentralplus">Twitter</a></li>
                        <li class="vimeo"><a target="_blank" href="https://vimeo.com/zentralplus">Vimeo</a></li>
                    </ul>
                </li>
            </ul><!-- / Footer list -->
            <p class="foot-copyright"><a target="_blank" href="http://www.mmv-online.ch">© MMV online AG - Alle Rechte vorbehalten</a></p>

            <ul class="phone-footer-nav">
               {{ set_article name="Kontakt" }}
            	<li><a href="{{ url options="article" }}">Kontakt</a></li>
            	{{ set_article name="Impressum" }}
            	<li><a href="{{ url options="article" }}">Impressum</a></li>
            	{{ set_article name="AGB" }}
            	<li><a href="{{ url options="article" }}">AGB</a></li>
            </ul>

{{ /local }}
            
        </div><!-- / Content wrapper Footer -->
    
    </div><!-- / Wide wrapper -->
