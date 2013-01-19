                <div class="two-columns clearfix equal-heights">
                
                {{ list_articles length="2" ignore_section="true" constraints="type is dossier section is 100" }}
                  <article>
                      <figure>
                      {{ image rendition="arthalf" }}                
                          <a href="{{ url options="article" }}"><img src="{{ $image->src }}" width="{{ $image->width }}" height="{{ $image->height }}" rel="resizable" style="max-width: 100%" alt="{{ $image->caption }} {{ if !($image->photographer == "") }}(Bild: {{ $image->photographer }}){{ /if }}" /></a>     
                      {{ /image }}
                            <figcaption>
                              <h6><a href="{{ url options="section" }}">Dossier</a></h6>
                                <h3><a href="{{ url options="article" }}">{{ $gimme->article->name }}</a></h3>
                            </figcaption>
                        </figure>
                        <p>{{ include file="_tpl/_admin-edit.tpl" }}{{ $gimme->article->lede|strip_tags:false }} <a href="{{ url options="article" }}">zum Dossier</a></p>
                    </article>
                 {{ /list_articles }}
                
                </div>
