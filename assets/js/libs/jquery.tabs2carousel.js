(function($) {                                        
	$.fn.tabs2carousel = function(o) {
		o = $.extend({
		}, o || {});
	
		return this.each(function() {

			var innerTabs = $(this),
				$innerTabs,
				innerTabsPanel,
				tabs,
				$tabs,
				tabsPanel,
				windowWidth = $(window).width();

			if ($(this).hasClass('inner-tabs')) {

				innerTabs = $(this);
					$innerTabs = innerTabs.tabs();
					innerTabsPanel = innerTabs.children('.ui-tabs-panel');
	
				innerTabsPanel.each(function(j){
					
					var innerTotalSize = innerTabsPanel.size() - 1;
									
					if (j != innerTotalSize) {
						innerNext = j + 2;
						$(this).prepend("<a href='#' class='button white prev next-inner-tab mover' rel='" + innerNext + "'>></a>");
					};
					
					if (j != 0) {
						innerPrev = j;
						$(this).prepend("<a href='#' class='button white next prev-inner-tab mover' rel='" + innerPrev + "'><</a>");
					};	
					
				});		
				
				$('.next-inner-tab, .prev-inner-tab').click(function() { 
					$(this).parent().parent().tabs('select', $(this).attr("rel"));
					$('.inner-tabs-header').html(innerTabs.filter(':visible').find('.ui-state-active a').html());
					return false;
				});	
	
				function windowWidthDetection() {
	
					if (windowWidth<768) {
						innerTabs.prepend('<div class="inner-tabs-header-holder"><div class="inner-tabs-header">'+innerTabs.filter(':visible').find('.ui-state-active a').html()+'</div></div>');
						$('.ui-tabs-nav').css({
							'display':'none'
						});
						$('.mover').css({
							'display':'block'
						});
						$('.next-tab, .prev-tab').css({
							'marginTop':'-102px'
						});
						$('.next-inner-tab, .prev-inner-tab').css({
							'marginTop':'-64px'
						});
					} else {
						innerTabs.children('.inner-tabs-header-holder').remove();
						$('.ui-tabs-nav').css({
							'display':'block'
						});
						$('.mover').css({
							'display':'none'
						});
					};			
				
				};
		
				windowWidthDetection();
		
				$(window).resize(function() {
					innerTabs.children('.inner-tabs-header-holder').remove();
					windowWidth = $(this).width();
					windowWidthDetection();
				});
							
			} else {

				tabs = $(this);
				$tabs = tabs.tabs();
				tabsPanel = tabs.children('.ui-tabs-panel');
	
				tabsPanel.each(function(i){
					
					var totalSize = tabsPanel.size() - 1;
									
					if (i != totalSize) {
						next = i + 2;
						$(this).prepend("<a href='#' class='button white prev next-tab mover' rel='" + next + "'>></a>");
					};
					
					if (i != 0) {
						prev = i;
						$(this).prepend("<a href='#' class='button white next prev-tab mover' rel='" + prev + "'><</a>");
					};	
					
				});		
				
				$('.next-tab, .prev-tab').click(function() { 
					$tabs.tabs('select', $(this).attr("rel"));
					$('.tabs-header').html(tabs.find('.ui-state-active a').html());
					$('.inner-tabs-header').html(tabsPanel.filter(':visible').find('.ui-state-active a').html());
					return false;
				});	
	
				function windowWidthDetection() {
	
					if (windowWidth<768) {
						tabs.prepend('<div class="tabs-header">'+tabs.find('.ui-state-active a').html()+'</div>');
						$('.ui-tabs-nav').css({
							'display':'none'
						});
						$('.mover').css({
							'display':'block'
						});
					} else {
						$('.tabs-header').remove();
						$('.ui-tabs-nav').css({
							'display':'block'
						});
						$('.mover').css({
							'display':'none'
						});
					};			
				
				};
		
				windowWidthDetection();
		
				$(window).resize(function() {
					$('.tabs-header').remove();
					windowWidth = $(this).width();
					windowWidthDetection();
				});
				
			};

		});
			
	};
})(jQuery);