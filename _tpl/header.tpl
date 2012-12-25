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
                        	<a class="button large fb-loggin-button" href="#"><span>Login mit Facebook</span></a>
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
                        	<li><a href="#">Home</a></li>
                        	<li><a href="#">Freizeit</a></li>
                        	<li><a href="#">Politik</a></li>
                        	<li><a href="#">Wissen</a></li>
                        	<li><a href="#">Wirtschaft</a></li>
                        	<li><a href="#">Dossiers</a></li>
                        	<li><a href="#">Kultur</a></li>
                        	<li><a href="#">Dialog</a></li>
                        	<li><a href="#">Gesellschaft</a></li>
                        	<li><a href="#">Blogs</a></li>
                        	<li><a href="#">Sport</a></li>
                        	<li><a href="#">Ausgehen</a></li>
                            <li><a href="#">Wetter</a></li>
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
        
          <ul class="weather">
              <li><img src="{{ uri static_file="pictures/icon-weather-1.png" }}" alt=""> 25° Luzern</li>
                <li><img src="{{ uri static_file="pictures/icon-weather-2.png" }}" alt=""> 18° Zug</li>
            </ul>
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
                        <a href="#" class="button large fb-loggin-button"><span>Login mit Facebook</span></a>
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
          <h2>{{ if $gimme->template->name == "front.tpl" }}Aktuell{{ elseif $gimme->template->name == "ticker.tpl" }}Ticker{{ elseif $gimme->topic->defined }}Thema: {{ $gimme->topic->name }}{{ elseif $gimme->publication->identifier == "2" }}{{ if $gimme->section->defined }}{{ $gimme->section->name }}{{ /if }}{{ else }}Blogs{{ /if }}</h2>
            <fieldset class="search">
              <input type="text" placeholder="Suchbegriff">
                <input type="submit" value="Go">
            </fieldset>
        
        </div><!-- / Content Top -->
