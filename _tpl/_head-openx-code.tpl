<!-- Generated by OpenX 2.8.10 -->
<script type='text/javascript'>
{{ if isset($smarty.request.mobile) || isset($smarty.request.tablet) || isset($smarty.request.phone) || $gimme->browser->browser_working == "webkit" && $gimme->browser->ua_type == 'mobile' }}
{{ assign var="mob-device" value=1 scope="global" }}
	var OA_zones = {'59':59,'60':60,'61':61,'62':62,'63':63};
{{ else }}
{{ assign var="mob-device" value=0 scope="global" }}
	var OA_zones = {'58':58,'35':35};
{{ /if }}
</script>
<script type='text/javascript' src='http://openx.sourcefabric.net/delivery/spcjs.php?id=11'></script>