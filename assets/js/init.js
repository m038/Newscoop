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
	
	$('ul.weather > li.expandable > a').toggle(function(){
		$(this).addClass('active');
		$(this).next('.popup').show();
	},
	function(){
		$(this).removeClass('active');
		$(this).next('.popup').hide();
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
	//$('.spec-tabs').tabs2carousel();
	
	
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
	
	
	/* Accordion */
	$('.ticker-accordion').accordion({ header: '.head' });
	
	
	/* Poll Ajaxified
	-------------------------------------------------------*/
	$('#poll-button').click(function(){
		$.post($('form[name=debate]').attr("action"),$('form[name=debate]').serialize(),function(data){$('#polldiv').html(data);});
		return false;
	}); 

	/* Locations search
	---------------------------------------------------------------- */
	$('.weather-loctions ul.level-1 li a').click(function(){
		$('.weather-loctions').addClass('no-map');
		$('.weather-loctions ul.level-1 li').removeClass('active');
		$(this).parent().addClass('active');
		$('.weather-loctions ul.level-2').show();
		$('.weather-loctions p.info').hide();
		$('.weather-loctions p.close-search').show();
		return false;
	});
	$('.weather-loctions ul.level-2 li a').click(function(){
		$('.weather-loctions ul.level-2 li').removeClass('active');
		$(this).parent().addClass('active');
		$('.weather-loctions ul.level-3').show();
		return false;
	});
	$('.weather-loctions p.close-search a').click(function(){
		$('.weather-loctions').removeClass('no-map');
		$('.weather-loctions ul.level-2, .weather-loctions ul.level-3').hide();
		$('.weather-loctions ul li').removeClass('active');
		$('.weather-loctions p.info').show();
		$(this).parent().hide();
		return false;
	});
	
	
	/* Table triggers */
	$('table a.trigger').click(function(){
		$(this).toggleClass('active');
		$(this).parent().parent().next('tr.inner').find('.inner-table').slideToggle('fast');
		return false;
	});
	$('.table-collapse-trigger a').click(function(){
		$(this).parent().toggleClass('active');
		$(this).parent().next('div').slideToggle('fast');
		return false;
	});
	
	
	$('.details-more').click(function(){
		$(this).next('.details-placeholder').slideDown('fast');
		$(this).hide();
		return false;
	});
	
	$('.prognosen-menu-trigger').click(function(){
		$(this).toggleClass('active');
		$(this).next('ul').slideToggle('fast');
	});
	
	
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
	
	
	/* Phone navigation
	---------------------------------------------------------------- */
	/*$('.mobile-nav > li > a').toggle(function(){
		$('.mobile-nav > li.active').removeClass('active');
		$(this).parent().addClass('active');
	},
	function(){
		$(this).parent().removeClass('active');
	});*/
	
	$('.mobile-nav > li > a').click(function() {
		if ($(this).parent().hasClass('active')) {
			$('.mobile-nav > li').removeClass('active');
		} else {
			$('.mobile-nav > li').removeClass('active');
			$(this).parent().addClass('active');
		}
		return false;
	});
	
	$('a.place-mobile-trigger').click(function(){
		$('.place-date .popup').toggle();
	});
	
	
	$('.forgot-pass-trigger').click(function(){$('.login-inner-box').hide();$('.forgot-pass-inner-box').show();});
	$('.login-back-trigger').click(function(){$('.forgot-pass-inner-box').hide();$('.login-inner-box').show();});
	
	
	var windowWidth = $(window).width();
	if(windowWidth > 1100) {
		
	$('.weather-filter .search').hover(function(){
		$(this).children('p').fadeToggle('fast');
	});
	
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

var windowWidth = $(window).width();
	if(windowWidth < 768) {
		
	$('.phone-tabs').tabs();
	
	$('.phone-accordion').accordion({header: 'h4', icons: false});
		
	$('.weather-loctions ul.level-1 li a').click(function(){
		$('.weather-loctions').addClass('no-map');
		$('.weather-loctions ul.level-1 li').removeClass('active');
		$(this).parent().addClass('active');
		$('.weather-loctions ul.level-2').show();
		$('.weather-loctions p.info').hide();
		$('.weather-loctions p.close-search').show();
		$('.weather-loctions ul.level-1').hide();
		return false;
	});
	$('.weather-loctions ul.level-2 li a').click(function(){
		$('.weather-loctions ul.level-2 li').removeClass('active');
		$(this).parent().addClass('active');
		$('.weather-loctions ul.level-3').show();
		$('.weather-loctions ul.level-2').hide();
		return false;
	});
	
	$('.weather-loctions p.close-search a').click(function(){
		$('.weather-loctions').removeClass('no-map');
		$('.weather-loctions ul.level-2, .weather-loctions ul.level-3').hide();
		$('.weather-loctions ul li').removeClass('active');
		$('.weather-loctions p.info').show();
		$(this).parent().hide();
		$('.weather-loctions ul.level-1').show();
		return false;
	});
	
}

});