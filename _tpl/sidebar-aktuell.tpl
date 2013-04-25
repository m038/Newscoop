			<section class="mobile-hide">
                <h4 class="box-title">Aktuelles aus den Ressorts</h4>
                {{ list_articles length="3" ignore_publication="true" ignore_issue="true" ignore_section="true" constraints="type is news" order="bypublishdate desc" }}

                <div class="box blog-list single-line left-thumb{{ if $gimme->current_list->index < 3 }} bottom-line{{ /if }}">
                    <article>
                        <h6><a href="{{ url options="section" }}">{{ $gimme->section->name }}</a></h6>
                        <figure>
                      {{ image rendition="artthumb" }}                
                          <a href="{{ url options="article" }}"><img src="{{ $image->src }}" width="{{ $image->width }}" height="{{ $image->height }}" rel="resizable" style="max-width: 100%" alt="{{ $image->caption }} {{ if !($image->photographer == "") }}(bild: {{ $image->photographer }}){{ /if }}" /></a>     
                      {{ /image }}                        
                        </figure>
                        <h3><a href="{{ url options="article" }}">{{ $gimme->article->name }}</a></h3>
                        <p>{{ $gimme->article->lede|strip_tags:false }} <time>{{ include file="_tpl/relative-date.tpl" date=$gimme->article->publish_date }}</time><br />
                        <a href="{{ url options="article" }}">weiterlesen</a> &bull; <a href="{{ url options="section" }}">zum Ressort</a></p>                        
                        
                    </article>
                </div>                
                
                {{ /list_articles }}
                
                <h4 class="box-title">Aktuelle Blogs</h4>
                {{ list_articles length="3" ignore_publication="true" ignore_issue="true" ignore_section="true" constraints="type is blog" order="bypublishdate desc" }}

                <div class="box blog-list single-line left-thumb{{ if $gimme->current_list->index < 3 }} bottom-line{{ /if }}">
                    <article>
                        <h6><a href="{{ url options="section" }}">{{ $gimme->section->name }}</a></h6>
                        <figure>
                      {{ image rendition="artthumb" }}                
                          <a href="{{ url options="article" }}"><img src="{{ $image->src }}" width="{{ $image->width }}" height="{{ $image->height }}" rel="resizable" style="max-width: 100%" alt="{{ $image->caption }} {{ if !($image->photographer == "") }}(bild: {{ $image->photographer }}){{ /if }}" /></a>     
                      {{ /image }}                        
                        </figure>
                        <h3><a href="{{ url options="article" }}">{{ $gimme->article->name }}</a></h3>
                        <p>{{ $gimme->article->lede|strip_tags:false }} <time>{{ include file="_tpl/relative-date.tpl" date=$gimme->article->publish_date }}</time><br />
                        <a href="{{ url options="article" }}">weiterlesen</a> &bull; <a href="{{ url options="section" }}">zum Blog</a></p>                        
                        
                    </article>
                </div>                
                
                {{ /list_articles }}
			</section>
