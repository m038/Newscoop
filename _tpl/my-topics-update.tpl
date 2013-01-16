<div class="hide">
    {{ $checked = array() }}
    {{ foreach $userTopics as $topic }}
        {{ $checked[] = $topic->identifier }}
    {{ foreachelse }}
        {{ list_user_topics }}
            {{ $checked[] = $topic->identifier }}
        {{ /list_user_topics }}
    {{ /foreach }}

    <div id="themen-verwalten" class="popup-info-box clearfix">
        {{ form_topics id="follow_topics" }}
            {{ form_hidden name="languageId" value=$gimme->language->number }}

        <h4>Themen verwalten</h4>
        <p>Sie haben folgende Themen abonniert:</p>
        <ul class="bottom-line">
            {{ foreach $topics as $topic }}
            <li>
                <input type="hidden" name="topics[]" value="{{ $topic->identifier|escape }}" />
                <input type="checkbox" name="selected[]" value="{{ $topic->identifier|escape }}" id="t_{{ $topic->identifier }}" {{ if in_array($topic->identifier, $checked) }}checked{{ /if }} />
                <label for="t_{{ $topic->identifier }}">{{ $topic->name|escape }}</label>
            </li>
            {{ /foreach }}
        </ul>
        <input type="submit" value="Speichern" class="button red right" />
        {{ /form_topics }}
    </div>
</div><!-- / Popup -->

<script type="text/javascript">
$(function() {
    $('#follow_topics').submit(function(e) {
        var form = $(this);
        e.preventDefault();
        $.post($(this).attr('action'), $(this).serialize(), function(data, textStatus) {
            var infobox = $('<div />').addClass('infobox success').text("Ihre Auswahl wurde gespeichert."); 
            infobox.prependTo(form);
            setTimeout(function () { infobox.detach(); }, 3000);
        }, 'json');
    });
});
</script>
