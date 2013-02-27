<div id="feedback-form" class="popup-form">
    {{ if $gimme->user->logged_in }}
    <div class="popup-form">
    <form method="POST" id="feedback-form-form" action="/feedback/save?format=json" style="min-width:400px;">
        <h4>Feedback</h4>
        <fieldset>
            <ul>
                <li>
                    <select class="dropdownized-fancy-2" style="min-width: 200px;">
                        <option value="Feedback zum Artikel">Feedback zum Artikel</option>
                        <option value="Idee für einen Beitrag">Idee für einen Beitrag</option>
                        <option value="Bitte um Kontaktaufnahme">Bitte um Kontaktaufnahme</option>
                        <option value="Foto für die Fundstücke">Foto für die Fundstücke</option>
                    </select>
                </li>
                <li>
                    <label>Betreff</label>
                    <input type="text" id="feedback-subject" name="subject">
                </li>
                <li>
                    <label>Mitteilung<i>*</i></label>
                    <textarea cols="" rows="" id="feedback-content" name="content"></textarea>
                </li>
                <li class="input-file red">
                    <div class="show-value"></div>
                    <input type="file" class="upload" />
                </li>
                <li>
                    <p>Erlaubte Dateiformate: Bilder (jpg, png, gif) Dokumente (pdf)<br>
                    <small><i>*</i>Pflichtfeld</small></p>
                </li>
                <li class="top-line">
                    <input type="hidden" id="feedback-attachment-id" name="attachment_id" />
                    <input type="hidden" id="feedback-attachment-type" name="attachment_type" />
                    <input type="submit" class="button red right" value="Senden">
                </li>
            </ul>
        </fieldset>
    </form>
    </div>
    {{ else }}
    <h2>Sie müssen eingeloggt sein, um das Feedback-Formular nutzen zu können</h2>
    {{ /if }}
</div>