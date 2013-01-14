{{extends file="layout.tpl"}}

{{block page_name}}Community{{/block}}

{{block content}}
<form method="POST" action="" enctype="multipart/form-data">
<div class="tabs top-line">
                    <ul class="tab-nav clearfix three-tabs">
                        <li><a href="#tabs-1"><strong><span class="phone-hide">Mein</span> Profill</strong></a></li>
                        <li><a href="#tabs-2"><strong>Meine Themen</strong></a></li>
                        <li><a href="#tabs-3"><strong>Newsletter</strong></a></li>
                    </ul>
                    
                    <div class="profile-tabs">
                        <div id="tabs-1">
                        
                        	<h4>Login</h4>
                            
                            <ul class="form bottom-line">
                            	<li>
                                	<label>Vorname <i>*</i></label>
                                    <input type="text" name="first_name" value="{{ $form->first_name->getValue()|escape }}" />
                                </li>
                            	<li>
                                	<label>Nachname <i>*</i></label>
                                    <input type="text" name="last_name" value="{{ $form->last_name->getValue()|escape }}" />
                                </li>
                            	<li>
                                	<label>Email <i>*</i></label>
                                    <input type="text" name="email" value="{{ $user->email|escape }}" disabled />
                                    <div class="checkboxes indented">
                                    	<input type="checkbox" id="message-send" /><label for="message-send">Andere Nutzer dürfen mir Nachrichten senden</label>
                                    </div>
                                </li>
                            	<li class="bottom-line clearfix">
                                	<label>Benutzername</label>
                                    <input type="text" name="username" value="{{ $form->username->getValue()|escape }}" />
                                    <p class="indented">Dieser Name wird bei Ihren Beiträgen auf zentral+ angezeigt. Wir empfehlen, dass Sie Ihren echten Namen verwenden, erlauben aber auch Pseudonyme</p>
                                	<small class="right"><i>*</i>Pflichtfeld</small>
                                </li>
                            	<li class="bottom-line">
                                	<label>Passwort ändern</label>
                                    <input type="password" name="password" />
                                </li>
                                <li>
                                	<input type="submit" class="button red center" value="Speichern" />
                                </li>
                            </ul>
                            
                            <h4>Lokale Präferenz</h4>
                            <ul class="form bottom-line">
                            	<li>
                                	<ul class="radio-horizontal-list">
                                    	<li>
                                        	<input type="radio" name="attributes[region]" id="radios1" value="" {{ if !$user.region }}checked{{ /if }} /><label for="radios1">keine Präferenz</label>
                                        </li>
                                    	<li>
                                        	<input type="radio" name="attributes[region]" id="radios2" value="zug" {{ if $user.region == "zug" }}checked{{ /if }} /><label for="radios2">Region Zug</label>
                                        </li>
                                    	<li>
                                        	<input type="radio" name="attributes[region]" id="radios3" value="luzern" {{ if $user.region == "luzern" }}checked{{ /if }} /><label for="radios3">Region Luzern</label>
                                        </li>
                                    </ul>
                                </li>
                            	<li class="bottom-line">Inhalte aus den entsprechenden Regionen werden gemäss Ihrer Auswahl bevorzugt angezeigt.</li>
                                <li>
                                	<input type="submit" class="button red center" value="Speichern" />
                                </li>
                            </ul>
                            
                            <h4>Profil</h4>
                            <p>Sämtliche nachfolgenden Angaben sind optional. Bitte beachten Sie, dass jene Angaben, die Sie ausfüllen, für alle in Ihrem Pro"l sichtbar sind und von Suchmaschinen gefunden werden können.</p>
                            
                            <div class="clearfix upload-avatar">
                                {{ include file="_tpl/user-image.tpl" size="big" class="left" }}
                            	<h5>Neues Profilbild hochladen</h5>
                                <div class="input-file">
                                	<div class="show-value">keine Datei ausgewählt</div>
									<input type="file" name="image" value="" class="upload" />
                                </div>
                                <p>Bitte verwenden Sie keine Bilder, an denen Sie die Rechte nicht besitzenoder auf denen andere Personen als Sie selber abgebildet sind.</p>
                            </div>
                            
                            <ul class="form">
                            	<li>
                                	<label>Über mich</label>
                                    <textarea cols="" rows=""></textarea>
                                </li>
                            	<li>
                                	<label>Geburtsdatum</label>
                                    <input type="text" />
                                </li>
                            	<li>
                                	<label>Geschlecht</label>
                                    <select class="dropdownized">
                                    	<option value="Bitte wählen">Bitte wählen</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                    </select>
                                </li>
                            	<li>
                                	<label>facebook.com/</label>
                                    <input type="text" />
                                </li>
                            	<li>
                                	<label>plus.google.com/</label>
                                    <input type="text" />
                                </li>
                            	<li>
                                	<label>twitter.com/</label>
                                    <input type="text" />
                                </li>
                            	<li class="bottom-line">
                                	<label>http://</label>
                                    <input type="text" />
                                </li>
                                <li class="side-by-side">
                                	<input class="button white left" value="Profill ansehen" />
                                	<input type="submit" class="button red right" value="Speichern" />
                                </li>
                            </ul>

                        </div>
                        <div id="tabs-2" class="info-tab">
                        
                        	<h4>Sie verfolgen diese Themen</h4>
                            
                            <p>{{ list_user_topics }}
                                <a href="#" id="topic-{{ $topic->identifier }}">{{ $topic->name|escape }}</a>{{ if !$last }}, {{ /if }}
                            {{ /list_user_topics }}</p>

                            <p><a href="{{ $view->url(['controller' => 'my-topics', 'action' => 'index'], 'default') }}">Zu meinen Themen</a></p>
                        </div>
                        <div id="tabs-3" class="info-tab">
                        
                            {{ include file="_tpl/_newsletter_frequency.tpl" }}

                            {{ if $newsletter->id }}
                            <h4>Themen im Newsletter folgen</h4>
                            <ul class="form bottom-line">
                                {{ $checked = $form->newsletter->Topics->getValue() }}
                                {{ foreach $form->newsletter->Topics->getMultiOptions() as $key => $val }}
                            	<li class="checkboxes">
                                    <input type="checkbox" id="nletter{{ $key|escape }}" name="newsletter[Topics][]" value="{{ $val|escape }}" {{ if $checked && in_array($val, $checked) }}checked{{ /if }} />
                                    <label for="nletter{{ $val|escape }}">{{ $key|escape }}</label>
                                </li>
                                {{ /foreach }}
                            </ul>
                            
                            <input type="submit" class="button red center" value="Speichern" />

                            {{ else }}
                                {{* newsletter list not found *}}
                            {{ /if }}
                        </div>
                    </div>
                            

</div>
</form>
{{/block}}
