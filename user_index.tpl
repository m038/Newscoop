{{ include file="_tpl/_html-head.tpl" }}

<body>

	<div class="content-wrapper">
    
{{ include file="_tpl/header-nav.tpl" }}
        
{{ include file="_tpl/header.tpl" }}
    
    	<div class="content-wrapper events-content community-mobile-fix">
        
        	<div class="inner-search">
            	<fieldset class="search">
                    <input type="text" placeholder="Benutzername oder Name">
                    <input type="submit" value="Go">
                </fieldset>
            </div>
        
        	<div class="content no-bottom-line equal-heights clearfix">
            
            	<div class="events-aside clearfix info-text">
                	
                    <div class="box desktop-hide phone-hide">
                        <select class="dropdownized">
                            <option value="Alle Themen">Alle Themen</option>
                            <option value="Energiepolitk">Energiepolitk</option>
                            <option value="AKW">AKW</option>
                        </select>
                    </div>
                    
                	<ul class="custom-list no-bullet phone-hide">
                    	<li class="active"><a href="#">Alle Mitglieder</a></li>
                    	<li><a href="#">Aktivste</a></li>
                    	<li><a href="#">Redaktion</a></li>
                    </ul>
                    <select name="" class="dropdownized phone-hide">
                    	<option value="Nach Alphabet">Nach Alphabet</option>
                    	<option value="2">2</option>
                    	<option value="3">3</option>
                    </select>
                    
                    <div class="box desktop-hide mobile-hide">
                        <h4>Zeige</h4>
                        <select class="dropdownized">
                            <option value="Alle Mitglieder">Alle Mitglieder</option>
                            <option value="Energiepolitk">Energiepolitk</option>
                            <option value="AKW">AKW</option>
                        </select>
                        <fieldset class="search">
                            <input type="text" placeholder="Name oder Benutzername">
                            <input type="submit" value="Go">
                        </fieldset>
                    </div>
                
                </div>
    
                <div class="main left-thumb community-list clearfix">
            
                    <article>
                        <figure>
                            <img alt="" src="{{ url static_file="pictures/user-thumb-mid-default.jpg" }}">
                        </figure>
                        <h3>Reto Arberg</h3>
                        <p>Hier wird gegen Grundregeln der nuklearen Sicherheit verstossen!<br />
                        <time>Registriert sein 20.9.2012 <span class="comm">3</span></time></p>
                    </article>
                    
                    <article>
                        <figure>
                            <img alt="" src="{{ url static_file="pictures/user-thumb-mid-default.jpg" }}">
                        </figure>
                        <h3>AAA</h3>
                        <p><time>Registriert sein 20.9.2012</time></p>
                    </article>
                    
                    <article>
                        <figure>
                            <img alt="" src="{{ url static_file="pictures/user-thumb-mid-default.jpg" }}">
                        </figure>
                        <h3>Bernd Arberg <small class="red-mark">REDAKTION</small></h3>
                        <p>Hier wird gegen Grundregeln der nuklearen Sicherheit verstossen!<br />
                        <time>Registriert sein 20.9.2012 <span class="comm">3</span></time></p>
                    </article>
                    
                    <article>
                        <figure>
                            <img alt="" src="{{ url static_file="pictures/user-thumb-mid-default.jpg" }}">
                        </figure>
                        <h3>Bernd Arberg</h3>
                        <p>Was du heute kannst besorgen, das verscheibe nocht auf morgen! Was du heute kannst besorgen, das verscheibe nocht auf morgen! Was du heute kannst besorgen, das verscheibe nocht auf morgen! Was du heute kannst besorgen, das verscheibe nocht auf morgen!<br />
                        <time>Registriert sein 20.9.2012 <span class="comm">33</span></time></p>
                    </article>
                    
                    <article>
                        <figure>
                            <img alt="" src="{{ url static_file="pictures/user-thumb-mid-default.jpg" }}">
                        </figure>
                        <h3>Reto Arberg</h3>
                        <p>Hier wird gegen Grundregeln der nuklearen Sicherheit verstossen!<br />
                        <time>Registriert sein 20.9.2012 <span class="comm">3</span></time></p>
                    </article>
                    
                    <ul class="paging center top-line">
                        <li><a class="button white prev" href="#">‹</a></li>
                    	<li class="caption">1 von 2</li>
                    	<li><a class="button white next" href="#">›</a></li>
                    </ul>
                
                </div><!-- / Main -->            
                
                <div class="aside">
                    
                    <div class="ad top-space">
                        <small>Werbung</small>
                        <a href="#"><img alt="" src="{{ url static_file="pictures/ad-2.jpg" }}"></a>
                    </div>
                
                </div><!-- / Aside -->
            
            </div>
    
        </div><!-- / Content Wrapper -->
    
    </div>

{{ include file="_tpl/footer.tpl" }}
	
{{ include file="_tpl/_html-foot.tpl" }}	

</body>
</html>