{{ include file="_tpl/_html-head.tpl" }}

<body>

  <div class="content-wrapper">
    
{{ include file="_tpl/header-nav.tpl" }}
        
{{ include file="_tpl/header.tpl" }}

{{ list_articles length="1" constraints="type is bloginfo" }}
		<div class="photo-blog-top clearfix">
        	<h2>{{ $gimme->article->name }}</h2>
            <p><img src="{{ uri static_file="pictures/title-icons/camera.png" }}" alt="" />{{ $gimme->article->motto }}</p>
        	<a href="#" class="button red right">Bild vorschlagen</a>
        </div>
{{ /list_articles }}
        
        <div class="content clearfix photo-blog-single">
        
        	<article>
        
                <header>
                    <h3>{{ $gimme->article->name }}</h3>
                    <p><time>20.9.2012, 9:02</time> <a href="#" class="comm red">3 Kommentare</a></p>
                </header>
                {{ $gimme->article->body }}
            </article>
            
            <div class="box back-link bottom-line top-line">
                <a class="button white prev" href="#">‹</a> <a href="#">zur Ubersicht Film</a>
            </div>
            
            <div class="social-bar clearfix">
                
                <ul class="soc-options left">
                    <li class="fb"><a href="#">Facebook</a></li>
                    <li class="tw"><a href="#">Twitter</a></li>
                    <li class="gplus"><a href="#">Google+</a></li>
                    <li class="activate"><a href="#">Social-Media Dienste aktivieren</a></li>
                </ul>
                
                <ul class="article-options right">
                    <li class="email"><a href="#">Email</a></li>
                    <li class="print"><a href="#">Print</a></li>
                </ul>
            
            </div>
        
        </div>
    
    </div><!-- / Content Wrapper -->
    
    <div class="wide-wrapper internal-wrapper">
    
    	<div class="content-wrapper">
        
        	<div class="content bottom-line clearfix">
        
                <div class="main no-line">
                
                	<div class="tabs margin-bottom comment-box">
                    
                    	<ul class="tab-nav clearfix">
                        	<li><a href="#comm-1"><strong>Ausgewählte Kommentare</strong> (2)</a></li>
                        	<li><a href="#comm-2"><strong>Alle Kommentare</strong> (3)</a></li>
                        </ul>
                        
                        <div class="comment-content">
                            <div id="comm-1">
                                <ol>
                                    <li>
                                    	<img src="pictures/user-thumb-small-default.jpg" alt="" />
                                        <h5>AKW Muhleberg</h5>
                                        <time>von Klaus M um 17.9.2012 um 10:07 Uhr</time>
                                        <p>Mit dem Weiterbetrieb des AKW Mühleberg wird gegen Grundregeln der nuklearen Sicherheit verstossen! Muss wirklich erst ein Unfall mit radioaktiver Verstrahlung der Bundeshauptstadt passieren, bis die Verantwortlichen einsichtig werden? Nach Swissair und UBS, wo jeweils auch Grundregeln solider Geschä!sführung verletzt wurden, wäre das dann die 3. und schlimmste Katastrophe! Es ist einfach unglaublich.</p>                                    </li>
                                    <li>
                                    	<img src="pictures/user-thumb-small-default.jpg" alt="" />
                                        <h5>AKW Mühleberg</h5>
                                        <time>von Klaus M um 17.9.2012 um 10:07 Uhr</time>
                                        <p>Mit dem Weiterbetrieb des AKW Mühleberg wird gegen Grundregeln der nuklearen Sicherheit verstossen! Muss wirklich erst ein Unfall mit radioaktiver Verstrahlung der Bundeshauptstadt passieren, bis die Verantwortlichen einsichtig werden? Nach Swissair und UBS, wo jeweils auch Grundregeln solider Geschä!sführung verletzt wurden, wäre das dann die 3. und schlimmste Katastrophe! Es ist einfach unglaublich.</p>
                                    </li>
                                </ol>
                                <a href="#" class="button red center">Kommentieren</a>
                            </div>
                            <div id="comm-2">
                                <ol>
                                    <li>
                                    	<img src="pictures/user-thumb-small-default.jpg" alt="" />
                                        <h5>AKW asdasdas</h5>
                                        <time>von Klaus M um 17.9.2012 um 10:07 Uhr</time>
                                        <p>Mit dem Weiterbetrieb des AKW Mühleberg wird gegen Grundregeln der nuklearen Sicherheit verstossen! Muss wirklich erst ein Unfall mit radioaktiver Verstrahlung der Bundeshauptstadt passieren, bis die Verantwortlichen einsichtig werden? .</p>
                                    </li>
                                    <li>
                                    	<img src="pictures/user-thumb-small-default.jpg" alt="" />
                                        <h5>AKW Mühleberg</h5>
                                        <time>von Klaus M um 17.9.2012 um 10:07 Uhr</time>
                                        <p>Mit dem Weiterbetrieb des AKW Mühleberg wird gegen Grundregeln der nuklearen Sicherheit verstossen! Muss wirklich erst ein Unfall mit radioaktiver Verstrahlung der Bundeshauptstadt passieren, bis die Verantwortlichen einsichtig werden? Nach Swissair und UBS, wo jeweils auch Grundregeln solider Geschä!sführung verletzt wurden, wäre das dann die 3. und schlimmste Katastrophe! Es ist einfach unglaublich.</p>
                                    </li>
                                </ol>
                                <a href="#" class="button red center">Kommentieren</a>
                            </div>
                        </div>
                    
                    </div>
                
                </div>
                
                <div class="aside">
                
                    <div class="ad">
                        <small>Werbung</small>
                        <a href="#"><img src="pictures/ad-3.jpg" alt="" /></a>
                    </div>
                
                </div>
                
            </div>
        
        </div>
        
    </div>

{{ include file="_tpl/footer.tpl" }}
  
{{ include file="_tpl/_html-foot.tpl" }}  

</body>
</html>
