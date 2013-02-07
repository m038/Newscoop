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
                            {{ if $user['facebook'] }}Facebook: <a href="http://www.facebook.com/{{ $user['facebook']|escape:url }}" rel="nofollow">{{ $user['facebook']|escape }}</a><br />{{ /if }}
                            {{ if $user['twitter'] }}Twitter: <a href="http://www.twitter.com/{{ trim($user['twitter'], '@')|escape:url }}" rel="nofollow">@{{ trim($user['twitter'], '@')|escape }}</a><br />{{ /if }}
                            {{ if $user['google'] }}Google+: <a href="http://plus.google.com/{{ $user['google']|escape:url }}" rel="nofollow">{{ $user['google']|escape }}</a><br />{{ /if }}
                            {{ if $user['website'] }}Webseite: <a href="http://{{ $user['website']|escape:url }}" rel="nofollow">{{ $user['website']|escape }}</a><br />{{ /if }}
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
                
                <div class="comment-content profile-comments">
                
{{ list_user_comments user=$user->identifier order="bydate desc" length=10 }}                

				    {{ if $gimme->current_list->at_beginning }}
                	<h3>{{ $user->posts_count }} Beiträge</h3>                
                	<ol>
                	{{ /if }}
                        <li>
                            <h5>{{ $gimme->user_comment->subject }}</h5>
                            <time>{{ $gimme->user_comment->submit_date }}</time>
                            <p>{{ $gimme->user_comment->content|trim }}</p>
                            <small>zu <a href="{{ $gimme->user_comment->article->url }}">{{ $gimme->user_comment->article->name }}</a></small>
                        </li>
                    {{ if $gimme->current_list->at_end }}
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
