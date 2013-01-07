{{ list_article_authors columns="2" }}  
{{ $escapedName = str_replace(" ", "\ ", $gimme->author->name) }}             
                <div class="box bottom-line left-thumb{{ if $gimme->current_list->index == "2" }} last{{ /if }} mobile-half">
                
                  {{ if $gimme->author->user->defined || $gimme->author->picture->imageurl }}
                  {{ include file="_tpl/author-image.tpl" author=$gimme->author width=120 height=120 }}
                  {{ /if }}
                  <p><strong>Autor</strong>: {{ include file="_tpl/author-name.tpl" author=$gimme->author }}<br />
                    {{ include file="_tpl/author-bio.tpl" author=$gimme->author }}</p>
                    {{ if !empty($gimme->author->user['twitter']) }}
                    <p class="author-contact">                    
                    <a href="http://twitter.com/{{ trim($gimme->author->user['twitter'], '@') }}" class="icon-twitter" data-show-count="false" data-lang="de" data-show-screen-name="false">@{{ trim($gimme->author->user['twitter'], '@') }} folgen</a>
                        <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
                    {{ /if }}                   
                    </p>
                </div>
{{ /list_article_authors }} 