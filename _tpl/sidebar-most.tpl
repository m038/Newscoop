                <div class="box clearfix">

{{ assign var="mydate" value=strtotime('-14 days') }} 
{{ $mydate=$mydate|date_format:'%Y-%m-%d' }} 
                    
                  <article class="top-line bottom-line mobile-half">
                      <h4>Meistgelesen</h4>
                        <ol class="short-list">
                        {{ list_articles length="3" ignore_publication="true" ignore_issue="true" ignore_section="true" order="bypopularity desc" constraints="type not bloginfo type not dossier type not event type not poll type not restaurant type not screening type not static_page type not editor_message publish_date greater_equal $mydate" }} 
                          <li><span>{{ if $gimme->article->dateline|strip !== "" }}{{ $gimme->article->dateline }}{{ else }}{{ $gimme->section->name }}{{ /if }}</span> <a href="{{ url options="article" }}">{{ $gimme->article->name }}</a>  {{ if $gimme->article->comment_count }}<span class="comm">{{ $gimme->article->comment_count }}</span>{{ /if }}</li>
                {{ /list_articles }} 
                        </ol>
                    </article>                    
                    
                    
                    <article class="margin-bottom mobile-half last">
                      <h4>Meistkommentiert</h4>
                      <ol class="short-list">
                     {{ list_articles length="3" ignore_publication="true" ignore_issue="true" ignore_section="true" order="bycomments desc" constraints="type not bloginfo type not dossier type not event type not poll type not restaurant type not screening type not static_page type not editor_message publish_date greater_equal $mydate" }}
                          <li><span>{{ if $gimme->article->dateline|strip !== "" }}{{ $gimme->article->dateline }}{{ else }}{{ $gimme->section->name }}{{ /if }}</span> <a href="{{ url options="article" }}">{{ $gimme->article->name }}</a>  {{ if $gimme->article->comment_count }}<span class="comm">{{ $gimme->article->comment_count }}</span>{{ /if }}</li>
                     {{ /list_articles }}
                        </ol>
                    </article>
                
                </div>