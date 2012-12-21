                <div class="box{{ if !($gimme->template->name == "front.tpl") }} bottom-line{{ /if }}"> 
                
                  <h4 class="box-title"><img src="{{ uri static_file="pictures/title-icons/globe.png" }}" alt="" />Ticker</h4>
                    <div class="slideshow clearfix">
                      
                      {{ assign var="mydate" value=strtotime('-1 days') }} 
                      {{ $mydate=$mydate|date_format:'%Y-%m-%d' }}    
                      {{ if $gimme->default_section->defined }}     
                      {{ assign var="secCond" value="section is {{ $gimme->section->number }}" }}
                      {{ else }}
                      {{ assign var="secCond" value="" }}
                      {{ /if }}  
                      {{ list_articles columns="5" length="50" order="bypublishdate desc" ignore_section="true" constraints="type is newswire publish_date greater_equal $mydate $secCond" }}
                      {{ if $gimme->current_list->at_beginning }}
                      <ul class="slides">
                      {{ /if }}
                      {{ if $gimme->current_list->column == "1" }}
                          <li class="slide-item">
                                <ul class="custom-list">
                      {{ /if }}
                                    <li class="cross">
                                        <h3><a href="{{ url options="article" }}">{{ $gimme->article->name }}</a></h3>
                                        <p>{{ $gimme->article->body|strip_tags:false|truncate:50 }}</p>
                                        <time>Artikel, sda, {{ include file="_tpl/relative-date.tpl" date=$gimme->article->publish_date }}</time>
                                    </li>
                                    
                      {{ if $gimme->current_list->column == "5" || $gimme->current_list->at_end }}
                                </ul>
                            </li><!-- / Slide 1 -->
                      {{ /if }}
                      
                      {{ if $gimme->current_list->at_end }} 
                        </ul>
                        <ul class="paging left">
                        <li><a href="#" class="button white prev">&lsaquo;</a></li>
                        <li><a href="#" class="button white next">&rsaquo;</a></li>
                      </ul>                      
                      {{ /if }}    
                      
                      {{ /list_articles }}

                      {{ if $gimme->prev_list_empty }}
                      <p>No newswire articles in system yet, or at least no newswires in last 24 hours... stay tuned.</p>
                      {{ /if }}


                      <a href="{{ url options="template ticker.tpl" }}" class="button white right">Alle News</a>
                    </div>
                
                </div>
