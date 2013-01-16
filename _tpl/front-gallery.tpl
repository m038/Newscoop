                <div class="box gallery-slider">
                
                	<h4 class="box-title"><img src="{{ uri static_file="pictures/title-icons/camera.png" }}" alt="" />Fundstücke</h4>

{{ list_articles length="1" ignore_publication="true" ignore_issue="true" ignore_section="true" order="bysection desc" constraints="type is blog section is 100" }}                	
                	
                    <article>
                        <figure>

{{ image rendition="slideshow" }}<a href="{{ url options="article" }}"><img src="{{ $image->src }}" width="{{ $image->width }}" height="{{ $image->height }}" rel="resizable" style="max-width: 100%" alt="{{ $image->caption }} {{ if !($image->photographer == "") }}(bild: {{ $image->photographer }}){{ /if }}" /></a>{{ /image }}
                            
                            <p class="side-padding"><strong>{{ $gimme->article->name }}</strong> von {{ $gimme->article->author->name }} <time>{{ include file="_tpl/relative-date.tpl" date=$gimme->article->publish_date }}</time> {{ if $gimme->article->comment_count }}<span class="comm">{{ $gimme->article->comment_count }}</span>{{ /if }}</p>
                        </figure>
                    </article>
                    
                    <div class="clearfix side-padding">
                    	<a href="{{ url options="section" }}" class="button white left">Zu allen Fundstücken</a>
                        {{ if !is_object($gimme->user) || !$gimme->user->logged_in }}<a href="#" class="button show-feedback-form red right">Bild vorschlagen</a>{{ /if }}
                    </div>
                    
{{ /list_articles }}                
                </div><!-- / Gallery Slider -->
