{{extends file="layout.tpl"}}

{{block name="header_h2"}}Community{{/block}}

{{block content}}
<div class="tabs top-line">
                    
                    <ul class="tab-nav clearfix three-tabs">
                        <li><a href="#tabs-1"><strong><span class="phone-hide">Mein</span> Profill</strong></a></li>
                        <li><a href="#tabs-2"><strong>Meine Themen</strong></a></li>
                        <li><a href="#tabs-3"><strong>Newsletter</strong></a></li>
                    </ul>
                    
                    <div class="profile-tabs">
                        <div id="tabs-1">
                        
                        	<h4>Login</h4>
                            
                            <form method="POST" action="" enctype="multipart/form-data">
                            
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
                            	<img src="pictures/user-thumb-big-default.jpg" alt="" class="left" />
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

                            </form>
                        
                        </div>
                        <div id="tabs-2" class="info-tab">
                        
                        	<h4>Sie verfolgen diese Themen</h4>
                            <p><a href="#">Wirtscha!</a>, <a href="#">Konsum</a>, <a href="#">Telekommunikation</a>, <a href="#">Lifestyle</a></p>
                            <p><a href="#">Zu meinen Themen</a></p>
                            <a href="#" class="button white">Themen verwalten</a>
                        
                        </div>
                        <div id="tabs-3" class="info-tab">
                        
                        	<h4>Newsletter abonnieren</h4>
                            <ul class="form bottom-line">
                            	<li class="checkboxes"><input type="checkbox" id="nletter" /><label for="nletter">Ich möchte regelmässig die aktuellsten News erhalten</label></li>
                                <li>
                                	<ul class="radio-horizontal-list">
                                    	<li>
                                        	<input type="radio" name="radios2" id="radios21" /><label for="radios21">täglich</label>
                                        </li>
                                    	<li>
                                        	<input type="radio" name="radios2" id="radios22" /><label for="radios22">wöchentlich</label>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                            
                            <h4>Themen im Newsletter folgen</h4>
                            <ul class="form bottom-line">
                            	<li class="checkboxes"><input type="checkbox" id="nletter2" /><label for="nletter2">Ich möchte meine Themen im Newsletter verfolgen</label></li>
                            	<li>
                            		<p>Sie folgen diesen Themen:<br />
                            		<a href="#">Wirtscha!</a>, <a href="#">Konsum</a>, <a href="#">Telekommunikation</a>, <a href="#">Lifestyle</a></p>
                            		<a href="#" class="button white">Themen verwalten</a>
                            	</li>
                            </ul>
                            
                            <h4>AutorInnen im Newsletter folgen</h4>
                            <ul class="form bottom-line">
                            	<li class="checkboxes"><input type="checkbox" id="nletter3" /><label for="nletter3">Ich möchte AutorInnen im Newsletter folgen</label></li>
                            	<li>
                            		<p>Sie folgen diese AutorInnen:<br />
                            		<a href="#">Wirtscha!</a>, <a href="#">Konsum</a>, <a href="#">Telekommunikation</a></p>
                            		<a href="#" class="button white">AutorInnen verwalten</a>
                            	</li>
                            </ul>
                            
                            <h4>Themen im Newsletter folgen</h4>
                            <p class="bottom-line">Sie haben noch keine Themen abonniert. Um ein Thema zu abonnieren, klicken Sie auf die entsprechende Funktion bei einem Artikel. (<a href="#" class="icon-tag">Themen abonnieren</a>)</p>
                            
                            <h4>AutorInnen im Newsletter folgen</h4>
                            <p class="bottom-line">Um AutorInnen im Newsletter folgen, klicken Sie auf die entsprechende Funktion bei einem Artikel (<a href="#" class="icon-email">AutorIn im Newsletter folgen</a>)</p>
                            
                            <input type="submit" class="button red center" value="Speichern" />
                        
                        </div>
                    </div>
                
                </div>
{{/block}}
