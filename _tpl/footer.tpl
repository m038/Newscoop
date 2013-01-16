	<div class="wide-wrapper">
    
    	<div class="content-wrapper" id="footer">

{{ local }}        
{{ unset_topic }}

        	<ul class="footer-list equal-heights clearfix">        	
            	<li>
            		{{ set_publication identifier="2" }}
            		{{ set_current_issue }}
            		{{ set_section number="300" }}
                	<h3>{{ $gimme->section->name }}</h3>
                    <ul>
                     {{ list_articles }}
                    	   <li><a href="{{ url options="article" }}">{{ $gimme->article->name }}</a></li>
                    	{{ /list_articles }}
                    </ul>

                </li>
                <li>
                	<h3>Themen</h3>
                    <ul>
                    		<!-- Delete asterisk (*) when link is created dynamically -->
                    	   <li><a href="/my-topics">Meine Themen</a></li>
                    		{{ list_sections constraints="number smaller_equal 100 number not 71 number not 72 number not 73 number not 80" }}
                        <li><a href="{{ url options="section" }}">{{ $gimme->section->name }}</a></li>
                        {{ /list_sections }}
                        {{ list_articles ignore_issue="true" ignore_section="true" length="1" constraints="type is weather_page" }}
                        <li><a href="{{ url options="article"}}?pg=prognosen">Wetter</a></li>
                        {{ /list_articles }}
                    </ul>
                </li>               
                <li>
                	<h3>Dialog</h3>
                    <ul>
                    		{{ list_articles length="1" ignore_section="true" constraints="type is debatte" }}
                    		<li><a href="{{ url options="article" }}">Pro + Contra</a></li>
                    		{{ /list_articles }}
                 		   {{ set_publication identifier="4" }}
            				{{ set_current_issue }}
            				{{ set_section number="100" }}
                        <li><a href="{{ url options="section" }}">Fundstücke</a></li>
                        <li><a href="{{ $view->url(['controller' => 'user', 'action' => 'index'], 'default') }}">Community</a></li>
                    </ul>
                </li>                 
                <li>
                	<h3>Blogs</h3>
                    <ul>
                    		{{ list_articles ignore_publication="true" ignore_issue="true" ignore_section="true" constraints="type is bloginfo" }}
                        <li><a href="{{ url options="section" }}">{{ $gimme->article->name }}</a></li>
								{{ /list_articles }}
                    </ul>
                </li>              
				{{ /local }}                
				{{ local }}        	
                <li>
                	<h3>Ausgehen</h3>
                    <ul>

{{* events *}}
{{ set_publication identifier="2" }}
{{ set_issue number="10" }}
{{ set_section number="71" }}
                    	<li><a id="footer_all_link" href="{{ url options="section" }}?type=event&date={{ $smarty.now|camp_date_format:"%Y-%m-%d" }}&region=region-zentralschweiz">Alles</a></li>
{{* movies *}}
{{ set_publication identifier="2" }}
{{ set_issue number="10" }}
{{ set_section number="72" }}
                        <li><a id="footer_kino_link" href="{{ url options="section" }}?type=kino&date={{ $smarty.now|camp_date_format:"%Y-%m-%d" }}&region=region-zentralschweiz">Kino</a></li>
{{* events *}}
{{ set_publication identifier="2" }}
{{ set_issue number="10" }}
{{ set_section number="71" }}
                        <li><a id="footer_theater_link" href="{{ url options="section" }}?type=theater&date={{ $smarty.now|camp_date_format:"%Y-%m-%d" }}&region=region-zentralschweiz">Theater</a></li>
                        <li><a id="footer_musik_link" href="{{ url options="section" }}?type=concert&date={{ $smarty.now|camp_date_format:"%Y-%m-%d" }}&region=region-zentralschweiz">Konzerte</a></li>
                        <li><a id="footer_party_link" href="{{ url options="section" }}?type=party&date={{ $smarty.now|camp_date_format:"%Y-%m-%d" }}&region=region-zentralschweiz">Partys</a></li>
                        <li><a id="footer_ausstellung_link" href="{{ url options="section" }}?type=exhibit&date={{ $smarty.now|camp_date_format:"%Y-%m-%d" }}&region=region-zentralschweiz">Ausstellungen</a></li>
                        <li><a id="footer_andere_link" href="{{ url options="section" }}?type=misc&date={{ $smarty.now|camp_date_format:"%Y-%m-%d" }}&region=region-zentralschweiz">Diverse</a></li>
{{* restaurants *}}
{{ set_publication identifier="2" }}
{{ set_issue number="10" }}
{{ set_section number="73" }}
                        <li><a id="footer_restaurants_link" href="{{ url options="section" }}?type=all&date={{ $smarty.now|camp_date_format:"%Y-%m-%d" }}&region=region-zentralschweiz">Restaurants</a></li>
                    </ul>
                </li>                
                <li>
                	<h3>Folgen Sie uns</h3>
                    <ul class="social">
                    	<li class="facebook"><a target="_blank" href="http://www.facebook.com/zentralplus">Facebook</a></li>
                        <li class="twitter"><a target="_blank" href="https://twitter.com/zentralplus">Twitter</a></li>
                        <li class="vimeo"><a target="_blank" href="https://vimeo.com/zentralplus">Vimeo</a></li>
                    </ul>
                </li>
            </ul><!-- / Footer list -->
            <p class="foot-copyright"><a target="_blank" href="http://www.mmv-online.ch">© MMV online AG - Alle Rechte vorbehalten</a></p>

            <ul class="phone-footer-nav">
               {{ set_article name="Kontakt" }}
            	<li><a href="{{ url options="article" }}">Kontakt</a></li>
            	{{ set_article name="Impressum" }}
            	<li><a href="{{ url options="article" }}">Impressum</a></li>
            	{{ set_article name="AGB" }}
            	<li><a href="{{ url options="article" }}">AGB</a></li>
            </ul>

