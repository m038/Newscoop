        <div id="header" class="clearfix">
        
        	<ul class="mobile-nav hide">
            	<li class="calendar"><a href="#">Calendar</a></li>
            	<li class="user">
                	<a href="#">User</a>
                   	<div class="mobile-sub popup popup-nletter">
                    	<div class="login-inner-box">
                            <p>Melden Sie sich bei zentral+ an, um Artikel zu kommentieren und Themen zu abonnieren</p>
                            <fieldset>
                                <ul>
                                    <li>
                                        <input type="text" placeholder="E-Mail-Adresse">
                                    </li>
                                    <li>
                                        <input type="password" placeholder="Passwort">
                                    </li>
                                    <li>
                                        <input type="submit" value="Login" class="button red wide large">
                                    </li>
                                    <li class="checkboxes">
                                        <input type="checkbox" id="einloggt2"><label for="einloggt2">Eingeloggt bleiben</label>
                                    </li>
                                    <li class="side-by-side clearfix">
                                        <a href="#" class="button white left">Registrieren</a>
                                        <a href="#" class="button white right forgot-pass-trigger">Paswort vergessen</a>
                                    </li>
                                </ul>
                            </fieldset>
                        	<a class="button large fb-loggin-button" href="{{ $view->url(['controller' => 'auth', 'action' => 'social', 'provider' => 'facebook']) }}"><span>Login mit Facebook</span></a>
                        </div>
                        <div class="forgot-pass-inner-box">
                        	<p>Mit Ihrem Benutzerkonto können Sie Artikel kommentieren und mit anderen Leserinnen undLesern in Kontakt treten.</p>
                            <p>Das Benutzerkonto ist kostenlos und kann jederzeit wieder gelöscht werden.</p>
                            <fieldset>
                                <ul>
                                    <li>
                                        <input type="text" placeholder="Ihre E-Mail-Adresse">
                                    </li>
                                    <li class="side-by-side clearfix">
                                        <a href="#" class="button white left login-back-trigger">Nein, Danke</a>
                                        <input type="submit" class="button red right" value="Abschicken">
                                    </li>
                                </ul>
                            </fieldset>
                        </div>
                    </div>
                </li>
            	<li class="menu">
                	<a href="#">Menu</a>
                	<div class="mobile-sub">
                    	<fieldset class="search">
                            <input type="text" placeholder="Suchbegriff">
                            <input type="submit" value="Go">
                        </fieldset>
                        <ul>
                        {{ local }} 
              				{{ set_publication identifier="2" }}
                        	<li><a href="{{ url options="root_level" }}">Home</a></li>
                        {{ set_current_issue }}
                        {{ set_section number="60" }}
                        	<li><a href="{{ url options="section" }}">{{ $gimme->section->name }}</a></li>
                        {{ set_section number="10" }}
                        	<li><a href="{{ url options="section" }}">{{ $gimme->section->name }}</a></li>
                        {{ set_section number="70" }}
                        	<li><a href="{{ url options="section" }}">{{ $gimme->section->name }}</a></li>
                        {{ set_section number="20" }}
                        	<li><a href="{{ url options="section" }}">{{ $gimme->section->name }}</a></li>
                        {{ set_section number="100" }}
                        	<li><a href="{{ url options="section" }}">{{ $gimme->section->name }}</a></li>
                        {{ set_section number="30" }}
                        	<li><a href="{{ url options="section" }}">{{ $gimme->section->name }}</a></li>
                        {{ set_section number="90" }}
                        	<li><a href="{{ url options="section" }}">{{ $gimme->section->name }}</a></li>
                        {{ set_section number="40" }}
                        	<li><a href="{{ url options="section" }}">{{ $gimme->section->name }}</a></li>
                        {{ set_publication identifier="4" }}
                        {{ set_current_issue }}
                        	<li><a href="{{ url options="issue" }}">{{ $gimme->issue->name }}</a></li>
                        {{ set_publication identifier="2" }}
                        {{ set_current_issue }}                        
                        {{ set_section number="50" }}
                        	<li><a href="{{ url options="section" }}">{{ $gimme->section->name }}</a></li>	
                        {{ set_section number="71" }}
                        	<li><a href="{{ url options="section" }}">Ausgehen</a></li>
                            <li><a href="#">Wetter</a></li>
                        {{ /local }}
                        </ul>
                        <div class="region-pick">
                            <label>Region:</label>
                            <select class="dropdownized">
                                <option>Keine Praferenzen</option>
                                <option>2</option>
                                <option>3</option>
                            </select>
                        </div>
                    </div>
                </li>
            </ul>
