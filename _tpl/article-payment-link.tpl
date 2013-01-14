{{ local }}
{{ set_publication identifier="2" }}
{{ set_issue number="1" }}
{{ set_section number="5" }}

    <div class="payment-box-outer">

		<div class="box bottom-line" id="payment-box" style="display:none;">
        	<div class="payment-box">
            	<a id="close_micropayment" class="close-box">close</a>
        		<p>Möchten Sie weitere solche Beiträge lesen? Mit Spenden an unsere gemeinnützige Sti!ung<br />
            	MVV – Medien, Meinung, Vielfalt machen Sie unsere Arbeit möglich.</p>

            	<iframe class="payment-box-iframe" src="{{ url options="section" }}?iframe_holder=1&iframe_type=article-payment" allowtransparency="true" scrolling="no" frameborder="0" style="width:100%; height:350px"  /></iframe>
            </div>
        </div>
                
        <div class="box bottom-line centered-list">
          <p><a id="micropayment_button" class="icon-heart">Spenden an zentral+</a></p>
        </div>   

    </div>

{{ /local }}