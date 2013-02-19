{{ if $isMobDevice }}
     {{ if $gimme->default_section->number == 10 }}
<div id='openx-6' class="ad bottom-line">
<script>
    $(document).ready(function() {
        displayOpenxAd(6);
    });
</script>
</div>
    {{ /if }}
     {{ if $gimme->default_section->number == 20 }}
<div id='openx-50' class="ad bottom-line">
<script>
    $(document).ready(function() {
        displayOpenxAd(50);
    });
</script>
</div>
    {{ /if }}    
{{ /if }}