{{ /local }}
            
        </div><!-- / Content wrapper Footer -->
    
    </div><!-- / Wide wrapper -->

    <div class="hide">
        <div id="kontakt-form" class="popup-form">
            <h4>Kontakt</h4>
            <form method="POST" id="kontakt-form" action="/contact/send" style="min-width:400px;">
                <fieldset>
                    <ul>
                        <li>
                            <select class="dropdownized22">
                                <option value="Nachricht an die Redaktion">Nachricht an die Redaktion</option>
                                <option value="Nachricht für den Verlag">Nachricht für den Verlag</option>
                                <option value="Bitte um Kontaktaufnahme">Bitte um Kontaktaufnahme</option>
                                <option value="Technische Hinweise">Technische Hinweise</option>
                                <option value="Passwortprobleme">Passwortprobleme</option>
                                <option value="Anderes Thema">Anderes Thema</option>
                            </select>
                        </li>
                        <li>
                            <label>Betreff</label>
                            <input type="text" name="subject" />
                        </li>
                        <li>
                            <label>Mitteilung<i>*</i></label>
                            <textarea style="min-width: 350px; min-height: 150px;" name="text"></textarea>
                        </li>
                        <li class="top-line">
                            <input type="submit" class="button red right" value="Senden" />
                        </li>
                    </ul>
                </fieldset>
            </form>
        </div>
        <div id="feedback-form" class="popup-form">
            <form method="POST" id="feedback-form" action="/feedback/save" style="min-width:400px;">
                <h4>Feedback</h4>
                <fieldset>
                    <ul>
                        <li>
                            <select class="dropdownized22" style="min-width: 200px;">
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
    </div>
    <script type="text/javascript">
    $(document).ready(function(){
        $('a.show-contact-form').click(function(){
            $.fancybox({
                'content' : $("#kontakt-form").html()
            });
        });

        $('form#kontakt-form').live('submit', function(e){
            e.preventDefault();
            var form = this;
            $.ajax({
                type: $(form).attr('method'),
                url: $(form).attr('action'),
                data: $(form).serializeArray()
            }).done(function( msg ) {
                $.fancybox.close()
                $.fancybox({
                    'content' : '<h2>Vielen Dank für Ihre Nachricht an zentral+.</h2>'
                });
            });
        });

        $('form#feedback-form').live('submit', function(e) {
            e.preventDefault();
            var form = this;

            {{ dynamic }}
            var data = {
                f_feedback_url: String(document.location),
                f_feedback_subject: $('finput#feedback-subject', form).val(),
                f_feedback_content: $('textarea#feedback-content', form).val(),
                f_language: '{{ $gimme->language->number }}',
                f_section: '{{ $gimme->section->id }}',
                f_article: '{{ $gimme->article->number }}',
                f_publication: '{{ $gimme->publication->identifier }}',
            };
            {{ /dynamic }}

            if ($('form#feedback-form input#feedback-attachment-type').val() == 'image') {
                data['image_id'] = $('form#feedback-form input#feedback-attachment-id').val();
            } else {
                data['document_id'] = $('form#feedback-form input#feedback-attachment-id').val();
            }
            
            $.ajax({
                type: 'POST',
                url: '{{ $view->baseUrl("/feedback/save/?format=json") }}',
                data: data,
                dataType: 'json',
                success: function(data) {
                    $.fancybox.close()
                    $.fancybox({
                        'content' : '<h2>{{ getGS('Response') }}</h2><h2>'+ data['response'] +'<h2>'
                    });
                }
            });
        });

        $('a.show-feedback-form').click(function(){
            $.fancybox({
                'content' : $("#feedback-form").html(),
                'afterShow' : function(upcoming, current) {
                    $('.fancybox-inner .input-file').attr('id', 'plupload-container');
                    $('.fancybox-inner .input-file .upload').attr('id', 'plupload-choose-file');
                    var uploader = new plupload.Uploader({
                        runtimes : 'html5,flash,silverlight',
                        browse_button : 'plupload-choose-file',
                        container : 'plupload-container',
                        max_file_size : '10mb',
                        url : '{{ $view->baseUrl("/feedback/upload/?format=json") }}',
                        flash_swf_url : '{{ $view->baseUrl("/js/plupload/js/plupload.flash.swf") }}',
                        silverlight_xap_url : '{{ $view->baseUrl("/js/plupload/js/plupload.silverlight.xap") }}',
                        filters : [
                            {title : "Image files", extensions : "jpg,gif,png,JPG,GIF,PNG"},
                            {title : "Pdf files", extensions : "pdf"}
                        ]
                    });

                    uploader.init();

                    uploader.bind('FilesAdded', function(up, files) {
                        $('.fancybox-inner form#feedback-form div.show-value').html('{{ getGS('Uploading...') }}');
                        up.start();

                        up.refresh(); // Reposition Flash/Silverlight
                    });

                    uploader.bind('FileUploaded', function(up, file, info) {
                        $('.fancybox-inner form#feedback-form div.show-value').html('{{ getGS('Done') }}');
                        var response = $.parseJSON(info['response'])['response'].split("_");
                        $('.fancybox-inner form#feedback-form input#feedback-attachment-type').val(response[0]);
                        $('.fancybox-inner form#feedback-form input#feedback-attachment-id').val(response[1]);
                    });
                }


            });
        $(".dropdownized22").dropdownized();
        });
    });
    </script>
