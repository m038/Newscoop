{{ include file="_tpl/_html-head.tpl" inline }}

<body>

	<div class="content-wrapper">
    
{{ include file="_tpl/header-nav.tpl" }}
        
{{ include file="_tpl/header.tpl" }}

		<div class="content no-bottom-line equal-heights clearfix">
        
        	<div class="main">
            
				{{block content}}{{/block}}
            
            </div><!-- / Main -->
            
            <div class="aside phone-hide">
            
{{ include file="_tpl/sidebar-community.tpl" }}
            
            </div><!-- / Aside -->
        
        </div>
    
    </div><!-- / Content Wrapper -->
    
{{ include file="_tpl/footer.tpl" }}
	
{{ include file="_tpl/_html-foot.tpl" }}	

</body>
</html>