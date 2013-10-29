{{extends file="layout.tpl"}}

{{block page_name}}Community{{/block}}

{{block content_wrapper}}
		<div class="content no-bottom-line equal-heights clearfix">
        
        	<div class="main">
            
            	<article class="profile-single clearfix">
                    {{ include file="_tpl/user-image.tpl" size="big" class="left" }}
                    <div class="inner">
                        <h3>{{ $user->uname|escape }}{{ if $user->is_author }}<small class="red-mark">REDAKTION</small>{{ /if }}</h3>
                        <p>{{ $user['bio']|escape }}</p>
                        <span class="small-type">
                            <p>
                            {{ if $user['facebook'] }}Facebook: <a target="_blank" href="http://www.facebook.com/{{ $user['facebook']|escape:url }}" rel="nofollow">{{ $user['facebook']|escape }}</a><br />{{ /if }}
                            {{ if $user['twitter'] }}Twitter: <a target="_blank" href="http://www.twitter.com/{{ trim($user['twitter'], '@')|escape:url }}" rel="nofollow">@{{ trim($user['twitter'], '@')|escape }}</a><br />{{ /if }}
                            {{ if $user['google'] }}Google+: <a target="_blank" href="http://plus.google.com/{{ $user['google']|escape:url }}" rel="nofollow">{{ $user['google']|escape }}</a><br />{{ /if }}
                            {{ if $user['website'] }}Webseite: <a target="_blank" href="http://{{ $user['website']|escape:url }}" rel="nofollow">{{ $user['website']|escape }}</a><br />{{ /if }}
                            In der zentral+ Community seit: {{ $user->created }}</p>
                        </span>
                        {{ if $user->logged_in }}
                        <p>
                            {{* <a href="#" class="icon-email-big">ulfnotulf eine Nachricht senden</a><br /> *}}
                            <a href="{{ $view->url(['controller' => 'dashboard', 'action' => 'index'], 'default') }}" class="button white">Profil verwalten</a>
                        </p>
                        {{ /if }}
                    </div>
                
                </article>

                <!-- Start of the tabs -->

                <div class="tabs profile-page-tabs margin-bottom">
                    
                      <ul class="tab-nav clearfix">

{{ if $user->isAuthor() }}
{{ $escapedName=str_replace(" ", "\ ", $user->author->name) }}
{{ assign var="artCount" value=0 }}
{{ assign var="commCount" value=0 }}

{{ list_articles length=1 ignore_publication="true" ignore_issue="true" ignore_section="true" constraints="author is $escapedName type not static_page type not bloginfo type not debatte type not dossier type not editor_message type not poll" order="bypublishdate desc" }}{{* This one checks if there are articles to show, and how many *}}
                          <li role="tab"><a href="#comm-1"><strong><span class="phone-hide">Alle</span> Artikel</strong> ({{ $gimme->current_list->count }})</a></li>
                          {{ assign var="artCount" value=$gimme->current_list->count }}
{{ /list_articles }} 

{{ /if }}

{{ list_user_comments user=$user->identifier order="bydate desc" length=1 }} 

                          <li role="tab"><a href="#comm-2"><strong><span class="phone-hide">Alle</span> Kommentare</strong> ({{ $user->posts_count }})</a></li>
                          {{ assign var="commCount" value=$user->posts_count }}
{{ /list_user_comments }}                          

                        </ul>
                        {{ if $artCount + $commCount gt 0 }}
                        <div class="comment-content">
                        {{ /if }}

{{ list_articles length=100 columns=10 ignore_publication="true" ignore_issue="true" ignore_section="true" constraints="author is $escapedName type not static_page type not bloginfo type not debatte type not dossier type not editor_message type not poll" order="bypublishdate desc" }}

{{ if $gimme->current_list->at_beginning }}
                        <div id="comm-1">
                                                        
                            <div id="author-1" class="slideshow">

                                  <div class="slides">
{{ /if }}
{{ if $gimme->current_list->column == 1 }}
                                        <div class="slide-item">
{{ /if }}                                        
                                              <article>
                                                      <time>{{ $gimme->article->publish_date|camp_date_format:"%d.%m.%Y um %H:%i" }}</time>
                                                      <h4><a href="{{ $gimme->article->url }}" title="{{ $gimme->article->name|escape }}">{{ $gimme->article->name }}</a></h4>
                                                      <p>{{ $gimme->article->lede|trim }}</p>
                                              </article>


