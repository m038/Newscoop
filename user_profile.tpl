{{extends file="layout.tpl"}}

{{block page_name}}Community{{/block}}

{{block content_wrapper}}
		<div class="content no-bottom-line equal-heights clearfix">
        
        	<div class="main">
            
            	<article class="profile-single clearfix">
                    {{ include file="_tpl/user-image.tpl" size="big" class="left" }}
                    <div class="inner">
                        <h3>{{ $user->uname|escape }}</h3>
                        <p>{{ $user['bio']|escape }}</p>
                        <span class="small-type">
                            <p>
                            {{ if $user['facebook'] }}Facebook: www.facebook.com/{{ $user['facebook']|escape }}<br />{{ /if }}
                            {{ if $user['website'] }}Webseite: {{ $user['website']|escape }}<br />{{ /if }}
                            In der zentral+ Community seit: {{ $user->created }}</p>
                        </span>
                        {{*
                        <p>
                            <a href="#" class="icon-email-big">ulfnotulf eine Nachricht senden</a><br />
                            <a href="#" class="button white">Pro"l verwalten</a>
                        </p>
                        *}}
                    </div>
                
                </article>
                
                <div class="comment-content profile-comments">
                
                	<h3>2 Beiträge</h3>
                
                	<ol>
                        <li>
                            <ul class="comment-likes">
                                <li class="dislike"><a href="#">Like</a>3</li>
                                <li class="status"><span class="dislikes"><i style="width:30%"></i></span><span class="likes"><i style="width:50%"></i></span></li>
                                <li class="like">5<a href="#">Dislike</a></li>
                                <li class="report"><a href="#">Report</a></li>
                            </ul>
                            <h5>In dieselbe Richtung zielt die Kritik von Greenpeace.</h5>
                            <time>von Klaus M um 17.9.2012 um 10:07 Uhr</time>
                            <p>Mit dem Weiterbetrieb des AKW Mühleberg wird gegen Grundregeln der nuklearen Sicherheit verstossen! Muss wirklich erst ein Unfall mit radioaktiver Verstrahlung der Bundeshauptstadt passieren, bis die Verantwortlichen einsichtig werden? Nach Swissair und UBS, wo jeweils auch Grundregeln solider Geschä!sführung verletzt wurden, wäre das dann die 3. und schlimmste Katastrophe! Es ist einfach unglaublich.</p>
                            <small>zu <a href="#">AKW Mühlenberg</a></small>
                        </li>
                        <li>
                            <ul class="comment-likes">
                                <li class="dislike"><a href="#">Like</a>3</li>
                                <li class="status"><span class="dislikes"><i style="width:30%"></i></span><span class="likes"><i style="width:50%"></i></span></li>
                                <li class="like">5<a href="#">Dislike</a></li>
                                <li class="report"><a href="#">Report</a></li>
                            </ul>
                            <h5>AKW Mühleberg</h5>
                            <time>von Klaus M um 17.9.2012 um 10:07 Uhr</time>
                            <p>Mit dem Weiterbetrieb des AKW Mühleberg wird gegen Grundregeln der nuklearen Sicherheit verstossen! Muss wirklich erst ein Unfall mit radioaktiver Verstrahlung der Bundeshauptstadt passieren, bis die Verantwortlichen einsichtig werden? Nach Swissair und UBS, wo jeweils auch Grundregeln solider Geschä!sführung verletzt wurden, wäre das dann die 3. und schlimmste Katastrophe! Es ist einfach unglaublich.</p>
                            <small>zu <a href="#">AKW Mühlenberg</a></small>
                        </li>
                        <li>
                            <ul class="comment-likes">
                                <li class="dislike"><a href="#">Like</a>3</li>
                                <li class="status"><span class="dislikes"><i style="width:30%"></i></span><span class="likes"><i style="width:50%"></i></span></li>
                                <li class="like">5<a href="#">Dislike</a></li>
                                <li class="report"><a href="#">Report</a></li>
                            </ul>
                            <h5>AKW Mühleberg</h5>
                            <time>von Klaus M um 17.9.2012 um 10:07 Uhr</time>
                            <p>Mit dem Weiterbetrieb des AKW Mühleberg wird gegen Grundregeln der nuklearen Sicherheit verstossen! Muss wirklich erst ein Unfall mit radioaktiver Verstrahlung der Bundeshauptstadt passieren, bis die Verantwortlichen einsichtig werden? Nach Swissair und UBS, wo jeweils auch Grundregeln solider Geschä!sführung verletzt wurden, wäre das dann die 3. und schlimmste Katastrophe! Es ist einfach unglaublich.</p>
                            <small>zu <a href="#">AKW Mühlenberg</a></small>
                        </li>
                    </ol>
                
                </div>
            
            </div><!-- / Main -->
            
            <div class="aside phone-hide">
            
            	<div class="box highlight-box">
                
                	<h4 class="box-title icon-cross"><a href="#">zentral+ Community</a></h4>
                    <div class="community-box clearfix">
                    	<div class="mobile-half">
                            <ul class="community-list bottom-line">
                                <li class="comment">Neuer Kommentar zu „Massive Zunahme von Baugesuchen“.</li>
                                <li class="comment">Neuer Kommentar zu „Schneller und radikaler“.</li>
                                <li class="comment">Neuer Kommentar zu „Für einmal freiwillig Spitallu" schnuppern“.</li>
                                <li class="user">Urs Meyer ist neues Mitglied</li>
                                <li class="comment">Neuer Kommentar zu „Weiterer Erfolg für Mühleberg-Gegner“.</li>
                            </ul>
                            <p><a href="#">zur Community</a></p>
                            <p class="bottom-line">Die zentral+ Community hat bereits 1.245 Mitglieder.</p>
                        </div>
                        <div class="mobile-half last">
                            <blockquote>Muss erst ein Unfall passieren, bis die Verantwortlichen einsichtig werden?</blockquote>
                            <cite>Klaus M. zu <a href="#">Weiterer Erfolg</a> für <a href="#">Mühleberg-Gegner</a></cite>
                        </div>
                    </div>
                    <a href="#" class="button red center">Jetzt mitmachen</a>
                
                </div>
            
            </div><!-- / Aside -->
        
        </div>
    
    </div><!-- / Content Wrapper -->

{{/block}}
