{{ assign var="sectionCondition" value="" }}
{{ if $gimme->section->defined }}
{{ assign var="sectionCondition" value="{{ $gimme->section->name }} is on" }}
{{ /if }}

{{ list_articles ignore_issue="true" ignore_section="true" constraints="type is news section is 210 Kommentar is on active is on $sectionCondition" }}

                <div class="box">
                
                	<h4 class="box-title"><img src="{{ uri static_file="pictures/title-icons/commentar.png" }}" alt="" />Der Kommentar</h4>
                    <article>
                    	<h3><a href="{{ url options="article" }}">{{ $gimme->article->name }}</a></h3>
                        <p>{{ $gimme->article->lede|strip_tags:false }}</p>
                        <p>Ein Kommentar von {{ list_article_authors }}{{ $gimme->author->name }}{{ if $gimme->current_list->at_end }}{{ else }}, {{ /if }}{{ /list_article_authors }} <a href="{{ url options="article" }}">weiterlesen</a></p>
                    </article>
                
                </div>
{{ /list_articles }}
{{ assign var="noComm" value=0 scope="global" }}
{{ if $gimme->prev_list_empty }}
{{ assign var="noComm" value=1 scope="global" }}
{{ /if }}