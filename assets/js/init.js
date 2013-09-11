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
	$('.spec-tabs').tabs2carousel();

	//restaurant tabs with dropdown
    $("#rest_menu_sel").change(function () {
        var tabs_tag = $("#menu_tabs");
	var indx = tabs_tag.find(".article-tabs-holder div").index($("#"+$("#rest_menu_sel").val()));
        tabs_tag.tabs("option", "active",indx);
    });
	
	
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
	

	/* Micropayment article button */
	var startHeight= 0;
	var main = $(".main").first();
	$("#micropayment_button").click(function(){

		startHeight = main.height();
		$(".main").css("height","auto");

		$(this).parent().parent().hide();
		$("#payment-box").show();
		
		var newHeight = main.height();
		if (newHeight>startHeight) { 
			main.css("height",newHeight+"px");
		} else
			main.css("height",startHeight+"px");
	});
	$("#close_micropayment").click(function(){
		$("#payment-box").hide();
		$("#micropayment_button").parent().parent().show();
		main.css("height",startHeight+"px");
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
	$('.ticker-accordion').accordion({ header: '.head', autoHeight: false});
	$('.ticker-accordion a.head p').click(function(e){
		e.preventDefault();
		window.location.href = $(this).attr('target-link');
	});
	
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
	
	$('.mobile-nav > li > a[href="#"]').click(function() {
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
	
	$('.phone-accordion').accordion({header: 'h4', icons: false, autoHeight: false});
		
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

// daterange archive
if ($('.daterange-archive')[0]){

	var month = $('.month');
	// hide month grid
	month.css({
		height: 0
	});

	// get translated days of the week
	var makeWeekdays = function(){
			var weekday = $('#archive_list').data('weekdays');
			weekday = weekday.split(' ');
			var i = 0;
			do {
				weekday[i] = "<li class='day dotw'>" + weekday[i] + "</li>";
				weekday[i] = weekday[i].replace('.','');
				i = i + 1;
			}
			while (i < 7);
			weekday.splice(0,0,weekday.splice(-1,1)[0]);
			return weekday;
		};

	// add blank days to beginning of the list if the first isn't a Monday
	month.each(function(){
		var monthStart = $(this).find('li').first();
		var i = 1;
		var dayCount = $(this).find('li').length;
		var classes = ($(this).find('li').first().attr('class'));
		// remove day class
		classes = classes.replace('day', '');
		// remove week class
		function countDays(){
			var w = 0;
			var y = 52;
			var str;
			do {
				w = w + 1;
				str = w;
				if (w < 10){
					str = '0' + w;
				}
				classes = classes.replace('w' + str, '');
			}
			while (w < y);
		};
		countDays();
		// strip 'd' prefix
		classes = classes.replace('d', '');
		// remove spaces
		classes = classes.replace(' ', '').replace(' ', '');
		// remove the padding zeroes
		classes = classes.replace('0', '');
		// assign the result a usable name
		var iterator = parseInt(classes);
		matchClass = 'd' + iterator;
		// create a string for the days
		var dotw = makeWeekdays();
		if (monthStart.hasClass('d' + iterator)){
			iterator = iterator + 1;
			if (iterator > 7){
				iterator = 0;
			} else {
				do {
					i = i + 1;
					$(this).prepend('<li class="day prepend" />');
				}
				while (i < iterator);
			}
			var i = 0;
		}
		$(this).prepend(dotw);
	});

	var searchUrl = window.location.search;

    // only show this year's months
    if (searchUrl) {
        $('#archive_list > ol > li').hide();
    }

    var singleDay = false;
    var pattern = new RegExp('.+fqfrom\=(.+)\&fqto\=(.+)', 'i');
    var matches = pattern.exec(searchUrl);
    if (matches) {
        var selectedFromDate = (matches[1]) ? matches[1] : null;
        var selectedToDate = (matches[2]) ? matches[2] : null;
        var fromParts = selectedFromDate.split('-'); // format is YYYY-M-D
        var toParts = selectedToDate.split('-'); // format is YYYY-M-D

        if ((fromParts[2] == toParts[2])) {
            singleDay = true;
        } 
    }

	$('.daterange-archive').find('h3').append('<span />');
	$('.daterange-archive').find('h3').find('span').bind('click', function(){
		var sibling = $(this).parent().siblings();
		if (sibling.attr('style') === null || sibling.attr('style') === undefined ){
			sibling.css({
				height: 0
			});
		} else {
			sibling.attr({
				style: null
			});
		}
	});

	$('.year-list').find('a').each(function(){
		if ($(this).attr('href') === searchUrl || searchUrl === null || searchUrl === undefined || searchUrl === '') {
      // true: make all months active
      $('.daterange-archive h3').each(function(){
        $(this).addClass('active');
      });
		} else {
      // false: run the match
      $('.daterange-archive h3').each(function(){
          var archiveDate = pattern.exec($(this).find('a').attr('href'));
          if (archiveDate[1]) {
              var archiveDateParts = archiveDate[1].split('-');

              if ((archiveDateParts[0] === fromParts[0]) && (archiveDateParts[1] === fromParts[1])) {
                  $(this).addClass('active');
                  $(this).parent().parent().parent().show();
                  // if its a single day selection, expand the calender
                  if (singleDay) {
                      $(this).next('ol').height("auto");
                  }
              }
          }
      });
    }
  });
   
	$('.year-list ol li').each(function(){
		if ($(this).find('a').attr('href') === searchUrl){
			$(this).parent().find('.active').removeClass('active');
			$(this).addClass('active');
			var yearInt = searchUrl;
			yearInt = yearInt.replace('&','');
			yearInt = yearInt.replace('?','');
			yearInt = yearInt.replace('fqfrom=','');
			yearInt = yearInt.replace('fqto=','');
			yearInt = yearInt.split('-');
			yearInt = yearInt[0];
			$('#archive_list > ol > li h2').each(function(){
				if (this.innerHTML === yearInt){
					$(this).parent().show();
				} else {
					$(this).parent().hide();
				}
			});
		}
		if (searchUrl === "" || searchUrl === undefined || searchUrl === null) {
			$('#archive_list > ol > li h2').last().parent().show();
		}
	});


	// check to see if a tab is active
	// if not set the first one
	var hash = document.URL.substr(document.URL.indexOf('#')+1)
	// console.log(hash);
	if ($('.main.archive .tab-content').find('li')[0]){
		if ($('.daterange-archive .tab-nav').find('li').find('a').attr(hash)[0]){
			$('.daterange-archive .tab-nav').find('li').find('#' + hash).parent().addClass('ui-tabs-active ui-state-active');
		} else {
			$('.daterange-archive .tab-nav').find('li').first().addClass('ui-tabs-active ui-state-active');
		}
	}

}
