{{extends file="layout.tpl"}}

{{block page_name}}Community{{/block}}

{{block content_wrapper}}
		<div class="content no-bottom-line equal-heights clearfix">
        
        	<div class="main">
            
            	<article class="profile-single clearfix">
                    {{ include file="_tpl/user-image.tpl" size="big" class="left" }}
                    <div class="inner">
                        <h3>{{ $user->uname|escape }}</h3>
                        <p>{{ $user['bio']|escape }}</p>
                        <span class="small-type">
                            <p>
                            {{ if $user['facebook'] }}Facebook: www.facebook.com/{{ $user['facebook']|escape }}<br />{{ /if }}
                            {{ if $user['website'] }}Webseite: {{ $user['website']|escape }}<br />{{ /if }}
                            In der zentral+ Community seit: {{ $user->created }}</p>
                        </span>
                        {{*
                        <p>
                            <a href="#" class="icon-email-big">ulfnotulf eine Nachricht senden</a><br />
                            <a href="#" class="button white">Pro"l verwalten</a>
                        </p>
                        *}}
                    </div>
                
                </article>
                
                <div class="comment-content profile-comments">
                
{{ list_user_comments user=$user->identifier columns="10" order="bydate desc" }}                

															{{ if $gimme->current_list->column == "1" }}
                	<h3>{{ $gimme->current_list->count }} Beiträge</h3>                
                	<ol>
                	{{ /if }}
                        <li>
                            <h5>{{ $gimme->user_comment->subject }}</h5>
                            <time>{{ $gimme->user_comment->submit_date }}</time>
                            <p>{{ $gimme->user_comment->content|trim }}</p>
                            <small>zu <a href="{{ $gimme->user_comment->article->url }}">{{ $gimme->user_comment->article->name }}</a></small>
                        </li>
                    {{ if $gimme->current_list->column == "10" || $gimme->current_list->at_end }}
                    </ol>
                    {{ /if }}
                                            
{{ /list_user_comments }}
                
                </div>
            
            </div><!-- / Main -->
            
            <div class="aside phone-hide">
            
{{ include file="_tpl/sidebar-community.tpl" }}
            
            </div><!-- / Aside -->
        
        </div>
    
    </div><!-- / Content Wrapper -->

{{/block}}
