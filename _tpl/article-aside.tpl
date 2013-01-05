{{* IF ARTICLE IS PART OF A DOSSIER, SHOW IT *}}
{{ list_related_articles role="child" }}    
{{ if $gimme->article->type_name == "dossier" }}
            	<article class="margin-bottom mobile-horizontal-article">
                    <figure>
                      {{ image rendition="arthalf" }}                
                      <img src="{{ $image->src }}" width="{{ $image->width }}" height="{{ $image->height }}" rel="resizable" style="max-width: 100%" alt="{{ $image->caption }} {{ if !($image->photographer == "") }}(bild: {{ $image->photographer }}){{ /if }}" />     
                      {{ /image }}
                        <figcaption>
                            <h6><a href="{{ url options="article" }}">Dossier</a></h6>
                            <h3><a href="{{ url options="article" }}">{{ $gimme->article->name }}</a></h3>
                        </figcaption>
                    </figure>
                    </article>
{{ /if }} 
{{ /list_related_articles }}                

                <div class="clearfix">
{{ list_article_authors columns="2" }}  
{{ $escapedName = str_replace(" ", "\ ", $gimme->author->name) }}             
                <div class="box bottom-line left-thumb{{ if $gimme->current_list->index == "2" }} last{{ /if }} mobile-half">
                
                  {{ if $gimme->author->user->defined || $gimme->author->picture->imageurl }}
                  {{ include file="_tpl/author-image.tpl" author=$gimme->author width=120 height=120 }}
                  {{ /if }}
                  <p><strong>Autor</strong>: {{ include file="_tpl/author-name.tpl" author=$gimme->author }}<br />
                    {{* include file="_tpl/author-bio.tpl" author=$gimme->author *}}</p>
                    <p class="author-contact"><a href="#" class="icon-email">Autor im Newsletter folgen</a><br />
                    {{ if !empty($gimme->author->user['twitter']) }}
                    <a href="http://twitter.com/{{ trim($gimme->author->user['twitter'], '@') }}" class="icon-twitter" data-show-count="false" data-lang="de" data-show-screen-name="false">@{{ trim($gimme->author->user['twitter'], '@') }} folgen</a>
                        <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
                    {{ /if }}                   
                    </p>
                </div>
{{ /list_article_authors }}                
					 </div>
					                 
              <div class="box bottom-line">
                  <p>Themen zum Artikel: {{ list_article_topics }}<a href="{{ unset_section }}{{ url options="template topic.tpl" }}">{{ $gimme->topic->name }}</a>, {{ /list_article_topics }}<br />
                    <a href="#" class="icon-tag">Themen abonnieren</a></p>
                </div>
                
{{*** recommended links ***}}
{{ set_default_article }}
{{ if !($gimme->article->linklist|strip == "") }}            
                <article class="bottom-line">
                    <h4>Links zum Thema</h4>
                    <ul class="custom-list reply-list">
                    
{{ $links=str_replace("<p>", "", explode("</p>", str_replace("<div>", "", str_replace("</div>", "", $gimme->article->linklist)))) }}
{{ foreach $links as $link }}
{{ $linkAry=explode("- ", $link, 2) }}
{{ if count($linkAry) == 2 }}     
               
                    <li>{{ substr($linkAry[1], 0) }} {{ $linkAry[0] }}</li>

{{ /if }} 
{{ /foreach }}                    

                    </ul>
                </article>
{{ /if }}                