                <div class="social-bar{{ if $gimme->publication->identifier == "2" || $gimme->publication->identifier == "4" }} bottom-line{{ /if }} clearfix">
                
                  <ul class="soc-options left">
                      <li class="fb"><a href="#">Facebook</a></li>
                      <li class="tw"><a href="#">Twitter</a></li>
                      <li class="gplus"><a href="#">Google+</a></li>
                        <li class="activate"><a href="#"><span class="phone-hide">Social-Media Dienste aktivieren</span></a></li>
                    </ul>
                    
                    <ul class="article-options right">
                      <li class="email"><a href="#">Email</a></li>
                      <li class="print"><a href="#">Print</a></li>
                    </ul>
                
                </div>
                
{{ if $gimme->publication->identifier == "2" }}
    {{ if ($gimme->section->number <= 70) || ($gimme->section->number > 80) }}
                
		{{ include file="_tpl/article-payment.tpl" }}

                <div class="box bottom-line centered-list">
                  <p><a href="#" class="icon-heart">Spenden an zentral+</a>
                </p></div>
                
                <div class="article-border-bottom short-article-list margin-bottom clearfix">
            
                    <article>
                        <h5>Mehr zum Thema</h5>
                        <p><a href="#">Kantonsrat</a> SVP, SP und Grüne drohen mit Referendum <span class="comm">3</span></p>
                        <p><a href="#">Irritation</a> Sicherheits-Vorkehrung der Bank kritisiert</p>
                        <p><a href="#">Aquise</a> Komax kau! deutsche Kabelprüfspezialistin</p>
                    </article>

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
{{ /if }}