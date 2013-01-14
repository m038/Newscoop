    {{ if $gimme->user->logged_in }}
        {{ if $gimme->article->number && $gimme->article->comments_locked == 0 && $gimme->article->comments_enabled == 1 }}
            {{ if $gimme->submit_comment_action->defined && $gimme->submit_comment_action->rejected }}
                <p><br /><em>Your comment has not been accepted.</em></p>
            {{ /if }}

            {{ if $gimme->submit_comment_action->is_error }}
                <p><br /><em>{{ $gimme->submit_comment_action->error_message }}</em></p>
            {{ else }}
                {{ if $gimme->submit_comment_action->defined }}
                    {{ if $gimme->publication->moderated_comments }}
                        <p><br /><em>Your comment has been sent for approval.</em></p>
                    {{ /if }}
                {{ /if }}   
            {{ /if }}

                                <ul class="form comment-form">   
                                                             
            {{ comment_form submit_button="Abschicken" button_html_code="class=\"button red center\"" }}
                                	<li>
                                    	<label>Titel Ihres Kommentars</label>
                                        {{ camp_edit object="comment" attribute="subject" }}
                                    </li>  
                                	<li>
                                    	<label>Ihr Kommentar</label>
                                       {{ camp_edit object="comment" attribute="content" }}
                                    </li>                                              
            {{ /comment_form }}       
                                </ul>
                                
        {{ else }}
            <p>Comments are locked / disabled for this article.</p>
        {{ /if }}   
    {{ else }}
        <p><br />Um kommentieren zu können, müssen Sie auf Zentral+ eingeloggt sein. Bitte loggen Sie sich ein oder registrieren Sie sich.</p>
    {{ /if }}                                    
