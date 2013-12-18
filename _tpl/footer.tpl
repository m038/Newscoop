  <div class="wide-wrapper">
    {{ include file="_tpl/newsletter-form.tpl" }}
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
                        {{ list_sections constraints="number smaller_equal 100 number not 71 number not 72 number not 73 number not 80 number not 50" }}
                        <li><a href="{{ url options="section" }}">{{ $gimme->section->name }}</a></li>
                        {{ /list_sections }}
                        {{ list_articles ignore_publication="true" ignore_issue="true" ignore_section="true" length="1" constraints="type is weather_page" }}
                        <li><a href="{{ url options="article"}}?pg=prognosen">Wetter</a></li>
                        {{ /list_articles }}
                        {{ list_articles length="1" ignore_publication="true" ignore_issue="true" ignore_section="true" constraints="type is archive" }}
                    <li><a href="{{ url options="article" }}">Archiv</a></li>
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
                         <li><a class="show-newsletter-form" href="#">Newsletter PopUp</a></li>
                    </ul>
                </li>
            </ul><!-- / Footer list -->
            <p class="foot-copyright"><a target="_blank" href="http://www.mmv-online.ch">© MMV online AG - Alle Rechte vorbehalten</a></p>

            <ul class="phone-footer-nav">
               {{ set_article number="11143" }}
              <li><a href="{{ url options="article" }}">{{ $gimme->article->name }}</a></li>
              {{ set_article number="11141" }}
              <li><a href="{{ url options="article" }}">{{ $gimme->article->name }}</a></li>
              {{ set_article number="11147" }}
              <li><a href="{{ url options="article" }}">{{ $gimme->article->name }}</a></li>
            </ul>

