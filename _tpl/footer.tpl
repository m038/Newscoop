	<div class="wide-wrapper">
    
    	<div class="content-wrapper" id="footer">
        
        	<ul class="footer-list equal-heights clearfix">
            	{{ local }}        	
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
                    		<!-- Delete asterisk (*) when link is created -->
                    	   <li><a href="#">Meine Themen*</a></li>
                    		{{ list_sections constraints="number smaller_equal 100 number not 71 number not 72 number not 73 number not 80" }}
                        <li><a href="{{ url options="section" }}">{{ $gimme->section->name }}</a></li>
                        {{ /list_sections }}
                        <li><a href="#">Wetter*</a></li>
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
                        <li><a href="#">Community*</a></li>
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
                <li>
                	<h3>Ausgehen</h3>
                    <ul>

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
                    </ul>
                </li>
					 {{ /local }}                
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
            <p><a href="http://www.mmv-online.ch">© MMVonline AG - Alle Rechte vorbehalten</a></p>

            <ul class="phone-footer-nav">
            	<li><a href="#">Kontakt</a></li>
            	<li><a href="#">Impressum</a></li>
            	<li><a href="#">AGB</a></li>
            </ul>
            
        </div><!-- / Content wrapper Footer -->
    
    </div><!-- / Wide wrapper -->