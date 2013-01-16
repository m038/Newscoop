{{ list_articles length="1" ignore_issue="true" ignore_section="true" order="bypublishdate desc" constraints="type is debatte" }}

                <div class="box highlight-box clearfix debatte-widget">
                
                <div class="mobile-half">
                	<header>
                    	<h6><a href="#">Pro & Contra</a></h6>
                    	<h3><a href="{{ url options="article" }}">{{ $gimme->article->name }}</a></h3>
                    </header>
                </div>
                
    {{ list_debates length="1" item="article" }}                
                
    {{* include file="_tpl/debate_votes_total.tpl" scope="parent" *}}
	 {{ include file="_tpl/_debate_answers.tpl" scope="parent" }}
                
                <div class="mobile-half last">
                    <div class="score-box">
    							<ul class="debatte-score">
        						{{ foreach $answers as $answer }}
        							<li style="width:{{ $answer.percent }}%;" class="{{ if $answer@first }}ja{{ else }}nein{{ /if }}"><span><b>{{ $answer.answer|escape }}</b> {{ $answer.percent }}%</span></li>
        						{{ /foreach }}
    							</ul>
 						         
        {{ $closingdate=date_create($gimme->debate->date_end) }}
        {{ $deadline=$closingdate->setTime(12, 0) }}
        {{ $diff=date_diff($deadline, date_create('now')) }}
        {{ if $deadline->getTimestamp() > time() }}
        						<p>Noch {{ $diff->days }} Tage, {{ $diff->h }} Stunden, {{ $diff->i }} Minuten {{ if $gimme->article->comment_count }}<span class="comm">{{ $gimme->article->comment_count }}</span>{{ /if }}</p>
        {{ else }}
        						<p>Aktueller Stand: Fazit (Diskussion geschlossen am {{ $deadline->format('j.n.Y') }} um 12:00 Uhr) {{ if $gimme->article->comment_count }}<span class="comm">{{ $gimme->article->comment_count }}</span>{{ /if }}</p> 						      
 						      
                    </div>
                </div>
	                 
    {{ /list_debates }}                
                
                    <div class="left-thumb debatte-widget-content">
                    	<article>
                    {{ list_article_authors }}
                    {{ if $gimme->current_list->index == "1" }}                    	
                        	<figure>
                          {{ if $gimme->author->user->defined || $gimme->author->picture->imageurl }}
                          {{ include file="_tpl/author-image.tpl" author=$gimme->author width=48 height=48 }}
                          {{ /if }}                        	
                        	</figure>
                            <p><a href="#">Ja</a>: {{ $gimme->article->pro_text|strip_tags:false|truncate:200:" [...]" }} {{ if $gimme->article->comment_count }}<span class="comm">{{ $gimme->article->comment_count }}</span>{{ /if }}</p>
                            <p>{{ $gimme->author->name }}</p>
                     {{ /if }}
                     {{ /list_article_authors }}                            
                        </article>
                    	<article>
                    {{ list_article_authors }}
                    {{ if $gimme->current_list->index == "2" }}                     	
                        	<figure>
                          {{ if $gimme->author->user->defined || $gimme->author->picture->imageurl }}
                          {{ include file="_tpl/author-image.tpl" author=$gimme->author width=48 height=48 }}
                          {{ /if }}
                        	</figure>
                            <p><a href="#">Nein</a>: {{ $gimme->article->contra_text|strip_tags:false|truncate:200:" [...]" }} {{ if $gimme->article->comment_count }}<span class="comm">{{ $gimme->article->comment_count }}</span>{{ /if }}</p>
                            <p>{{ $gimme->author->name }}</p>
                     {{ /if }}
                     {{ /list_article_authors }}                            
                        </article>
                    </div>
                    
                    <a href="{{ url options="article" }}" class="button red center">Zur Debatte</a>
                
                </div>

{{ /list_articles }}