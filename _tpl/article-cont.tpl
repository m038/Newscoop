              <article class="bottom-line single">

{{ assign var="prazno" value=1 }}
{{ capture name="image" }}
{{ image rendition="artfull" }}                
                  <figure>
              <img src="{{ $image->src }}" width="{{ $image->width }}" height="{{ $image->height }}" rel="resizable" style="max-width: 100%" alt="{{ $image->caption }} {{ if !($image->photographer == "") }}(bild: {{ $image->photographer }}){{ /if }}" />     
                  </figure>
{{ /image }} 
{{ /capture }}

{{ if trim($smarty.capture.image) == "" }}
{{ assign var="prazno" value=0 }} 
{{ else }} 
{{ $smarty.capture.image }}
{{ /if }} 
                    {{ if $prazno }}<div class="inline-box left top">{{ else }}<header class="bottom-line top-line">{{ /if }}
                      <h6>{{ if $gimme->article->dateline }}{{ $gimme->article->dateline }}{{ else }}{{ $gimme->article->NewsLineText }}{{ /if }}</h6>
                        <h3>{{ $gimme->article->name }}</h3>
                        <p>{{ if $gimme->article->lede }}{{ $gimme->article->lede }}{{ elseif $gimme->article->type_name == "newswire" }}{{ $gimme->article->DataLead }}{{ /if }}</p>
                    {{ if $prazno }}</div>{{ else }}</header>{{ /if }}

{{ if $prazno }}                    
{{ image rendition="artfull" }}                    
                    <p><small>{{ $image->caption }} {{ if !($image->photographer == "") }}(bild: {{ $image->photographer }}){{ /if }}</small></p>
{{ /image }} 
{{ /if }}
                   
                    <p><time>{{ $gimme->article->publish_date|camp_date_format:"%e.%m.%Y, %H:%i" }}</time> {{ if $gimme->article->comment_count  }}<a href="#comments" class="comm">{{ $gimme->article->comment_count }} Kommentare</a>{{ /if }} <a href="#" class="right print-small">Print</a></p>             
                    
{{ if $gimme->article->greybox|strip !== "" }}
                    <div class="inline-box right">
                        <h3>{{ if $gimme->article->greybox_title }}{{ $gimme->article->greybox_title }}{{ /if }}</h3>
                        {{ $gimme->article->greybox }}
                    </div> 
{{ /if }}                      
                    {{ include file="_tpl/_admin-edit.tpl" }}{{ $gimme->article->body }}

						  {{ include file="_tpl/article-slideshow.tpl" }}                         
                    
{{ if $gimme->article->subtitles_count(body) gt 1 }} 
                    <ul class="paging center">
            {{ list_subtitles field_name="body" }}  
{{ if $gimme->current_list->at_beginning }}
{{ if $gimme->article->body->has_previous_subtitles }} 
    <li><a href="{{ url options="previous_subtitle body" }}" class="button white prev">&lsaquo;</a></li> 
{{ /if }}
{{ /if }} 

{{ if ($gimme->article->current_subtitle_no(body)+1) == $gimme->current_list->index }} <li class="caption">{{ $gimme->current_list->index }} von {{ $gimme->current_list->count }}</li>{{ /if }}

{{ if $gimme->current_list->at_end }}
{{ if $gimme->article->body->has_next_subtitles }} 
    <li><a href="{{ url options="next_subtitle body" }}" class="button white next">&rsaquo;</a></li> 
{{ /if }} 
{{ /if }}
            {{ /list_subtitles }}
                    </ul>             
                    
                    
                    <ul class="page-content-nav top-line">
            {{ list_subtitles field_name="body" }}                    
                      <li{{ if ($gimme->article->current_subtitle_no(body)+1) == $gimme->current_list->index }} class="active"{{ /if }}><a href="{{ url }}">Teil {{ $gimme->current_list->index }} von {{ $gimme->current_list->count }} - {{ $gimme->subtitle->name }}</a></li>
            {{ /list_subtitles }}                     
                    </ul>                    
{{ /if }}                 

        {{ if $gimme->article->Kommentar }}<a class="button white center" href="{{ url options="template comments.tpl" }}">Alle Kommentare</a>{{ /if }}
                
                </article>

{{ include file="_tpl/article-rating.tpl" }}
