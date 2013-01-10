<style type="text/css">

.ausgehen-message-holder {
    padding: 20px 0 50px 70px;
}

.no-event-found {
    margin-left: 20px;
}

.event-not-found {
    margin-left: 20px;
}

.event-canceled {
    margin-left: 20px;
}

.event_postponed {
    color: #B40032;
}

.class_img_hidden {
    display: none;
}

@media screen and (max-width: 768px) {
    #top-calendar {
        position: relative;
    }

    #top-calendar ul.calendar-options {
        overflow: visible;
    }

	#events_aside_part {
        overflow: visible;
	}

}

@media screen and (max-width: 1100px) {
    #top-calendar {
        margin-top: -24px;
    }

    #top-calendar ul.calendar-options {
        margin-left: 28px;
    }
}

</style>

<script type="text/javascript">

function set_slideshow() {

    $(".carousel_mov").jcarousel();

    $(".fancybox-thumb_mov").each(function() {
        $(this).fancybox({
            type: "image",
            prevEffect      : 'none',
            nextEffect      : 'none',
            helpers : {
                title   : {
                        type: 'outside'
                },
                thumbs  : {
                        width   : 50,
                        height  : 50
                }
            }
        });
    });

    $(".tabs_mov").tabs();

};

</script>
