{{ dynamic }}
{{ if isset($smarty.request.mobile) || isset($smarty.request.tablet) || isset($smarty.request.phone) || $gimme->browser->browser_working == "webkit" && $gimme->browser->ua_type == 'mobile' }}
{{ assign var="isMobDevice" value=1 scope="global" }}	
{{ else }}
{{ assign var="isMobDevice" value=0 scope="global" }}
{{ /if }}
{{ /dynamic }}

<!-- Generated by OpenX 2.8.10 -->
<script type='text/javascript'>
extsrc.complete(function() { 
{{ if $isMobDevice }}
 var OA_zones = {'6':6};	
{{ else }}
    {{ if $gimme->template->name == "front.tpl" }}
	var OA_zones = {'1':1,'3':3};
	   {{ elseif $gimme->article->defined && $gimme->publication->identifier == 2 && $gimme->section->number == 20 }}
 var OA_zones = {'5':5};		   
	   {{ elseif $gimme->publication->identifier == 2 && $gimme->section->number == 20 }}
 var OA_zones = {'2':2,'4':4};	   
	   {{ /if }}	
{{ /if }}	
});
</script>

<script type='text/javascript' asyncsrc='http://openx.zentralplus.ch/delivery/spcjs.php?id=1'></script>
