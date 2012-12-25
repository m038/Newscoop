                <div class="two-columns figcaption-highlight clearfix equal-heights">
                
                {{ assign var="secname" value=$gimme->section->name }}
                {{ assign var="counter" value=0 }}
                {{ list_articles length="2" ignore_section="true" constraints="type is dossier section is 100 $secname is on" }}
                  <article>
                      <figure>
                      {{ image rendition="arthalf" }}                
                          <img src="{{ $image->src }}" width="{{ $image->width }}" height="{{ $image->height }}" rel="resizable" style="max-width: 100%" alt="{{ $image->caption }} {{ if !($image->photographer == "") }}(bild: {{ $image->photographer }}){{ /if }}" />     
                      {{ /image }}
                            <figcaption>
                              <h6><a href="{{ url options="section" }}">Dossier</a></h6>
                                <h3><a href="{{ url options="article" }}">{{ $gimme->article->name }}</a></h3>
                            </figcaption>
                        </figure>
                        <p>{{ include file="_tpl/_admin-edit.tpl" }}{{ $gimme->article->lede|strip_tags:false }} <a href="{{ url options="article" }}">zum Dossier</a></p>
                    </article>
                    {{ assign var="counter" value=$counter+1 }}
                 {{ /list_articles }}
                
					  {{ if $counter lt 2 }}
					  {{ assign var="togo" value=2-$counter }}
                {{ list_articles length=$togo ignore_section="true" order="bypublishdate desc" constraints="type is dossier section is 100 $secname is off" }}
                  <article>
                      <figure>
                      {{ image rendition="arthalf" }}                
                          <img src="{{ $image->src }}" width="{{ $image->width }}" height="{{ $image->height }}" rel="resizable" style="max-width: 100%" alt="{{ $image->caption }} {{ if !($image->photographer == "") }}(bild: {{ $image->photographer }}){{ /if }}" />     
                      {{ /image }}
                            <figcaption>
                              <h6><a href="{{ url options="section" }}">Dossier</a></h6>
                                <h3><a href="{{ url options="article" }}">{{ $gimme->article->name }}</a></h3>
                            </figcaption>
                        </figure>
                        <p>{{ include file="_tpl/_admin-edit.tpl" }}{{ $gimme->article->lede|strip_tags:false }} <a href="{{ url options="article" }}">zum Dossier</a></p>
                    </article>
                 {{ /list_articles }}					  
					  {{ /if }}                
                
                </div>
