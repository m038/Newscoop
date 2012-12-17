{{ include file="_tpl/_debate_answers.tpl" scope="parent" }}

{{ capture name="votes" }}
    <ul class="debatte-score">
        {{ foreach $answers as $answer }}
        <li style="width:{{ $answer.percent }}%;" class="{{ if $answer@first }}ja{{ else }}nein{{ /if }}"><span><b>{{ $answer.answer|escape }}</b> {{ $answer.percent }}%</span></li>
        {{ /foreach }}
    </ul>
{{ /capture }}

{{ if !$gimme->debate->is_votable }}
    {{ if $gimme->debate->is_current && !$gimme->user->logged_in }}Zwischenresultat{{ else }}Endresultat{{ /if }}
    {{ $smarty.capture.votes }}
{{ /if }}
