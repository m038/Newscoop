<script type="text/javascript">

window.playlists_autos = [];

window.playlists_auto_stage1 = function() {

    $(".thumb-gallery").each(function(ind_gal, obj_gal) {

        var cur_gal = {
            'rank': ind_gal,
            'boxes': [],
            'index': 0,
            'stopped': false
        };

        $(obj_gal).find(".gall-box").each(function(ind_box, obj_box) {
            var obj_img = $(obj_box).find("img");
            cur_gal.boxes.push({'box': obj_box, 'img': obj_img});
        });

        window.playlists_autos.push(cur_gal);

        $(obj_gal).find("ul").find("li").each(function(li_ind, li_obj) {

            $(li_obj).click({'gal': cur_gal, 'sub': li_ind}, function(ev_obj) {

                var gal_rank = ev_obj.data['gal']['rank'];
                window.playlists_autos[gal_rank]['stopped'] = true;

                var sub_rank = ev_obj.data['sub'];

                var set_gal = window.playlists_autos[gal_rank];
                var set_gal_size = set_gal['boxes'].length;
                for (set_ind = 0; set_ind < set_gal_size; set_ind++) {
                    var set_box = set_gal['boxes'][set_ind]['box'];
                    var set_img = set_gal['boxes'][set_ind]['img'];
                    $(set_box).hide();
                    $(set_img).fadeTo(0, 1, function() {});
                    if (sub_rank == set_ind) {
                        $(set_box).show();
                    }
                }

            });

        });

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

        window.playlists_autos[gal_index]['index'] += 1;
        if (use_gal.boxes.length == window.playlists_autos[gal_index]['index']) {
            window.playlists_autos[gal_index]['index'] = 0;
        }
        use_gal = window.playlists_autos[gal_index];

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

