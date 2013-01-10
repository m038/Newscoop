{{ local }}
{{ set_publication identifier="2" }}
{{ set_issue number="1" }}
{{ set_section number="5" }}

    <div class="payment-box-outer">

    	<!--
        
		-->

		<div class="box bottom-line" id="pwyl-widget">
        	<div class="payment-box">
            	<a href="#" class="close-box">close</a>
        		<p>Möchten Sie weitere solche Beiträge lesen? Mit Spenden an unsere gemeinnützige Sti!ung<br />
            	MVV – Medien, Meinung, Vielfalt machen Sie unsere Arbeit möglich.</p>
            	<!--
            	<h4>Spenden Sie 5 CHF per SMS</h4>
            	<p>Senden Sie eine SMS mit dem Keyword zentral+ an 9889 («zentral+» an 9889). Der entsprechende Betrag wird quiam volorem et plitibus doluptati volesentur, te nesequias es exererovitia.</p>
            	<h4>Mit Kreditkarte oder Paypal</h4>
            	<img src="{{ uri static_file="pictures/payment-cards.png" }}" alt="" />
                <div class="side-by-side clearfix">
                    <a class="button white left" href="#">Vielleicht später</a>
                    <a class="button red right" href="#">Jetzt spenden</a>
                </div>
            -->
            	<iframe class="payment-box-iframe" src="{{ uri options="section" }}?iframe_holder=1&iframe_type=article-payment" /></iframe>
            </div>
        </div>
                
        <div class="box bottom-line centered-list">
          <p><a href="#" class="icon-heart">Spenden an zentral+</a>
        </p></div>   

    </div>

{{ /local }}