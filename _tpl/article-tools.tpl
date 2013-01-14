                <div id="social-bookmarks-bar" class="social-bar{{ if $gimme->publication->identifier == "2" || $gimme->publication->identifier == "4" }} bottom-line{{ /if }} clearfix">
                  
                  <ul id="social_bookmarks" class="soc-options left"></ul>

{{ capture name="subject" }}Lesenswerter Artikel auf Zentral+{{ /capture }}
{{ capture name="body" }}Ich empfehle Ihnen folgenden Artikel auf Zentral+

{{ url options="article" }}{{ /capture }}
                    
                    <ul class="article-options right phone-hide">
            		  		<li class="email"><a href="mailto:?subject={{ $smarty.capture.subject|urlencode }}&body={{ $smarty.capture.body|urlencode }}" id="article-recommend-button">Email</a></li>                     
            		  		<li class="print mobile-hide"><a href="#" onclick="window.print();return false">Print</a></li>
                    </ul>
                
                </div>
                
{{ if $gimme->publication->identifier == "2" }}
    {{ if ($gimme->section->number <= 70) || ($gimme->section->number > 90) }}
                
		{{ include file="_tpl/article-payment-link.tpl" }}
                
                <div class="article-border-bottom short-article-list margin-bottom clearfix">

                    {{* RELATED ARTICLES *}}                    
                    {{ list_related_articles }}
                    {{ if $gimme->current_list->at_beginning }}                    
                    <article>
                        <h5>Verwandte Artikel</h5>
                    {{ /if }}
                        <p><a href="{{ url options="article" }}">{{ $gimme->article->dateline }}</a> {{ $gimme->article->name }} <span class="comm">3</span></p>
                    {{ if $gimme->current_list->at_end }}                                            
                    </article>
                    {{ /if }}
                    {{ /list_related_articles }}                    
                    
                </div>
    {{ /if }}
{{ elseif $gimme->publication->identifier == "4" }}    
		{{ include file="_tpl/article-payment-link.tpl" }}
{{ /if }}
