<script type="text/javascript">

window.playlists_thumb_classes = ['ui-tabs-active', 'ui-state-active', 'ui-state-focus'];

window.playlists_autos = [];

window.playlists_auto_stage1 = function() {

    $(".thumb-gallery").each(function(ind_gal, obj_gal) {

        var cur_gal = {
            'rank': ind_gal,
            'boxes': [],
            'index': 0,
            'stopped': false,
            'thumbs': []
        };

        $(obj_gal).find(".gall-box").each(function(ind_box, obj_box) {
            var obj_img = $(obj_box).find("img");
            cur_gal.boxes.push({'box': obj_box, 'img': obj_img});
        });

        window.playlists_autos.push(cur_gal);

        var img_thumbs = [];

        $(obj_gal).find("ul").find("li").each(function(li_ind, li_obj) {
            img_thumbs.push(li_obj);

            $(li_obj).click({'gal': cur_gal, 'sub': li_ind}, function(ev_obj) {

                var thumb_classes = window.playlists_thumb_classes;
                var thumb_classes_count = thumb_classes.length;

                var gal_rank = ev_obj.data['gal']['rank'];
                window.playlists_autos[gal_rank]['stopped'] = true;

                var sub_rank = ev_obj.data['sub'];

                var set_gal = window.playlists_autos[gal_rank];
                var set_gal_size = set_gal['boxes'].length;
                for (set_ind = 0; set_ind < set_gal_size; set_ind++) {
                    var set_box = set_gal['boxes'][set_ind]['box'];
                    var set_img = set_gal['boxes'][set_ind]['img'];
                    $(set_box).hide();
                    if (sub_rank == set_ind) {
                        $(set_box).show();
                        $(set_img).fadeTo(0, 1, function() {});
                    }
                    else {
                        $(set_img).fadeTo(0, 1, function() {
                            $(set_box).hide();
                        });
                    }

                    var set_thumb = set_gal['thumbs'][set_ind];
                    for (var set_thm_ind = 0; set_thm_ind < thumb_classes_count; set_thm_ind += 1) {
                        $(set_thumb).removeClass(thumb_classes[set_thm_ind]);
                        if (sub_rank == set_ind) {
                            $(set_thumb).addClass(thumb_classes[set_thm_ind]);
                        }
                    }

                }

            });

        });

        cur_gal.thumbs = img_thumbs;

    });

};

window.playlists_auto_stage2 = function() {
    var gal_count = window.playlists_autos.length;

    for (var gal_ind = 0; gal_ind < gal_count; gal_ind++) {
        var cur_gal = window.playlists_autos[gal_ind];
        var cur_gal_size = cur_gal.boxes.length;

        if (1 < cur_gal_size) {
            setTimeout("window.playlists_image_switch(" + gal_ind + ");", 2000);
        }
    }

};

window.playlists_image_switch = function(gal_index) {
    var use_gal = window.playlists_autos[gal_index];
    if (use_gal['stopped']) {
        return;
    }

    var old_img = use_gal.boxes[use_gal['index']]['img'];
    $(old_img).fadeTo(500, 0.1, function() {
        if (use_gal['stopped']) {
            return;
        }

        var old_box = use_gal.boxes[use_gal['index']]['box'];
        $(old_box).css('display', "none");

        var thumb_classes = window.playlists_thumb_classes;
        var thumb_classes_count = thumb_classes.length;

        var old_thumb = use_gal.thumbs[use_gal['index']];
        for (var old_thm_ind = 0; old_thm_ind < thumb_classes_count; old_thm_ind += 1) {
            $(old_thumb).removeClass(thumb_classes[old_thm_ind]);
        }

        window.playlists_autos[gal_index]['index'] += 1;
        if (use_gal.boxes.length == window.playlists_autos[gal_index]['index']) {
            window.playlists_autos[gal_index]['index'] = 0;
        }
        use_gal = window.playlists_autos[gal_index];

        var new_thumb = use_gal.thumbs[use_gal['index']];
        for (var new_thm_ind = 0; new_thm_ind < thumb_classes_count; new_thm_ind += 1) {
            $(new_thumb).addClass(thumb_classes[new_thm_ind]);
        }

        var new_box = use_gal.boxes[use_gal['index']]['box'];
        $(new_box).css('display', "block");

        var new_img = use_gal.boxes[use_gal['index']]['img'];
        $(new_img).fadeTo(0, 0.1, function() {
            if (use_gal['stopped']) {
                return;
            }

            $(new_img).fadeTo(500, 1, function(){
                if (use_gal['stopped']) {
                    return;
                }
                setTimeout("window.playlists_image_switch(" + gal_index + ");", 3000);
            });

        });

    });

};

$(window).load(function() {
    window.playlists_auto_stage1();
    window.playlists_auto_stage2();
});

</script>

