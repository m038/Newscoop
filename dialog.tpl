{{ include file="_tpl/_html-head.tpl" }}

<body>

  <div class="content-wrapper">
  
{{ render file="_ads/section-leaderboard.tpl" }}  
    
{{ include file="_tpl/header-nav.tpl" }}
        
{{ include file="_tpl/header.tpl" }}

		<div class="content bottom-line clearfix">
        
        	<div class="main">
            
            	<div class="box debatte-single">
                
                	<p class="headline highlight">Hier wird diskutiert. Diskutieren Sie mit!</p>

                    <div class="two-columns equal-heights bottom-line clearfix">

                    	{{ list_articles length="1" constraints="type is debatte" }}
                    	{{ assign var="artNo" value=$gimme->article->number }}
                    	<div class="box">
                        	
                            <header>
                        		<h6><a href="{{ url options="article" }}">Pro & Contra</a></h6>
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
                
                {{ list_articles length="2" constraints="type is debatte number not $artNo" }}
                {{ if $gimme->current_list->at_beginning }}
                <h4 class="center-title">Abgeschlossene Debatten</h4>
                <div class="two-columns clearfix margin-bottom equal-heights">              
                {{ /if }}
                    <article class="mobile-half{{ if $gimme->current_list->index == 3 }} last{{ /if }}">
                        <figure>
              				{{ image rendition="arthalf" }}                
                      		<a href="{{ url options="article" }}"><img src="{{ $image->src }}" width="{{ $image->width }}" height="{{ $image->height }}" rel="resizable" style="max-width: 100%" alt="{{ $image->caption }} {{ if !($image->photographer == "") }}(Bild: {{ $image->photographer }}){{ /if }}" /></a>     
              				{{ /image }}
                        </figure>
                        <h3><a href="{{ url options="article" }}">{{ $gimme->article->name }}</a></h3>
                    </article>
                {{ if $gimme->current_list->index == 2 || $gimme->current_list->at_end }}
                </div><!-- / 2 columns -->
                {{ /if }}
                {{ /list_articles }}                

{{ include file="_tpl/front-gallery.tpl" where="dialog" }} 
            
            </div><!-- / Main -->
            
            <div class="aside">
            
{{ include file="_tpl/sidebar-community.tpl" }}

{{ render file="_ads/section-wide-skyscrapper.tpl" }}

{{ render file="_ads/sidebar-partner-buttons.tpl" }}
                
                <div class="box">
                	<iframe src="//www.facebook.com/plugins/likebox.php?href=http%3A%2F%2Fwww.facebook.com%2Fzentralplus&amp;width=350&amp;height=290&amp;show_faces=true&amp;colorscheme=light&amp;stream=false&amp;border_color&amp;header=true&amp;appId=118901678281903" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:350px; height:290px;" allowTransparency="true"></iframe>
                </div>
                
                <div class="box">
                
                	<div class="twitter-box">
                	
<a class="twitter-timeline" href="https://twitter.com/zentralplus/redaktion-zentral" data-widget-id="291509540216770561">Tweets von @zentralplus/redaktion-zentral</a> 
<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>               	

                    </div>

{{ include file="_ads/medium-rectangle.tpl" }}
                
                </div>
            
            </div><!-- / Aside -->
        
        </div>

{{ render file="_ads/section-billboard.tpl" }} 
    
    </div><!-- / Content Wrapper -->

{{ include file="_tpl/footer.tpl" }}
  
{{ include file="_tpl/_html-foot.tpl" }}  

</body>
</html>