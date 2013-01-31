{{ if $isMobDevice }}
				{{ if $gimme->default_section->number == 10 }}
<div id='mobile-banner' class="ad">
<script>
    $(document).ready(function() {
        displayOpenxAd(6);
    });
</script>
</div>

				{{ /if }}
{{ /if }}				
