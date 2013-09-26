{{* provide hooks for the css *}}
<script type="text/javascript">
    var ddsWidgetConfig = {};
    ddsWidgetConfig.css = "{{ uri static_file='assets/css/getunik.css' }}";
</script>

<div class="payment-box-outer">

  <div class="box bottom-line" id="payment-box" style="display:none;">
    {{* iframe that's displayed when sponsor link is clicked *}}
    <div class="payment-box">
      <a id="close_micropayment" class="close-box">close</a>
      <p>Ist Ihnen unabhängiger Journalismus etwas wert? Mit einer Spende an zentral+ helfen Sie uns, Beiträge wie diesen zu realisieren.</p>
      <div class="dds-widget-container"></div>
    </div>
  </div>

  {{* link that is displayed for click *}}
  <div class="box bottom-line centered-list">
    <p><a id="micropayment_button" class="icon-heart">Unterstützen Sie zentral+</a></p>
  </div>

</div>