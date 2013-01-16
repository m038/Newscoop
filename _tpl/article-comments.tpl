{{ if $gimme->article->comments_enabled || $gimme->article->comments_locked  }}  
        
                <div class="main no-line" id="comments">
                
                  <div class="tabs margin-bottom comment-box">
                    
                      <ul class="tab-nav clearfix">
                          <li><a href="#comm-1"><strong>Ausgewählte <span class="phone-hide">Kommentare</span></strong> {{ if $gimme->article->recommended_comment_count }}({{ $gimme->article->recommended_comment_count }}){{ /if }}</a></li>
                          <li><a href="#comm-2"><strong>Alle <span class="phone-hide">Kommentare</span></strong> ({{ $gimme->article->comment_count }})</a></li>
                        </ul>
                        
                        <div class="comment-content">
                            <div id="comm-1">
                            {{ $recommendedEmpty=1 }}
                            {{ list_article_comments order="bydate asc" recommended="true"  }}
                            {{ if $gimme->current_list->at_beginning }}
                                <ol>
                            {{ /if }}   
                                {{ include file="_tpl/article-comment-li.tpl" user=$gimme->comment->user }}
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
                                {{ include file="_tpl/article-comments-li.tpl" user=$gimme->comment->user }}
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
