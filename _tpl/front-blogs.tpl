        <h2><a href="{{ local }}{{ set_publication identifier="4" }}{{ url options="publication" }}{{ /local }}">Aus den Blogs</a></h2>
        
        <div class="four-columns blog-list equal-heights clearfix">
        {{ list_articles length="4" ignore_publication="true" ignore_issue="true" ignore_section="true" order="bypublishdate desc" constraints="type is blog" }}
            <article>
                <h6><a href="{{ url options="section" }}">{{ $gimme->section->name }}</a></h6>
                <figure>
                {{ image rendition="quarter" }}                
                <a href="{{ url options="article" }}"><img src="{{ $image->src }}" width="{{ $image->width }}" height="{{ $image->height }}" rel="resizable" style="max-width: 100%" alt="{{ $image->caption }} {{ if !($image->photographer == "") }}(Bild: {{ $image->photographer }}){{ /if }}" /></a>     
                {{ /image }}                
                </figure>
                <h3><a href="{{ url options="article" }}">{{ $gimme->article->name }}</a></h3>
                <p>{{ include file="_tpl/_admin-edit.tpl" }}{{ $gimme->article->lede|strip_tags:flase }} <time>{{ include file="_tpl/relative-date.tpl" date=$gimme->article->publish_date }}</time><br />
                <a href="{{ url options="article" }}">weiterlesen</a> &bull; <a href="{{ url options="section" }}">zum Blog</a></p>
            </article>
        {{ /list_articles }}
        </div><!-- / 4 columns -->
            
        <a href="{{ local }}{{ set_publication identifier="4" }}{{ url options="publication" }}{{ /local }}" class="button white center">Zu allen Blogs</a>
