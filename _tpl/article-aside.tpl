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

{{ include file="_tpl/article-aside-authors.tpl" }}
               
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