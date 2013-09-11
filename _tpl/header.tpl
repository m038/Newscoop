        <div id="header" class="clearfix">
        
        	<ul class="mobile-nav hide">
                {{ local }}
                    {{ set_section number="71" }}
                    <li class="calendar"><a href="{{ url options="section" }}">Ausgehen</a></li>
                {{ /local }}
            	<li class="user">
                    {{ if $gimme->user->logged_in }}
                	<a href="{{ $view->url(['controller' => 'dashboard', 'action' => 'index'], 'default') }}">Profil</a>
                    {{ else }}
                	<a href="#">User</a>
                   	<div class="mobile-sub popup popup-nletter">
                    	<div class="login-inner-box">
                            {{ form_login }}
                            <p>Melden Sie sich bei zentral+ an, um Artikel zu kommentieren und Themen zu abonnieren</p>
                            <fieldset>
                                <ul>
                                    <li>
                                        <input type="text" placeholder="E-Mail-Adresse" name="email">
                                    </li>
                                    <li>
                                        <input type="password" placeholder="Passwort" name="password">
                                    </li>
                                    <li>
                                        <input type="submit" value="Login" class="button red wide large">
                                    </li>
                                    <li class="checkboxes">
                                        <input type="checkbox" id="einloggt2"><label for="einloggt2">Eingeloggt bleiben</label>
                                    </li>
                                    <li class="side-by-side clearfix">
                                        <a href="{{ $view->url(['controller' => 'register', 'action' => 'index'], 'default') }}" class="button white left">Registrieren</a>
                                        <a href="#" class="button white right forgot-pass-trigger">Paswort vergessen</a>
                                    </li>
                                </ul>
                            </fieldset>
                            {{ /form_login }}
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
                    {{ /if }}
                </li>
            	<li class="menu">
                	<a href="#">Menu</a>
                	<div class="mobile-sub">
                        
                    <fieldset class="search">                   
                    {{ form_search_solr id="search" class="desktop-hide" }}
                    {{ foreach $smarty.get.type as $type }} 
    					 <input type="hidden" name="type[]" value="{{ $type|escape }}"> 
					{{ /foreach }}
            {{ $qVal = $smarty.get.q }}
            {{ if $qVal === "-title:Archive" }}
              {{ $qVal = "" }}
            {{ /if }}
  					{{ form_text name="q" value=$smarty.get.q placeholder="Suchbegriff" }}
  					{{ form_submit name="" value="Go" }}
					{{ /form_search_solr }}      
                    </fieldset>
                        
                        <ul>
                        {{ local }} 
              				{{ set_publication identifier="2" }}
                        	<li><a href="{{ url options="root_level" }}">Home</a></li>
                        {{ set_current_issue }}
                        {{ set_section number="10" }}
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
                        {{ set_section number="71" }}
                        	<li><a href="{{ url options="section" }}">Ausgehen</a></li>
                            <li><a href="#">Wetter</a></li>
						{{ list_articles length="1" ignore_publication="true" ignore_issue="true" ignore_section="true" constraints="type is archive" }}
              				<li><a href="{{ url options="article" }}">Archiv</a></li>
              			{{ /list_articles }}                            
                        {{ /local }}
                        </ul>
                    </div>
                </li>
            </ul>
            
            <!-- weather-header -->
            {{ render file="_tpl/weather-header.tpl" }} 

            <h1><a href="{{ local }}{{ set_publication identifier="2" }}{{ url options="publication" }}{{ /local }}">Das unabhängige Online-Magazin der Zentralschweiz</a></h1>
{{ dynamic }}
            <ul class="header-menu">
            {{ if $gimme->user->logged_in }}
              <li><a href="{{ $view->url(['controller' => 'my-topics', action => 'index'], 'default') }}" class="icon-tag">Meine Themen</a></li>
              <li><a href="{{ $view->url(['controller' => 'dashboard', 'action' => 'index'], 'default') }}">Profil</a></li>
              <li><a href="{{ $view->url(['controller' => 'auth', 'action' => 'logout'], 'default') }}">Abmelden</a></li>
            {{ else }}
              <li class="expandable">
                  <a href="#">Registrieren</a>
                  <div class="popup popup-register">
                    <p>Mit Ihrem Benutzerkonto können Sie Artikel kommentieren und mit anderen Leserinnen und Lesern in Kontakt treten.</p>
                      <p>Das Benutzerkonto ist kostenlos und kann jederzeit wieder gelöscht werden.</p>
                      <form method="get" action="/register">
                        <fieldset>
                          <ul>
                              <li>
                                  <label>Bitte geben Sie Ihre E-Mail Adresse ein.</label>
                                  <input type="text" name="proposed_email">
                                </li>
                                <li class="side-by-side">
                                  <a href="#" class="button white left">Nein, Danke</a>
                                  <input type="submit" class="button red right" value="Abschicken" />
                                </li>
                          </ul>
                        </fieldset>
                      </form>
                  </div>
                </li>
              <li class="expandable">
                  <a href="#">Anmelden</a>
                    <div class="popup popup-nletter">
                      {{ form_login }}
                      <p>Melden Sie sich bei zentral+ an, um Artikel zu kommentieren und Themen zu abonnieren</p>
                        <fieldset>
                          <ul>
                              <li>
                                  <label>E-Mail-Adresse</label>
                                  <input type="text" name="email">
                                </li>
                              <li>
                                  <label>Passwort</label>
                                  <input type="password" name="password">
                                </li>
                                <li>
                                  <input type="submit" class="button red wide large" value="Login">
                                </li>
                                <li class="checkboxes">
                                  <input type="checkbox" id="einloggt"> <label for="einloggt">Eingeloggt bleiben</label>
                                </li>
                                <li>
                                  <p><a href="{{ $view->url(['controller' => 'auth', 'action' => 'password-restore'], 'default') }}">Passwort vergessen</a></p>
                                </li>
                            </ul>
                        </fieldset>
                        {{ /form_login }}
                        <p class="center">oder</p>
                        <a href="{{ $view->url(['controller' => 'auth', 'action' => 'social', 'provider' => 'Facebook'], 'default') }}" class="button large fb-loggin-button"><span>Login mit Facebook</span></a>
                    </div>
                </li>
            {{ /if }}
            </ul>
{{ /dynamic }}
        </div><!-- / Header -->
        

