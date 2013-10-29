    
    <script src="{{ uri static_file="assets/js/libs/jquery-ui-1.9.2.custom.min.js" }}"></script>
    <script src="{{ uri static_file="assets/js/libs/jquery.cycle.all.js" }}"></script>
    <script src="{{ uri static_file="assets/js/libs/jquery.jcarousel.min.js" }}"></script>
    <script src="{{ uri static_file="assets/js/libs/jquery.dropdownized.min.js" }}"></script>
    <script src="{{ uri static_file="assets/js/libs/jquery.fancybox.pack.js" }}"></script>
    <script src="{{ uri static_file="assets/js/libs/helpers/jquery.fancybox-thumbs.js?v=1.0.7" }}"></script>
    <script src="{{ uri static_file="assets/js/libs/jquery.ui.accordion.js" }}"></script>
    <script src="{{ uri static_file="assets/js/libs/jquery.tabs2carousel.js" }}"></script>
    <script src="{{ uri static_file="assets/js/libs/plupload/js/plupload.full.js" }}"></script>
    <!-- getunik -->

    <!--[if (gte IE 6)&(lte IE 8)]>
      <script type="text/javascript" src="{{ uri static_file="assets/js/libs/selectivizr-min.js" }}"></script>
    <![endif]-->

    {{ if empty($related) }}
        {{ $related = array() }}
    {{ /if }}

    <script type="text/javascript" src="{{ uri static_file="assets/js/libs/jquery.socialshareprivacy.js" }}"></script>

    <script type="text/javascript">
    jQuery(document).ready(function($){
      if($('#social_bookmarks').length > 0){
        $('#social_bookmarks').socialSharePrivacy({
            services: {
                  facebook: {
                        'app_id': '204329636307540',
                    'dummy_img': '{{ uri static_file="assets/img/icon-soc-bar-fb.png" }}'
                  }, 
                    twitter: {
                        'dummy_img': '{{ uri static_file="assets/img/icon-soc-bar-tw.png" }}',
                        'related': {{ json_encode(implode(',', $related)) }}
                    },
                    gplus: {
                        'display_name': 'Google Plus',
                        'dummy_img': '{{ uri static_file="assets/img/icon-soc-bar-gplus.png" }}'
                    }
            },
                'cookie_path': '/',
                'cookie_domain': document.location.host,
                'cookie_expires': 365,
                'css_path' : '{{ uri static_file="assets/js/libs/socialshareprivacy/socialshareprivacy.css" }}',
                'settings_perma': 'Button dauerhaft aktivieren',
                'info_button': ' Die Sharing-Buttons können Benutzungsdaten an Facebook, Twitter oder Google übermitteln. Wir haben sie deshalb standardmässig deaktiviert. Bitte aktivieren Sie sie, um sie zu nutzen.'        
        }); 
      }    
        {{ dynamic }}
        {{ if $gimme->user->is_admin }}
        $('a.editlink').each(function() {
            this.href = 'http://{{ $gimme->publication->site }}/admin/articles/edit.php?' + this.href.replace(/^.*#/, '');
        }).toggle();
        $('a.dashboard-editlink').each(function() {
            this.href = 'http://{{ $gimme->publication->site }}/admin/';
        }).toggle();
        {{ /if }}
        {{ /dynamic }}

    });
  </script> 
    

  <script src="{{ uri static_file="assets/js/init.js" }}"></script>
  <!-- load Getunik after the entire page and libraries have loaded  -->
  <script>
  $(window).bind("load", function() {
    var script = "<script src='https://dds-widget.getunik.net/widgets/plain/moaz-q8tch/js/dds-init-widget-de.js'><\/script>";
    $("head").append(script);
  });
  </script>

  <!--
  <script type="text/javascript">
    $(document).ready(function(){
        $(".dropdownized").change(function () {
            var tabs_tag = $(this).parents().eq(2);
            tabs_tag.tabs("option", "active",$(this).val());
        });
    });
  </script>
-->
