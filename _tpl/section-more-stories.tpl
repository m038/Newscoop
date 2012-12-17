                <h4 class="center-title"><a href="#">Weitere Artikel</a></h4>
                
                <div class="left-thumb article-border-bottom margin-bottom clearfix">

{{ list_articles length="10" }}
{{ if $gimme->current_list->index gt 5 }}            
                    <article>
                        <h6><a href="{{ url options="article" }}">{{ $gimme->article->dateline }}</a></h6>
                        <h3><a href="{{ url options="article" }}">{{ $gimme->article->name }}</a></h3>
                    </article>
{{ /if }}
{{ /list_articles }}
                    
                </div>
