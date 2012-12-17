$(window).load(function() {

	/* Sliders
	---------------------------------------------------------------- */
	$('.slides').each(function() {
        var $this = $(this), $ss = $this.closest('.slideshow');
        var prev = $ss.find('a.prev'), next = $ss.find('a.next'), cap = $ss.find('.caption');
        $this.cycle({
            prev: 		prev,
            next: 		next,
            fx: 		'scrollHorz',
			fit:		true,
			speed:		500,
			timeout:	0,
			after:     	onAfter
        });
		function onAfter(curr,next,opts) {
			var caption = (opts.currSlide + 1) + ' von ' + opts.slideCount;
			$(cap).html(caption);
		}
    });
	
	
	/* Popups
	---------------------------------------------------------------- */
	$('ul.header-menu > li.expandable').hover(function(){
		$(this).children('a').addClass('active');
		$(this).children('.popup').show();
	},
	function(){
		$(this).children('a').removeClass('active');
		$(this).children('.popup').hide();
	});
	$('ul.place-date > li').hover(function(){
		$(this).children('a').addClass('active');
		$(this).children('.popup').show();
	},
	function(){
		$(this).children('a').removeClass('active');
		$(this).children('.popup').hide();
	});
	
	$('a.mobile-nav-trigger').toggle(function(){
		$(this).addClass('active');
		$('#top ul.left').slideDown('fast');
	},
	function(){
		$(this).removeClass('active');
		$('#top ul.left').slideUp('fast');
	});
	
	/* Tabs
	---------------------------------------------------------------- */
	$('.tabs').tabs();
	
	
	/* Carousel
	---------------------------------------------------------------- */
	$('.carousel').jcarousel();
	
	
	/* Datepicker
	---------------------------------------------------------------- */
	$( "#ausgehen-datepicker" ).datepicker({
		numberOfMonths: 3,
		prevText: "‹",
		nextText: "›"
		});
	$('#datapicker-trigger').click(function(){
		$(this).toggleClass('active');
		$('#wann-calendar').toggle();
		$('.popup-overlay').fadeToggle();
		return false;
	});
	
	
	/* Fancybox
	---------------------------------------------------------------- */
	$('.fancybox').fancybox();
	$('.fancybox-gallery').fancybox({type: 'inline'});
	$(".fancybox-thumb").fancybox({
		prevEffect	: 'none',
		nextEffect	: 'none',
		helpers	: {
			title	: {
				type: 'outside'
			},
			thumbs	: {
				width	: 50,
				height	: 50
			}
		}
	});
	
	$('.dropdownized').dropdownized();
	
	$('.close-box').click(function(){
		$(this).parent().parent().hide();
		return false;
	});
	
	$('input.upload').change(function(e){
	  $in=$(this);
	  $in.prev().html($in.val());
	});
	
	
	$('.mobile-nav li.user a').click(function(){
		$(this).parent().toggleClass('active');
		$('.popup-register').toggle();
	});
	
	
	/* Accordion */
	$('.ticker-accordion').accordion({ header: '.head' });
	
	
	
	/* Custom form elements
	---------------------------------------------------------------- */
	$(function() {
		 $('input[type=radio]')
            .button({icons: {
                primary: "ui-icon-radio"
            }, text: false
         });
		 $('input[type=checkbox]')
            .button({icons: {
                primary: "ui-icon-checkbox"
            }, text: false
         });
    });
	
	var windowWidth = $(window).width();
	if(windowWidth > 1100) {
	
	/* Equal column heights
	---------------------------------------------------------------- */
	function maxHeight(parent, child) {
		$(parent).each(function() {
			var maxHeight = 0;
			$(this).children(child).each(function() {
				if ($(this).height() > maxHeight) {
					maxHeight = $(this).height()
				};
			});
			$(this).children(child).not('.box-2').css({
				'height': maxHeight
			});
		});
	};
	maxHeight('.equal-heights', 'li');
	maxHeight('.equal-heights', 'div');
	maxHeight('.equal-heights', 'article');
	maxHeight('.event-list article ul', 'li');
}


});