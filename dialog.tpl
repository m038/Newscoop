{{ include file="_tpl/_html-head.tpl" }}

<body>

  <div class="content-wrapper">
    
{{ include file="_tpl/header-nav.tpl" }}
        
{{ include file="_tpl/header.tpl" }}

		<div class="content bottom-line clearfix">
        
        	<div class="main">
            
            	<div class="box debatte-single">
                
                	<p class="headline highlight">Hier "ndet die wöchentliche Auseinandersetzung statt!</p>

                    <div class="two-columns equal-heights bottom-line clearfix">

                    	{{ list_articles length="1" constraints="type is debatte" }}
                    	<div class="box">
                        	
                            <header>
                        		<h6><a href="#">Pro & Contra</a></h6>
                            	<h3><a href="{{ url options="article" }}">{{ $gimme->article->name }}</a></h3>
                            </header>
                            
                            {{ $gimme->article->teaser }}
                        
                        </div>
                
                        <div class="left-thumb box debatte-list clearfix">
                        
                        {{ include file="_tpl/debatte-voting.tpl" }}
                        
								{{ list_article_authors }}
                            <article class="clearfix">
                                <figure>
				                  {{ if $gimme->author->user->defined || $gimme->author->picture->imageurl }}
            				      {{ include file="_tpl/author-image.tpl" author=$gimme->author width=120 height=120 }}
                  				{{ /if }}                                
                                </figure>
                                <h3>{{ if $gimme->current_list->index == 1 }}Ja{{ else }}Nein{{ /if }}</h3>
                                <p>sagt {{ $gimme->author->name }}, {{ if $gimme->current_list->index == 1 }}{{ $gimme->article->pro_position }}{{ else }}{{ $gimme->article->contra_position }}{{ /if }}</p>
                            </article>
                        {{ /list_article_authors }}
                            
                            <a href="{{ url options="article" }}" class="button center red">Zur Debatte</a>
                        </div>
                        
                    {{ /list_articles }}
                    </div>
                
                </div>
                
                {{ list_articles length="3" constraints="type is debatte" }}
                {{ if $gimme->current_list->index gt 1 }}
                {{ if $gimme->current_list->index == 2 }}
                <h4 class="center-title">Abgeschlossene Debatten</h4>
                <div class="two-columns clearfix margin-bottom equal-heights">              
                {{ /if }}
                    <article class="mobile-half{{ if $gimme->current_list->index == 3 }} last{{ /if }}">
                        <figure>
              				{{ image rendition="arthalf" }}                
                      		<img src="{{ $image->src }}" width="{{ $image->width }}" height="{{ $image->height }}" rel="resizable" style="max-width: 100%" alt="{{ $image->caption }} {{ if !($image->photographer == "") }}(bild: {{ $image->photographer }}){{ /if }}" />     
              				{{ /image }}
                        </figure>
                        <h3><a href="{{ url options="article" }}">{{ $gimme->article->name }}</a></h3>
                    </article>
                {{ /if }}
                {{ if $gimme->current_list->index == 3 }}
                </div><!-- / 2 columns -->
                {{ /if }}
                {{ /list_articles }}                

{{ include file="_tpl/front-gallery.tpl" where="dialog" }} 
            
            </div><!-- / Main -->
            
            <div class="aside">
            
{{ include file="_tpl/sidebar-community.tpl" }}
                
                <div class="box">
                	<iframe src="//www.facebook.com/plugins/likebox.php?href=http%3A%2F%2Fwww.facebook.com%2Fplatform&amp;width=350&amp;height=258&amp;colorscheme=light&amp;show_faces=true&amp;border_color=%23fff&amp;stream=false&amp;header=false" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:350px; height:258px;" allowTransparency="true"></iframe>
                </div>
                
                <div class="box">
                
                	<div class="twitter-box">
                        <script src="http://widgets.twimg.com/j/2/widget.js"></script> 
                        <script> 
                        new TWTR.Widget({ 
                          version: 2, 
                          type: 'faves', 
                          rpp: 12, 
                          interval: 30000, 
                          title: '', 
                          subject: 'Die Redaktion auf Twitter', 
                          width: 'auto', 
                          height: 400, 
                          theme: { 
                            shell: { 
                              background: '#efefef', 
                              color: '#000' 
                            }, 
                            tweets: { 
                              background: '#ffffff', 
                              color: '#000', 
                              links: '#e10042' 
                            } 
                          }, 
                          features: { 
                            scrollbar: true, 
                            loop: false, 
                            live: true, 
                            behavior: 'all' 
                          } 
                        }).render().setUser('twitter').start(); 
                        </script>
                    </div>
                
                </div>
            
            </div><!-- / Aside -->
        
        </div>
    
    </div><!-- / Content Wrapper -->

{{ include file="_tpl/footer.tpl" }}
  
{{ include file="_tpl/_html-foot.tpl" }}  

</body>
</html>