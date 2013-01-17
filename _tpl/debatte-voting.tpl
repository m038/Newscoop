    {{ list_debates length="1" item="article" }}

<div class="score-box highlight">

    {{ include file="_tpl/debate_votes_total.tpl" scope="parent" }}

    {{ if $gimme->debate->is_votable }}
        {{ $smarty.capture.votes }}
        {{ include file="_tpl/debatte-deadline.tpl" }}
    {{ /if }}     


{{ if $gimme->default_article->defined }}
	<div class="vote-box">
	<div class="button-group">
    {{ if $gimme->debate->is_votable }}
    {{ debate_form template="_article/article-debatte.tpl" submit_button=false }}
        {{ list_debate_answers order="bynumber asc" }}          
            
<a onclick="$('#answer-{{ $gimme->debateanswer->number }}').attr('checked','checked');$(this).parents('form:eq(0)').submit(); return false;" href="javascript:void(0)" class="button red">{{ $gimme->debateanswer->answer }}</a>            
            
            <!-- f_debateanswer_nr name mandatory -->
            <input type="radio" name="f_debateanswer_nr"
                value="{{ $gimme->debateanswer->number }}" id="answer-{{ $gimme->debateanswer->number }}"
                onclick="$(this).parents('form:eq(0)').submit();" style="display:none" />

        {{ /list_debate_answers }}
    <input type="submit" id="submit-debate" class="button" value="I think so!" style="display:none" />
    {{ /debate_form }}
    {{ /if }}
    
    {{ if $gimme->debate->is_votable }}<p>Sie können Ihre Meinung bis zum Ende der Debatte ändern, wenn Sie die Gegenseite doch mehr überzeugt.</p>
    {{ elseif $gimme->user->logged_in or !$gimme->debate->is_current }}<p>Die Debatte ist abgeschlossen. Das Endresultat steht fest.</p>
    {{ elseif $gimme->debate->is_current && !$gimme->user->logged_in }}<p>Bitte loggen Sie sich ein, um abzustimmen.</p>{{ /if }}      
    
    </div>     
    </div>   
{{ /if }}         

</div>
    {{ /list_debates }}                          
