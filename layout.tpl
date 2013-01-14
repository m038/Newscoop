{{ include file="_tpl/_html-head.tpl" }}

<body>

	<div class="content-wrapper">
    
{{ include file="_tpl/header-nav.tpl" }}
        
{{ include file="_tpl/header.tpl" inline }}

{{block content_wrapper}}
        <div class="content equal-heights no-bottom-line clearfix">
            <div class="main">
            {{block content}}{{/block}}
            </div>
            <div class="aside">
            {{block aside}}
                {{ include file="_tpl/sidebar-community.tpl" }}
                {{ include file="_tpl/sidebar-newsletter.tpl" }}
                {{ include file="_tpl/sidebar-debatte.tpl" }}
            {{/block}}
            </div><!-- / Aside -->
        </div>
    </div><!-- / Content Wrapper -->
{{/block}}

{{ include file="_tpl/footer.tpl" }}
	
{{ include file="_tpl/_html-foot.tpl" }}	

</body>
</html>
