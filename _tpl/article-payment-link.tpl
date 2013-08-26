{{ local }}
{{ set_publication identifier="2" }}
{{ set_issue number="1" }}
{{ set_section number="5" }}

    <div class="payment-box-outer">

		<div class="box bottom-line" id="payment-box" style="display:none;">
        	<div class="payment-box">
            	<a id="close_micropayment" class="close-box">close</a>
        		<p>Ist Ihnen unabhängiger Journalismus etwas wert? Mit einer Spende an zentral+ helfen Sie uns, Beiträge wie diesen zu realisieren.</p>

            	<iframe class="payment-box-iframe" src="{{ url options="section" }}?iframe_holder=1&iframe_type=article-payment" allowtransparency="true" scrolling="no" frameborder="0" style="width:100%;"  /></iframe>
            </div>
        </div>
                
        <div class="box bottom-line centered-list">
          <p><a id="micropayment_button" class="icon-heart">Unterstützen Sie zentral+</a></p>
        </div>   

    </div>

{{ /local }}