<!--
          <ul class="weather">
                <li class="expandable">
                    <a href="#">
                        {{ weather location="luzern" }}
                        {{ weather location="zug" }}
                    </a>
                    <div class="popup">
                        <div class="weather-popup clearfix">
                            <div class="info">
                                <p><strong>Das Wetter heute in Luzern</strong> <a href="#" class="button white">Details</a></p>
                                <ul>
                                    <li>
                                        <small>12:00</small>
                                        {{ weather location="luzern" hour="12" }}
                                    </li>
                                    <li>
                                        <small>15:00</small>
                                        {{ weather location="luzern" hour="15" }}
                                    </li>
                                    <li>
                                        <small>18:00</small>
                                        {{ weather location="luzern" hour="18" }}
                                    </li>
                                    <li>
                                        <small>21:00</small>
                                        {{ weather location="luzern" hour="21" }}
                                    </li>
                                    <li>
                                        <small>00:00</small>
                                        {{ weather location="luzern" hour="0" }}
                                    </li>
                                </ul>
                                <p><strong>Das Wetter heute in Zug</strong> <a href="#" class="button white">Details</a></p>
                                <ul>
                                    <li>
                                        <small>12:00</small>
                                        {{ weather location="zug" hour="12" }}
                                    </li>
                                    <li>
                                        <small>15:00</small>
                                        {{ weather location="zug" hour="15" }}
                                    </li>
                                    <li>
                                        <small>18:00</small>
                                        {{ weather location="zug" hour="18" }}
                                    </li>
                                    <li>
                                        <small>21:00</small>
                                        {{ weather location="zug" hour="21" }}
                                    </li>
                                    <li>
                                        <small>00:00</small>
                                        {{ weather location="zug" hour="0" }}
                                    </li>
                                </ul>
                            </div>
                            <div class="sidebar">
                                <fieldset class="search">
                                    <input type="text" placeholder="Ort, PLZ, Ausflugsziel">
                                    <input type="submit" value="Go">
                                </fieldset>
                                <p>Geben Sie hier einen Ort oder Region nach Wunsch in der Zentralschweiz ein</p>
                                <ul>
                                    <li><a href="#">Prognosen Zentralschweiz</a></li>
                                    <li><a href="#">Lokalwetter</a></li>
                                    <li><a href="#">Pistenbericht</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </li>
            </ul>
-->

            <h1><a href="{{ local }}{{ set_publication identifier="2" }}{{ url options="publication" }}{{ /local }}">Das unabhängige OnlineMagazin der Zentralschweiz</a></h1>
            <ul class="header-menu">
              <li><a href="#" class="icon-tag">Meine Themen</a></li>
              <li class="expandable">
                  <a href="#">Registrieren</a>
                    <div class="popup popup-register">
                      <p>Mit Ihrem Benutzerkonto können Sie Artikel kommentieren und mit anderen Leserinnen und Lesern in Kontakt treten.</p>
                        <p>Das Benutzerkonto ist kostenlos und kann jederzeit wieder gelöscht werden.</p>
                        <fieldset>
                          <ul>
                              <li>
                                  <label>Bitte geben Sie Ihre E-Mail Adresse ein.</label>
                                  <input type="text">
                                </li>
                                <li class="side-by-side">
                                  <a href="#" class="button white left">Nein, Danke</a>
                                    <a href="#" class="button red right">Abschicken</a>
                                </li>
                          </ul>
                        </fieldset>
                    </div>
                </li>
              <li class="expandable">
                  <a href="#">Anmelden</a>
                    <div class="popup popup-nletter">
                      <p>Melden Sie sich bei zentral+ an, um Artikel zu kommentieren und Themen zu abonnieren</p>
                        <fieldset>
                          <ul>
                              <li>
                                  <label>E-Mail-Adresse</label>
                                  <input type="text">
                                </li>
                              <li>
                                  <label>Passwort</label>
                                  <input type="password">
                                </li>
                                <li>
                                  <input type="submit" class="button red wide large" value="Login">
                                </li>
                                <li class="checkboxes">
                                  <input type="checkbox" id="einloggt"> <label for="einloggt">Eingeloggt bleiben</label>
                                </li>
                                <li>
                                  <p><a href="#">Registrieren</a><br>
                                    <a href="#">Passwort vergessen</a></p>
                                </li>
                            </ul>
                        </fieldset>
                        <p class="center">oder</p>
                        <a href="{{ $view->url(['controller' => 'auth', 'action' => 'social', 'provider' => 'Facebook'], 'default') }}" class="button large fb-loggin-button"><span>Login mit Facebook</span></a>
                    </div>
                </li>
            </ul>
        
        </div><!-- / Header -->
        
        <div class="content-top">
          
            <ul class="place-date">
              <li>
                  <a href="#" class="place-trigger">Luzern und Zug</a>
                    <div class="popup">
                      <p>Wählen Sie Ihre Region:</p>
                        <ul>
                          <li><a href="#">Ich bevorzuge Berichte aus der Region Luzern</a></li>
                          <li><a href="#">Ich bevorzuge Berichte aus der Region Zug</a></li>
                          <li><a href="#">Ich habe keine Präferenzen</a></li>
                        </ul>
                    </div>
                </li>
                <li><span>{{ $smarty.now|camp_date_format:"%W, %e.%m.%Y" }}</span></li>
            </ul>
          <h2>{{block page_name}}{{ if $gimme->template->name == "front.tpl" }}Aktuell{{ elseif $gimme->template->name == "search.tpl" }}Search results: {{ $gimme->search_articles_action->search_phrase }}{{ elseif $gimme->template->name == "ticker.tpl" }}Ticker{{ elseif $gimme->topic->defined }}Thema: {{ $gimme->topic->name }}{{ elseif $gimme->publication->identifier == "2" }}{{ if $gimme->section->defined }}{{ $gimme->section->name }}{{ /if }}{{ else }}Blogs{{ /if }}{{/block}}</h2>

                    <fieldset class="search">
                    {{ search_form template="search.tpl" submit_button="Go" }} 
                    {{ camp_edit object="search" attribute="keywords" html_code="placeholder=\"Suchbegriff\"" }}
                    {{ /search_form }} 
                    </fieldset>
        
        </div><!-- / Content Top -->