{{ if $gimme->current_list->column == "10" || $gimme->current_list->at_end }}
                                        </div><!-- /.slide-item -->
{{ /if }}                                        

{{ if $gimme->current_list->at_end }} 
                                  </div>

                        		<ul class="paging center">
                        			<li><a href="#" class="button white prev">&lsaquo;</a></li>
                        			<li class="caption">{{ ceil($gimme->current_list->index/10) }} von {{ ceil($gimme->current_list->count / 10) }}</li>
                        			<li><a href="#" class="button white next">&rsaquo;</a></li>
                      			</ul>                      

                            </div>
                                        
                        </div><!-- /#comm-1 -->

{{ /if }}
{{ /list_articles }}

{{ assign var="commentNumber" value=$user->posts_count }}

{{ list_user_comments user=$user->identifier order="bydate desc" length=100 columns=10 }} 
{{ if $gimme->current_list->at_beginning }}
                        <div id="comm-2" >

                            <div id="author-2" class="slideshow">
                            <div class="slides" >        
{{ /if }}                

{{ if $gimme->current_list->column == "1" }}
                                <div class="slide-item" >
{{ /if }}                                
                                    <article>
                                        <time>{{ $gimme->user_comment->submit_date }}{{*17.10.2013, 06:55*}}</time>
                                        <h4>{{ $gimme->user_comment->subject }}</h4>
                                        <p>
                                        {{ $gimme->user_comment->content|trim|truncate:500 }}
                                        <a href="{{ $gimme->user_comment->article->url }}">{{ $gimme->user_comment->article->name }}</a>
                                        </p>
                                    </article>
{{ if $gimme->current_list->column == "10" || $gimme->current_list->at_end }}
                                </div><!-- /.slide-item -->
{{ /if }}                                

{{ if $gimme->current_list->at_end }} 
                            </div><!-- /.slides -->

                        <ul class="paging center">
                        <li><a href="#" class="button white prev">&lsaquo;</a></li>
                        <li class="caption">{{ ceil($gimme->current_list->index/10) }} von {{ ceil($commentNumber / 10) }}</li>
                        <li><a href="#" class="button white next">&rsaquo;</a></li>
                      </ul>                      

                        </div>

                        </div><!-- /#comm-2 -->

{{ /if }}
{{ /list_user_comments }}

					{{ if $artCount + $commCount gt 0 }}
                    </div><!-- /.comment-content -->
                    {{ /if }}

                </div>

                <!-- end of the tabs -->               
{{*
                
                <div class="comment-content profile-comments">

<div class="slideshow clearfix">
                
{{ assign var="commentNumber" value=$user->posts_count }}                
                
{{ list_user_comments user=$user->identifier order="bydate desc" length=100 columns=10 }}                

				    {{ if $gimme->current_list->at_beginning }}
                	<h3>{{ $commentNumber }} Beiträge</h3>                
                	<ul class="slides">
                	{{ /if }}
                	{{ if $gimme->current_list->column == "1" }}
                          <li class="slide-item">
                                <ol>
                      {{ /if }}
                        <li>
                            <h5>{{ $gimme->user_comment->subject }}</h5>
                            <time>{{ $gimme->user_comment->submit_date }}</time>
                            <p>{{ $gimme->user_comment->content|trim|truncate:500 }}</p>
                            <small>zu <a href="{{ $gimme->user_comment->article->url }}">{{ $gimme->user_comment->article->name }}</a></small>
                        </li>
                        
                      {{ if $gimme->current_list->column == "10" || $gimme->current_list->at_end }}
                                </ol>
                            </li>
                      {{ /if }}                        
                        
                    {{ if $gimme->current_list->at_end }}
                    </ul>
                    {{ /if }}

                      {{ if $gimme->current_list->at_end }} 
                        </ul>
                        <ul class="paging center">
                        <li><a href="#" class="button white prev">&lsaquo;</a></li>
                        <li class="caption">{{ ceil($gimme->current_list->index/10) }} von {{ ceil($commentNumber / 10) }}</li>
                        <li><a href="#" class="button white next">&rsaquo;</a></li>
                      </ul>                      
                      {{ /if }} 
                                            
{{ /list_user_comments }}

</div>
                
                </div>
*}}                
            
            </div><!-- / Main -->
            
            <div class="aside phone-hide">
            
{{ include file="_tpl/sidebar-community.tpl" }}
            
            </div><!-- / Aside -->
        
        </div>
    
    </div><!-- / Content Wrapper -->

{{/block}}
