            	<div class="box highlight-box">
                
                	<h4 class="box-title icon-cross"><a href="{{ $view->url(['controller' => 'user', 'action' => 'index'], 'default') }}">zentral+ Community</a></h4>
                    <div class="community-box clearfix">
                    	<div class="mobile-half">
                            <ul class="community-list bottom-line">     
                                
{{ list_community_feeds length="5" }}                    

        {{ $created=$gimme->community_feed->created }}
        {{ $user=$gimme->community_feed->user }}

        {{ if $gimme->community_feed->type == 'user-register' && $user->uname }}
        <li class="user"><a{{ if $user->is_active }} href="{{ $view->url(['username' => $user->uname], 'user') }}"{{ /if }}>{{ $user->first_name }} {{ $user->last_name }}</a> ist neues Mitglied  / <time>{{ include file="_tpl/relative-date.tpl" date=$created }}</time></li>
        {{ elseif $gimme->community_feed->type == 'comment-recommended' && $gimme->community_feed->comment->article }}
        <li class="comment">Neuer Kommentar zu "<a href="{{ $gimme->community_feed->comment->article->url }}">{{ $gimme->community_feed->comment->article->title }}</a>" / <time>{{ include file="_tpl/relative-date.tpl" date=$created }}</time></li>
        {{ /if }}

{{ /list_community_feeds }}                                 
                                
                            </ul>
                            <p><a href="{{ $view->url(['controller' => 'user', 'action' => 'index'], 'default') }}">zur Community</a></p>
                            <p class="bottom-line">Die zentral+ Community hat bereits {{ number_format($gimme->getUserCount(), 0, '.', '\'') }} Mitglieder.</p>
                        </div>
                    </div>
                    <a href="/register" class="button red center">Jetzt mitmachen</a>
                
                </div>