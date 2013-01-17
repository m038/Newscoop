                            {{ if $newsletter->id }}
                        	<h4>Newsletter abonnieren</h4>
                            <ul class="form bottom-line">
                            	<li class="checkboxes"><input type="checkbox" id="nletter" name="newsletter[subscriber]" value="1" {{ if $form->newsletter->subscriber->isChecked() }}checked{{ /if }} /><label for="nletter">Ich möchte regelmässig die aktuellsten News erhalten</label></li>
                                <li>
                                	<ul class="radio-horizontal-list">
                                        {{ $freq = "Häufigkeit" }}
                                        {{ $checked = $form->newsletter->$freq->getValue() }}
                                        {{ if !is_array($checked) }}
                                            {{ $checked = array($checked) }}
                                        {{ /if }}
                                        {{ foreach $form->newsletter->$freq->getMultiOptions() as $key => $val }}
                                    	<li>
                                        	<input type="radio" name="newsletter[{{ $freq }}]" value="{{ $val|escape }}" id="radios2{{ $val|escape }}" {{ if $checked && in_array($val, $checked) }}checked{{ /if }} /><label for="radios2{{ $val|escape }}">{{ $key|escape }}</label>
                                        </li>
                                        {{ /foreach }}
                                    </ul>
                                </li>
                            </ul>
                            {{ /if }}
