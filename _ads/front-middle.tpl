{{ dynamic }}
{{ if isset($smarty.request.mobile) || isset($smarty.request.tablet) || isset($smarty.request.phone) || $gimme->browser->browser_working == "webkit" && $gimme->browser->ua_type == 'mobile' }}
<script type='text/javascript'><!--// <![CDATA[
    /* [id59] mobile - small banner */
    OA_show(59);
// ]]> --></script><noscript><a target='_blank' href='http://openx.sourcefabric.net/delivery/ck.php?n=30146ed'><img border='0' alt='' src='http://openx.sourcefabric.net/delivery/avw.php?zoneid=59&amp;n=30146ed' /></a></noscript>
{{ else }}
<script type='text/javascript'><!--// <![CDATA[
    /* [id35] Main Page Top Banner */
    OA_show(35);
// ]]> --></script><noscript><a target='_blank' href='http://openx.sourcefabric.net/delivery/ck.php?n=8be0e52'><img border='0' alt='' src='http://openx.sourcefabric.net/delivery/avw.php?zoneid=35&amp;n=8be0e52' /></a></noscript>
{{ /if }}
{{ /dynamic }}