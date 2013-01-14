{{ if $gimme->article->comments_enabled || $gimme->article->comments_locked  }}  
        
                <div class="main no-line" id="comments">
                
                  <div class="tabs margin-bottom comment-box">
                    
                      <ul class="tab-nav clearfix">
                          <li><a href="#comm-1"><strong>Ausgewählte Kommentare</strong> {{ if $gimme->article->recommended_comment_count }}({{ $gimme->article->recommended_comment_count }}){{ /if }}</a></li>
                          <li><a href="#comm-2"><strong>Alle Kommentare</strong> ({{ $gimme->article->comment_count }})</a></li>
                        </ul>
                        
                        <div class="comment-content">
                            <div id="comm-1">
                            {{ $recommendedEmpty=1 }}
                            {{ list_article_comments order="bydate asc" recommended="true"  }}
                            {{ if $gimme->current_list->at_beginning }}
                                <ol>
                            {{ /if }}   
                                    {{ $user=$gimme->comment->user }}                             
                                    <li>          
                                    {{ if $user->identifier }}
                                    {{ if $user->is_active }}<a href="{{ $view->url(['username' => $user->uname], 'user') }}">{{ strip }}
                                        {{ include file="_tpl/user-image.tpl" size="small" }}
                                    {{ /strip }}</a>{{ /if }}
                                    {{ else }}
                                    <img src="{{ uri static_file="pictures/user-thumb-small-default.jpg" }}" alt="" />
                                    {{ /if }}
                                        <h5>{{ $gimme->comment->subject }} {{ if $gimme->comment->user->identifier && $gimme->comment->user->is_author }}<small class="red-mark">REDAKTION</small>{{ /if }}</h5>
                                        <time>von {{ if $user->identifier }}{{ if $user->is_active }}<a href="{{ $view->url(['username' => $user->uname], 'user') }}">{{ include file="_tpl/user-name.tpl" user=$user }}</a>{{ /if }}{{ else }}{{ $gimme->comment->nickname }}{{ /if }} um {{ $gimme->comment->submit_date|camp_date_format:"%e.%m.%Y um %H:%iUhr" }}</time>
                                        <p>{{ $gimme->comment->content|create_links|nl2br }}</p>
                                    </li>
                            {{ $recommendedEmpty=0 }}        
                            {{ if $gimme->current_list->at_end }}    
                                </ol>
                            {{ /if }}    
                            {{ /list_article_comments }}

                                {{ if $recommendedEmpty }}
                                <p>Bisher wurden keine Kommentare zu diesem Artikel von der Redaktion hervorgehoben.</p>
                                {{ /if }}
                                {{ include file="_tpl/article-comments-form.tpl" }}
                            </div><!-- /#comm-1 -->
                            <div id="comm-2">
                            {{ list_article_comments order="bydate asc"  }}
                            {{ if $gimme->current_list->at_beginning }}
                                <ol>
                            {{ /if }}
                                    <li>
                                    {{ if $user->identifier }}
                                    {{ if $user->is_active }}<a href="{{ $view->url(['username' => $user->uname], 'user') }}">{{ strip }}
                                        {{ include file="_tpl/user-image.tpl" size="small" }}
                                    {{ /strip }}</a>{{ /if }}
                                    {{ else }}
                                    <img src="{{ url static_file="pictures/user-thumb-small-default.jpg" }}" alt="" />
                                    {{ /if }}
                                        <h5>{{ $gimme->comment->subject }} {{ if $gimme->comment->user->identifier && $gimme->comment->user->is_author }}<small class="red-mark">REDAKTION</small>{{ /if }}</h5>
                                        <time>von {{ if $user->is_active }}{{ if $user->identifier }}<a href="{{ $view->url(['username' => $user->uname], 'user') }}">{{ include file="_tpl/user-name.tpl" user=$user }}</a>{{ /if }}{{ else }}{{ $gimme->comment->nickname }}{{ /if }} um {{ $gimme->comment->submit_date|camp_date_format:"%e.%m.%Y um %H:%iUhr" }}</time>
                                        <p>{{ $gimme->comment->content|create_links|nl2br }}</p>
                                    </li>
                            {{ if $gimme->current_list->at_end }}    
                                </ol>
                            {{ /if }}
                            {{ /list_article_comments }}
                            {{ include file="_tpl/article-comments-form.tpl" }}
                            </div><!-- /#comm-2 -->
                        </div><!-- /.comment-content -->
                    </div><!-- /.comment-box -->
                
                </div><!-- /.main -->

<script type="text/javascript">
$(function() {
    var tabId = "#comm-2";
    if (window.location.hash == tabId) { // scroll to
        setTimeout(function () { $(window).scrollTop($('#comments').offset().top); }, 500);
    } else { // add to form
        $('form', '#comments').each(function() {
            var form = $(this);
            form.attr('action', form.attr('action') + tabId);
        });
    }
});
</script>
{{ /if }}
