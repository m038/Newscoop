                  <div class="box" id="polldiv">
                      <h4 class="box-title"><img src="{{ url static_file="assets/img/logo_zentralplus.png" }}" alt="Zentral+ fragt">Zentral+ fragt</h4>

{{ list_articles length="1" ignore_issue="true" ignore_section="true" constraints="type is poll" }}
{{ list_debates length="1" item="article" }}

{{ if $gimme->debate_action->defined }}
                        <blockquote>{{ $gimme->debate->question }}</blockquote>
    {{ if $gimme->debate->user_vote_count >= $gimme->debate->votes_per_user || $gimme->debate_action->ok }}
    <p class="poll-info">Danke für Ihre Teilnahme!</p>
    {{ elseif $gimme->debate_action->is_error }}
    <p>Sie haben bereits abgestimmt (Sie haben nur eine Stimme.)</p>
    {{ /if }}                        
                        <ul class="question-list">
                        {{ list_debate_answers }}
                          <li>
                              <label for="radio{{ $gimme->current_list->index }}">{{ $gimme->debateanswer->answer }}</label>
                              <span class="q-score" style="width:{{ math equation="round(x)" x=$gimme->debateanswer->percentage_overall format="%d" }}%;"> <small>{{ math equation="round(x)" x=$gimme->debateanswer->percentage_overall format="%d" }}%</small></span>
                            </li>
                            {{ if $gimme->current_list->at_end }}
                            <li class="total-votes"><span>Total votes: 1034</span></li>
                            {{ /if }} 
                        {{ /list_debate_answers }}

                        </ul>

{{ else }}
  
   {{ if $gimme->debate->is_votable }}
   
                        <blockquote>{{ $gimme->debate->question }}</blockquote> 
                        {{ debate_form template="_tpl/front-poll.tpl" submit_button="Jetzt abstimmen" html_code="id=\"poll-button\" class=\"button red center\"" }}  
                        <input name="tpl" value="49" type="hidden">
                        <ul class="question-list">
                        {{ list_debate_answers }}
                          <li>
                              <!--input type="radio" id="radio{{ $gimme->current_list->index }}" name="radios1" /-->
                              {{ debateanswer_edit html_code="id=\"radio{{ $gimme->current_list->index }}\"" }}<label for="radio{{ $gimme->current_list->index }}">{{ $gimme->debateanswer->answer }}</label>
                              <span class="q-score" style="width:{{ math equation="round(x)" x=$gimme->debateanswer->percentage_overall format="%d" }}%;"> <small>{{ math equation="round(x)" x=$gimme->debateanswer->percentage_overall format="%d" }}%</small></span>
                          </li>
                        {{ /list_debate_answers }}
                        </ul> 
                        {{ /debate_form }}                        
                        
   {{ else }}                       
                        <blockquote>{{ $gimme->debate->question }}</blockquote> 
                        {{ if $gimme->debate->user_vote_count >= $gimme->debate->votes_per_user }}<p>Danke für Ihre Teilnahme!</p>{{ /if }}  
                        <ul class="question-list">
                        {{ list_debate_answers }}
                          <li>
                              <label for="radio{{ $gimme->current_list->index }}">{{ $gimme->debateanswer->answer }}</label>
                              <span class="q-score" style="width:{{ math equation="round(x)" x=$gimme->debateanswer->percentage_overall format="%d" }}%;"> <small>{{ math equation="round(x)" x=$gimme->debateanswer->percentage_overall format="%d" }}%</small></span>
                          </li>
                        {{ /list_debate_answers }}
                        </ul>    
   {{ /if }}
   
{{ /if }}   

{{ /list_debates }}                    
{{ /list_articles }} 

                    </div>                   