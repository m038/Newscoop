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
        
        <div class="content no-bottom-line equal-heights clearfix">
        
        	<div class="main photo-blog-list">
            
            	<article>
                
                	<header>
                    	<time>20.9.2012</time>
                    	<h3>Impressionen aus Luzern</h3>
                    	<p>von Peter Maier <span>(5 Bilder)</span></p>
                    </header>
                    <figure>
                    	<img src="{{ uri static_file="pictures/foto-blog-img-1.jpg" }}" class="left" alt="" />
                    	<img src="{{ uri static_file="pictures/foto-blog-img-2.jpg" }}" class="right" alt="" />
                    </figure>
                    <p>Em natibus. Facepedianda dolo enitass impedit poressint exceatem id modite res millore mpore, ex eostes sequatibus voluptatquat re nis min nis core nihil eossi doluptur sunditia simolut etuscia musciatis as a doluptas excerit rest ipsum audae sae si to maionsed. <a href="#">Zur Gallerie</a></p>
                    
                </article>
                
                <article>
                
                	<header>
                    	<time>20.9.2012</time>
                    	<h3>Impressionen aus Luzern</h3>
                    	<p>von Peter Maier <span>(5 Bilder)</span></p>
                    </header>
                    <figure>
                    	<img src="{{ uri static_file="pictures/foto-blog-img-3.jpg" }}" alt="" />
                    </figure>
                    <p>Em natibus. Facepedianda dolo enitass impedit poressint exceatem id modite res millore mpore, ex eostes sequatibus voluptatquat re nis min nis core nihil eossi doluptur sunditia simolut etuscia musciatis as a doluptas excerit rest ipsum audae sae si to maionsed. <a href="#">Zur Gallerie</a></p>
                    
                </article>
                
                <article>
                
                	<header>
                    	<time>20.9.2012</time>
                    	<h3>Impressionen aus Luzern</h3>
                    	<p>von Peter Maier <span>(5 Bilder)</span></p>
                    </header>
                    <figure class="left">
                    	<img src="{{ uri static_file="pictures/foto-blog-img-4.jpg" }}" alt="" />
                    </figure>
                    <p>Em natibus. Facepedianda dolo enitass impedit poressint exceatem id modite res millore mpore, ex eostes sequatibus voluptatquat re nis min nis core nihil eossi doluptur sunditia simolut etuscia musciatis as a doluptas excerit rest ipsum audae sae si to maionsed. <a href="#">Zur Gallerie</a></p>
                    
                </article>
                
                <article>
                
                	<header>
                    	<time>20.9.2012</time>
                    	<h3>Impressionen aus Luzern</h3>
                    	<p>von Peter Maier <span>(5 Bilder)</span></p>
                    </header>
                    <figure class="right">
                    	<img src="{{ uri static_file="pictures/foto-blog-img-4.jpg" }}" alt="" />
                    </figure>
                    <p>Em natibus. Facepedianda dolo enitass impedit poressint exceatem id modite res millore mpore, ex eostes sequatibus voluptatquat re nis min nis core nihil eossi doluptur sunditia simolut etuscia musciatis as a doluptas excerit rest ipsum audae sae si to maionsed. <a href="#">Zur Gallerie</a></p>
                    
                </article>
                
                <article>
                
                	<header>
                    	<time>20.9.2012</time>
                    	<h3>Impressionen aus Luzern</h3>
                    	<p>von Peter Maier <span>(5 Bilder)</span></p>
                    </header>
                    <figure>
                    	<img src="{{ uri static_file="pictures/foto-blog-img-1.jpg" }}" class="left" alt="" />
                    	<img src="{{ uri static_file="pictures/foto-blog-img-2.jpg" }}" class="right" alt="" />
                    </figure>
                    <p>Em natibus. Facepedianda dolo enitass impedit poressint exceatem id modite res millore mpore, ex eostes sequatibus voluptatquat re nis min nis core nihil eossi doluptur sunditia simolut etuscia musciatis as a doluptas excerit rest ipsum audae sae si to maionsed. <a href="#">Zur Gallerie</a></p>
                    
                </article>
                
                <ul class="paging center top-line">
                        <li><a class="button white prev" href="#">‹‹</a></li>
                        <li><a class="button white prev" href="#">‹</a></li>
                    	<li class="caption">1 von 2</li>
                    	<li><a class="button white next" href="#">›</a></li>
                    	<li><a class="button white next" href="#">››</a></li>
                    </ul>
            
            </div><!-- / Main -->
            
            <div class="aside">
            
            	<div class="box bottom-line">
                    <iframe width="100%" height="300" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=Zug,+Switzerland&amp;aq=0&amp;oq=zug&amp;sll=37.0625,-95.677068&amp;sspn=53.080379,39.726562&amp;ie=UTF8&amp;hq=&amp;hnear=Zug,+Canton+of+Zug,+Switzerland&amp;t=m&amp;z=12&amp;ll=47.174589,8.513854&amp;output=embed"></iframe>
                </div>
                
                <div class="ad">
                	<small>Werbung</small>
                    <a href="#"><img src="{{ uri static_file="pictures/ad-2.jpg" }}" alt="" /></a>
                </div>
            
            </div><!-- / Aside -->
        
        </div>
    
    </div><!-- / Content Wrapper -->

{{ include file="_tpl/footer.tpl" }}
  
{{ include file="_tpl/_html-foot.tpl" }}  

</body>
</html>