{{ dynamic }}
        <div class="content-top">
          
            <ul class="place-date">
              <li class="mobile-hide">
                  <a href="#" class="place-trigger">{{ if $gimme->user['region'] == 'zug' }}Zug{{ elseif $gimme->user['region'] == 'luzern' }}Luzern{{ else }}Luzern und Zug{{ /if }}</a>
                    <div class="popup">
                      {{ if !$gimme->user->logged_in }}
                      <p>Mitglieder der Zentral+ Community können regionale Präferenzen setzen.<br />Bitte <a href="{{ $view->url(['controller' => 'auth', 'action' => 'index'], 'default') }}">melden Sie sich an</a>.</p>
                      {{ else }}
                      <p>Ihre regionale Präferenz <a href="{{ $view->url(['controller' => 'dashboard', 'action' => 'index'], 'default') }}">ändern</a>:</p>
                        <ul>
                          {{ if $gimme->user['region'] == 'zug' }}
                          <li><a>Ich bevorzuge Berichte aus der Region Zug</a></li>
                          {{ elseif $gimme->user['region'] == 'luzern' }}
                          <li><a>Ich bevorzuge Berichte aus der Region Luzern</a></li>
                          {{ else }}
                          <li><a>Ich habe keine Präferenzen</a></li>
                          {{ /if }}
                        </ul>
                      {{ /if }}
                    </div>
                </li>
                <li><span>{{ $smarty.now|camp_date_format:"%W, %e.%m.%Y" }}</span></li>
            </ul>
          <h2>{{block page_name}}{{ if $gimme->template->name == "front.tpl" }}<a href="{{ url options="root_level" }}">Aktuell</a>{{ elseif $gimme->article->name == "Archiv" }}{{ include file="_tpl/archive-date.tpl" }}{{ elseif $smarty.get.q }}Suchergebnisse{{ elseif $gimme->template->name == "ticker.tpl" }}Ticker{{ elseif $gimme->template->name == "404.tpl" }}Server Error 404{{ elseif $gimme->topic->defined }}Thema: {{ $gimme->topic->name }}{{ elseif $gimme->publication->identifier == "2" }}{{ if $gimme->article->type_name == "weather_page" }}<a href="/de/static/pages/11177/">Wetter{{ elseif $gimme->article->type_name == "editor_message" }}{{ $gimme->section->name }}{{ elseif $gimme->section->defined }}<a href="{{ url options="section" }}">{{ $gimme->section->name }}</a>{{ /if }}{{ else }}<a href="{{ url options="issue" }}">Blogs</a>{{ /if }}{{/block}}</h2>

                    <fieldset class="search">
                    
{{ form_search_solr id="search" class="hidden-phone" }}
  {{ foreach $smarty.get.type as $type }}
  	  <input type="hidden" name="type[]" value="{{ $type|escape }}">
  {{ /foreach }}
  {{ $qVal = $smarty.get.q }}
  {{ if $qVal == "-title:Archive" }}
    {{ $qVal = "" }}
  {{ /if }}
  
  {{ form_text name="q" value=$qVal placeholder="Suchbegriff" }}
  {{ form_submit name="" value="Go" }}
{{ /form_search_solr }}                    
                    </fieldset>
        
        </div><!-- / Content Top -->
{{ /dynamic }}
