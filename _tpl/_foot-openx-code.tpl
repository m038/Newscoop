{{ dynamic }}
{{ if isset($smarty.request.mobile) || isset($smarty.request.tablet) || isset($smarty.request.phone) || $gimme->browser->browser_working == "webkit" && $gimme->browser->ua_type == 'mobile' }}
{{ assign var="isMobDevice" value=1 scope="global" }}	
{{ else }}
{{ assign var="isMobDevice" value=0 scope="global" }}
{{ /if }}
{{ /dynamic }}

<script type='text/javascript' src='http://openx.zentralplus.ch/delivery/spcjs.php?id=1'></script>

<!-- async replacement for openad spc calls -->
<script type='text/javascript'> 
/**
 * this code will wait for document ready and then inject OpenX banners
 * into predefined ad divs defined with id='open-X' where X is the OpenX zoneId
 */
$document_ready = 0;
$(document).ready(function() {
    $document_ready = 1;
});

function displayOpenxAd($id) {
    if(!$document_ready) {
        setTimeout(function(){ displayOpenxAd($id); },1000);
        return false;
    }

    if(typeof(OA_output[$id])!='undefined' && OA_output[$id]!='') {

        var flashCode,
            oDIV = document.getElementById('openx-'+$id);

        if (oDIV) {

            // if it's a flash banner..
            if(OA_output[$id].indexOf("ox_swf.write")!=-1) {

                // extract javascript code
                var pre_code_wrap = "<script type='text/javascript'><!--// <![CDATA[",
                    post_code_wrap = "// ]]> -->";

                flashCode = OA_output[$id].substr(OA_output[$id].indexOf(pre_code_wrap)+pre_code_wrap.length);
                flashCode = flashCode.substr(0, flashCode.indexOf(post_code_wrap));

                // replace destination for the SWFObject
                flashCode = flashCode.replace(/ox\_swf\.write\(\'(.*)'\)/, "ox_swf.write('"+ oDIV.id +"')");
                flashCode = flashCode.replace(/document.write/, "$('#"+ oDIV.id +"').append");


                // insert SWFObject
                if( flashCode.indexOf("ox_swf.write")!=-1 ) {
                    //alert(flashCode);
                    eval(flashCode);
                    //oDIV.removeClass('hidden');
                }// else: the code was not as expected; don't show it


            }else{
                // normal image banner; just set the contents of the DIV
                oDIV.innerHTML = OA_output[$id];
                //oDIV.removeClass('hidden');
            }
        }
    }
    //OA_show($id);
}
</script>
