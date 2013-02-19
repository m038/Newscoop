{{ if !$isMobDevice }}
{{ if $gimme->publication->identifier == 2 }}
				{{ if $gimme->section->number == 20 }}
<div id='openx-2' class="ad">
<script>
    $(document).ready(function() {
        displayOpenxAd(2);
    });
</script>
</div>
				{{ /if }}
				{{ if $gimme->section->number == 10 }}
<div id='openx-13' class="ad">
<script>
    $(document).ready(function() {
        displayOpenxAd(13);
    });
</script>
</div>
				{{ /if }}				
{{ /if }}
{{ /if }}	                
