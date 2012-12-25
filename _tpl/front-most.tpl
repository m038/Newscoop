                <div class="phone-tabs">
                
                	<ul class="hide phone-tab-nav">
                    	<li><a href="#phone-tab-1">Meistgelesen</a></li>
                    	<li><a href="#phone-tab-2">Meistkommentiert</a></li>
                    </ul>

              <div class="two-columns margin-bottom clearfix equal-heights phone-tab-content">
                
{{ assign var="mydate" value=strtotime('-14 days') }} 
{{ $mydate=$mydate|date_format:'%Y-%m-%d' }} 

                  <article id="phone-tab-1">
                      <h4>Meistgelesen</h4>
                        <ol class="short-list">
                        {{ list_articles length="3" ignore_publication="true" ignore_issue="true" ignore_section="true" order="bypopularity desc" constraints="type not bloginfo type not dossier type not event type not poll type not restaurant type not screening type not static_page type not editor_message publish_date greater_equal $mydate" }} 
                          <li><a href="{{ url options="article" }}">{{ if $gimme->article->dateline|strip !== "" }}{{ $gimme->article->dateline }}{{ else }}{{ $gimme->section->name }}{{ /if }}</a> {{ $gimme->article->name }}  {{ if $gimme->article->comment_count }}<span class="comm">{{ $gimme->article->comment_count }}</span>{{ /if }}</li>
                {{ /list_articles }} 
                        </ol>
                    </article>
                    
                    <article id="phone-tab-2">
                      <h4>Meistkommentiert</h4>
                      <ol class="short-list">
                     {{ list_articles length="3" ignore_publication="true" ignore_issue="true" ignore_section="true" order="bycomments desc" constraints="type not bloginfo type not dossier type not event type not poll type not restaurant type not screening type not static_page type not editor_message publish_date greater_equal $mydate" }}
                          <li><a href="{{ url options="article" }}">{{ if $gimme->article->dateline|strip !== "" }}{{ $gimme->article->dateline }}{{ else }}{{ $gimme->section->name }}{{ /if }}</a> {{ $gimme->article->name }}  {{ if $gimme->article->comment_count }}<span class="comm">{{ $gimme->article->comment_count }}</span>{{ /if }}</li>
                     {{ /list_articles }}
                        </ol>
                    </article>
                    
                </div><!-- / 2 columns -->
                
                </div>                