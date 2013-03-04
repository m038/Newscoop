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
  {{*** Changes introduced according to ticket MOTM-549 - only one post per blog to appear in most read list ***}}
  {{ $mostReadArticles = array() }}
  {{ assign var="i" value=0 }}
  {{ list_articles length="20" ignore_publication="true" ignore_issue="true" ignore_section="true" order="bypopularity desc" constraints="type not bloginfo type not dossier type not event type not poll type not restaurant type not screening type not static_page type not editor_message publish_date greater_equal $mydate" }}
    {{ assign var="arrayCheck" value=$gimme->publication->identifier*100+$gimme->section->number }}
    {{ if not $mostReadArticles[$arrayCheck] }}
      {{ $mostReadArticles[$arrayCheck]=true }}
      {{ assign var="i" value=$i+1 }}
      {{ if $i < 4 }}
          <li><span>{{ if $gimme->article->dateline|strip !== "" }}{{ $gimme->article->dateline }}{{ else }}{{ $gimme->section->name }}{{ /if }}</span> <a href="{{ url options="article" }}">{{ $gimme->article->name }}</a> {{ if $gimme->article->comment_count }}<span class="comm">{{ $gimme->article->comment_count }}</span>{{ /if }}</li>
      {{ /if }}
    {{ /if }}
  {{ /list_articles }}
                        </ol>
                    </article>
                    
                    <article id="phone-tab-2">
                      <h4>Meistkommentiert</h4>
                      <ol class="short-list">
                     {{ list_articles length="3" ignore_publication="true" ignore_issue="true" ignore_section="true" order="bycomments desc" constraints="type not bloginfo type not dossier type not event type not poll type not restaurant type not screening type not static_page type not editor_message publish_date greater_equal $mydate" }}
                          <li><span>{{ if $gimme->article->dateline|strip !== "" }}{{ $gimme->article->dateline }}{{ else }}{{ $gimme->section->name }}{{ /if }}<span> <a href="{{ url options="article" }}">{{ $gimme->article->name }}</a> {{ if $gimme->article->comment_count }}<span class="comm">{{ $gimme->article->comment_count }}</span>{{ /if }}</li>
                     {{ /list_articles }}
                        </ol>
                    </article>
                    
                </div><!-- / 2 columns -->
                
                </div>                