{{ /local }}
            
        </div><!-- / Content wrapper Footer -->
    
    </div><!-- / Wide wrapper -->

    <div class="hide">
        {{ render file="_tpl/feedback-form.tpl" }}
    </div>
    <script type="text/javascript">
    $(document).ready(function(){
        $('a.show-contact-form').live('click', function(e){
            e.preventDefault();

            $.fancybox({
                type: 'iframe',
                width: 520,
                'autoScale'         : false,
                'autoDimensions'    : false,
                'scrolling'         : 'no',
                'transitionIn'      : 'none',
                'transitionOut'     : 'none',
                href: '{{ $view->baseUrl("/contact/index") }}'
            });
        });

        $('a.close-newsletter').live('click', function(e){
            e.preventDefault();

             $.fancybox.close()
        });

        $('form#feedback-form-form').live('submit', function(e) {
            e.preventDefault();
            var form = this;

            {{ dynamic }}
            var data = {
                f_feedback_url: String(document.location),
                f_feedback_subject: $('input#feedback-subject', form).val(),
                f_feedback_content: $('textarea#feedback-content', form).val(),
                f_language: '{{ $gimme->language->number }}',
                f_section: '{{ $gimme->section->id }}',
                f_article: '{{ $gimme->article->number }}',
                f_publication: '{{ $gimme->publication->identifier }}',
            };
            {{ /dynamic }}

            if ($('.fancybox-inner form#feedback-form-form input#feedback-attachment-type').val() == 'image') {
                data['image_id'] = $('.fancybox-inner form#feedback-form-form input#feedback-attachment-id').val();
            } else {
                data['document_id'] = $('.fancybox-inner form#feedback-form-form input#feedback-attachment-id').val();
            }
            
            $.ajax({
                type: 'POST',
                url: '{{ $view->baseUrl("/feedback/save/?format=json") }}',
                data: data,
                dataType: 'json',
                success: function(data) {
                    $.fancybox.close()
                    $.fancybox({
                        'content' : '<h2>'+ data['response'] +'<h2>'
                    });
                }
            });
        });


 $('a.show-newsletter-form').live('click', function(e){
            e.preventDefault();

            $.fancybox({
                'content' : $("#newsletter-form").html(),
                type: 'iframe',
                width: 520,
                'autoScale'         : false,
                'autoDimensions'    : false,
                'scrolling'         : 'no',
                'transitionIn'      : 'none',
                'transitionOut'     : 'none'
            });
        });

        $('a.show-feedback-form').live('click', function(e){
            e.preventDefault();
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

                    uploader.bind('Init', function(up) {
                        var is_firefox = navigator.userAgent.toLowerCase().indexOf('firefox') > -1;
                        if (is_firefox) {
                            uploader.refresh();
                        }
                    });

                    uploader.init();

                    uploader.bind('FilesAdded', function(up, files) {
                        $('.fancybox-inner form#feedback-form-form div.show-value').html('{{ getGS('Uploading...') }}');
                        up.start();

                        up.refresh(); // Reposition Flash/Silverlight
                    });

                    uploader.bind('FileUploaded', function(up, file, info) {
                        $('.fancybox-inner form#feedback-form-form div.show-value').html('{{ getGS('Done') }}');
                        var response = $.parseJSON(info['response'])['response'].split("_");
                        $('.fancybox-inner form#feedback-form-form input#feedback-attachment-type').val(response[0]);
                        $('.fancybox-inner form#feedback-form-form input#feedback-attachment-id').val(response[1]);

                        up.refresh();
                    });

                    if ($(".fancybox-outer .dropdownized-fancy-2").hasClass('ui-dropdownized')) {
                        // do something
                    } else { 
                        $(".fancybox-outer .dropdownized-fancy-2").dropdownized(); 
                    } 
                }
            });
        });
    });

    // initialize weather widget
    // and request data from meteonews 3h forecast feeds
    meteonews.init(function() {
        meteonews.setSymbolsPath('{{ url static_file="assets/img/meteonews/symb/" }}');
        meteonews.hideLoading();

        var luzernFeed = 'forecasts/geonames/2659811.xml';
        var zugFeed = 'forecasts/geonames/2657908.xml';
        var params = [];
        params.cumulation = "3h";
        params.begin = meteonews.startDate;
        params.end = meteonews.startDate;
        var date = new Date();
        var thisHour = ('0' + date.getHours()).slice(-2) + '00';
        date.setHours(date.getHours() +2); 
        var maxHour = ('0' + date.getHours()).slice(-2) + '00';

        meteonews._send(luzernFeed, params, function(response) {
            var results = response.forecasts.content.timeperiod;
            for (var r in results) {
                var result = results[r];
                var time = meteonews.formatTime(meteonews.getDateObj(result['@attributes']['end_datetime']));
                var timeId = time.replace(':', ''); 
                var tempAvg = (result['temp_avg']['@text']) ? result['temp_avg']['@text'] : 0;
                
                if ((timeId === thisHour) || (timeId < maxHour) || (timeId == maxHour)){
                    if (timeId === "0000") {
                        if ((maxHour === "0000") || (maxHour == "0100")) {
                            $('#luzern-temp-now').text(tempAvg+'° Luzern'); 
                            $('#luzern-img-now').attr('src',meteonews.symbolsPath + result.symb + '.png');
                            $('#luzern-temp-now-mobile').text(tempAvg+'° Luzern'); 
                            $('#luzern-img-now-mobile').attr('src',meteonews.symbolsPath + result.symb + '.png');
                        }
                    } else {
                        $('#luzern-temp-now').text(tempAvg+'° Luzern'); 
                        $('#luzern-img-now').attr('src',meteonews.symbolsPath + result.symb + '.png');
                        $('#luzern-temp-now-mobile').text(tempAvg+'° Luzern'); 
                        $('#luzern-img-now-mobile').attr('src',meteonews.symbolsPath + result.symb + '.png');
                    }
                }
                $('#luzern-temp-' + timeId).text(tempAvg+'°'); 
                $('#luzern-img-' + timeId).attr('src',meteonews.symbolsPath + result.symb + '.png');
            } 
        });
        meteonews._send(zugFeed, params, function(response) {
            var results = response.forecasts.content.timeperiod;
            for (var r in results) {
                var result = results[r];
                var time = meteonews.formatTime(meteonews.getDateObj(result['@attributes']['end_datetime']));
                var timeId = time.replace(':', ''); 
                var tempAvg = (result['temp_avg']['@text']) ? result['temp_avg']['@text'] : 0;

                if ((timeId === thisHour) || (timeId < maxHour) || (timeId == maxHour)){
                    if (timeId === "0000") {
                        if ((maxHour === "0000") || (maxHour == "0100")) {
                            $('#zug-temp-now').text(tempAvg+'° Zug'); 
                            $('#zug-img-now').attr('src',meteonews.symbolsPath + result.symb + '.png');
                            $('#zug-temp-now-mobile').text(tempAvg+'° Zug'); 
                            $('#zug-img-now-mobile').attr('src',meteonews.symbolsPath + result.symb + '.png');
                        }
                    } else {
                        $('#zug-temp-now').text(tempAvg+'° Zug'); 
                        $('#zug-img-now').attr('src',meteonews.symbolsPath + result.symb + '.png');
                        $('#zug-temp-now-mobile').text(tempAvg+'° Zug'); 
                        $('#zug-img-now-mobile').attr('src',meteonews.symbolsPath + result.symb + '.png');
                    }
                }
                $('#zug-temp-' + timeId).text(tempAvg+'°'); 
                $('#zug-img-' + timeId).attr('src',meteonews.symbolsPath + result.symb + '.png');
            } 

        });
    });
    </script>