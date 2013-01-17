{{extends file="layout.tpl"}}
{{block page_name}}Community{{/block}}
{{block name="header_h2"}}Community{{/block}}

{{block content}}
<div class="main">
            	<div class="top-line">

                    <div class="profile-tabs">
                        <div id="tabs-1">
                        
                        	<h4>Die Community ist noch einen Schritt entfernt</h4>
                            <p class="login-intro">Bitte vervollständigen Sie nun Ihre Zugangsdaten, um Ihr Benutzerkonto zu aktivieren. Mit Ihrem Benutzerkonto können Sie Artikel kommentieren und mit anderen Zentral+-Leserinnen und -Lesern in Kontakt treten.</p>

                            <form method="POST" enctype="multipart/form-data" action="">
                            <ul class="form bottom-line">
                            	<li>
                                	<label>Vorname <i>*</i></label>
                                    <input type="text" name="first_name" value="{{ $form->first_name->getValue()|escape }}" />
                                    {{ include file="_tpl/form_error_empty.tpl" field="first_name" }}
                                </li>
                            	<li>
                                	<label>Nachname <i>*</i></label>
                                    <input type="text" name="last_name" value="{{ $form->last_name->getValue()|escape }}" />
                                    {{ include file="_tpl/form_error_empty.tpl" field="last_name" }}
                                </li>
                            	<li class="clearfix">
                                	<label>Benutzername <i>*</i></label>
                                    <input type="text" name="username" value="{{ $form->username->getValue()|escape }}" />
                                    <p class="indented">Dieser Name wird bei Ihren Beiträgen auf zentral+ angezeigt. Wir empfehlen, dass Sie Ihren echten Namen verwenden, erlauben aber auch Pseudonyme</p>
                                    {{ include file="_tpl/form_error_empty.tpl" field="username" }}
                                    {{ if $form->username->hasErrors() && $form->username->getValue() }}
                                    <div class="infobox error">Nutzername besetzt. Bitte geben Sie eine andere Nutzername an.</div>
                                    {{ /if }}
                                </li>
                                {{ if $form->getElement('password') }}
                                <li>
                                	<label>Passwort <i>*</i></label>
                                    <input type="password" name="password" value="{{ $form->password->getValue()|escape }}" />
                                    {{ include file="_tpl/form_error_empty.tpl" field="password" }}
                                    {{ if $form->password->hasErrors() && $form->password->getValue() }}
                                    <div class="infobox error">Bitte geben Sie ein Passwort mit mindestens 6 Zeichen ein.</div>
                                    {{ /if }}
                                </li>
                                <li>
                                	<label class="multi-line">Passwort wiederholen <i>*</i></label>
                                    <input type="password" name="password_confirm" value="{{ $form->password_confirm->getValue()|escape }}" />
                                    {{ include file="_tpl/form_error_empty.tpl" field="password_confirm" }}
                                    {{ if $form->password_confirm->hasErrors() && $form->password_confirm->getValue() }}
                                    <div class="infobox error">Bitte geben Sie Ihr Passwort nochmals ein.</div>
                                    {{ /if }}
                                </li>
                                {{ /if }}
                                <li>
                                	<small class="right"><i>*</i>Pflichtfeld</small>
                                </li>
                            </ul>

                            <h4>Lokale Präferenz</h4>
                            <ul class="form bottom-line">
                            	<li>
                                    {{ $region = $form->attributes->region->getValue() }}
                                	<ul class="radio-horizontal-list">
                                    	<li>
                                        	<input type="radio" name="attributes[region]" id="radios1" value="" {{ if !$region }}checked{{ /if }} /><label for="radios1">keine Präferenz</label>
                                        </li>
                                    	<li>
                                        	<input type="radio" name="attributes[region]" id="radios2" value="zug" {{ if $region == "zug" }}checked{{ /if }} /><label for="radios2">Region Zug</label>
                                        </li>
                                    	<li>
                                        	<input type="radio" name="attributes[region]" id="radios3" value="luzern" {{ if $region == "luzern" }}checked{{ /if }} /><label for="radios3">Region Luzern</label>
                                        </li>
                                    </ul>
                                </li>
                            	<li>Inhalte aus den entsprechenden Regionen werden gemäss Ihrer Auswahl bevorzugt angezeigt.</li>
                            </ul>

                            {{ include file="_tpl/_newsletter_frequency.tpl" }}
                            
                            <ul class="form terms">
                            	<li>
                                	<label>Nutzungsbedingungen</label>
                                    <div class="terms-content">
                                    <!--START TERMS-->
                                        
                                        <h6>Copyright </h6>
                                        <p>zentral+  behält sich alle Rechte vor. Der gesamte Inhalt der Webseite ist  urheberrechtlich geschützt. Sie dürfen die Inhalte ansehen und ausdrucken,  sofern sie für den persönlichen und nicht kommerziellen Gebrauch verwendet  werden. Vervielfältigung einschliesslich Speicherung und Nutzung auf optischen  und elektronischen Datenträgern oder Aufnahme in Online-Dienste ist nur mit  schriftlicher Zustimmung von zentral+ gestattet. </p>
                                        
                                        <p>Die  ganze oder teilweise Verwertung von Anzeigen inklusive Einspeisung in  Online-Dienste durch unberechtigte Dritte ist untersagt. Eine Entstellung des  urheberrechtlich geschützten Werks in Bild, Wort bzw. jeglicher anderen Form,  beispielsweise durch Nachfotografieren, Fotocomposing oder elektronische  Hilfsmittel ist nicht zulässig. Ebenso darf ein&nbsp;herunter geladenes  digitales Bild nicht weiterverwendet werden. </p>
                                        
                                        <h6>Datenschutz</h6>
                                        <p>Beim  Besuch von zentral+ fallen Daten an, welche wir zum Zwecke des komfortablen  Surfens erheben und speichern.</p>
                                        <p>zentral+ unternimmt alles Notwendige, um  sicherzustellen, dass Daten, die Sie auf dieser Seite eingeben, sicher und  geschützt sind. Beim  Umgang mit Personendaten halten wir uns an die geltende Gesetzgebung und wo  immer möglich an die Empfehlungen des eidgenössischen Datenschützers. Personendaten werden durch angemessene technische und  organisatorische Massnahmen gegen unbefugtes Bearbeiten geschützt.</p>
                                        
                                        <h6>Cookies</h6>
                                        <p>Für  die Optimierung unserer Website und zur Ermittlung der Seitenabrufe setzen wir  Cookies ein. Dabei handelt es sich um eine kleine Datei, die von unserem Web-Server an Ihren Internet-Browser übermittelt und gespeichert wird. Dies  ermöglicht es, dass bereits gemachte Informationen nicht erneut eingegeben werden müssen, um Favoriten anzulegen oder eine Wunschregion zuzuweisen. Dabei  werden keine sicherheitsrelevanten oder personenbezogenen Daten gespeichert. Auch können Cookies nach aktuellem Wissensstand keine Viren übertragen oder  Daten auf Ihrem Rechner ausspionieren.</p>
                                        <p>zentral+  setzt einen Webanalysedienst ein. Die mittels  Cookies erhobenen Informationen über die Benutzung dieser Website kann an einen  Server im In- oder Ausland übertragen und dort gespeichert werden. Durch die  Nutzung von zentral+ erklären Sie sich mit der Bearbeitung der über Sie zu  diesem Zweck erhobenen Daten einverstanden.</p>
                                        
                                        <h6>Registration</h6>
                                        <p>Bei  der Registrierung können Sie einen Benutzernamen (Ihre E-Mail Adresse) und ein  persönliches Passwort wählen. Benutzername und Passwort stellen sicher, dass  nur Sie Zugang zu Ihrem Profil haben. Ihr Passwort kann von uns nicht  eingesehen werden. Auch werden wir Sie niemals per E-Mail nach Ihrem  persönlichen Passwort fragen. Wir behalten uns das Recht vor,  Nutzerdaten jederzeit und ohne Angabe von Gründen zu löschen oder einen  Benutzernamen und das Passwort zu sperren.</p>
                                        <p>Alternativ können Sie unsere Webseite besuchen, ohne persönliche Daten  anzugeben. In diesem Fall sind jedoch einzelnen Funktionen wie das publizieren  von Kommentaren etc. nicht verfügbar. </p>
                                        
                                        <h6>Kommentare</h6>
                                        <p>Von  Ihnen verfasste Beiträge und Kommentare können an verschiedenen Stellen unter  dem von Ihnen angegebenen Pseudonym publiziert werden. Denken Sie bitte daran,  dass Ihre Beiträge öffentlich sind. Beachten Sie daher die Bestimmungen zur  Nutzung, die Netiquette.</p>
                                        
                                        <h6>Weitergabe von Daten</h6>
                                        <p>Eine  Weitergabe von Ihren Daten erfolgt lediglich bei einem Zahlungsvorgang. Unsere  Dienstleister nutzen die Informationen ausschliesslich zur Erfüllung ihrer  Aufgaben. Die Übermittlung der Daten erfolgt teilweise unverschlüsselt.</p>
                                        
                                        <h6>Newsletter</h6>
                                        <p>Sie können verschiedene Newsletter abonnieren. Dazu müssen Sie ihre  E-Mail-Adresse bestätigen. Wenn Sie den abonnierten Newsletter nicht mehr  erhalten möchten, können Sie sich jederzeit abmelden. Klicken Sie dazu im  Newsletter einfach auf den entsprechenden Link oder nutzen Sie den Bereich auf  Ihrem Profil.</p>
                                          
                                        <h6>Social  Plugins</h6>
                                        <p>zentral+ verwendet Social Plugins von sozialen Netzwerken wie beispielsweise  facebook.com. Die Plugins sind entsprechend gekennzeichnet. Gelangen Sie  innerhalb von zntral+ auf eine Seite, welche ein solches Plugin enthält, baut  Ihr Browser eine direkte Verbindung mit den Servern des Betreibers auf. Sind  Sie bei diesem eingeloggt, können Ihre Aktivitäten Ihrem Konto zugeordnet  werden.</p>
                                        <p>Zweck und Umfang der Datenerhebung entnehmen Sie bitte den Seiten des sozialen  Netzwerkes, bei dem Sie angemeldet sind.</p>
                                        
                                        <h6>Werbung und Sponsoring</h6>
                                        <p>Die redaktionellen Inhalte von zentral+ werden von Journalisten, freien  Autoren, Fotografen und Spezialisten erstellt. Zur Finanzierung des Angebotes können  Sie uns einen Spendenbetrag zukommen lassen. Ausserdem platzieren wir auf der  Website Werbeflächen. Diese sind optisch von den redaktionellen Inhalten  getrennt und als Werbebotschaften erkennbar.</p>
                                        
                                        <h6>Nutzung und Inhalte</h6>
                                        <p>Für  die Informationen auf den Webseiten von zentral+ können keinerlei Garantien  abgegeben werden. Inhaltliche und  grammatische Fehler sind nicht auszuschliessen. Inhalte können von zentral+  ohne Vorankündigung ergänzt, modifiziert oder gelöscht werden.</p>
                                        <p>Mit dem Hochladen eigener Inhalte räumen Nutzer zentral+ das  unentgeltliche, zeitlich und räumlich unbegrenzte Recht ein, die betreffenden  Inhalte zu kopieren, zu versenden, zu veröffentlichen, weiterzuverbreiten, zu  übertragen, weiterzuverarbeiten und zu veräussern.</p>
                                        
                                        <h6>Haftung</h6>
                                        <p>Jede Haftung wird, soweit gesetzlich  zulässig, wegbedungen.</p>
                                        <p>zentral+ übernimmt insbesondere keine Haftung für die  Richtigkeit, Vollständigkeit und Aktualität der Informationen, die über die  Webseite dargestellt werden. Weiter geben wir keine Garantie in Bezug auf die  technische Verfügbarkeit des Angebotes.</p>
                                        <p>Eine Haftung  für Inhalte, welche von Nutzern erstellt und / oder hochgeladen wurden, wird  ausdrücklich abgelehnt. Es ist sicherzustellen, dass diese Inhalte den Vorgaben  genügen (siehe Nettiquette). Insbesondere haben  Nutzer darum besorgt zu sein, dass die erstellten und die hochgeladenen Inhalte  nicht gegen die Schweizerische Rechtsordnung verstossen und keine Urheberrechte  oder Persönlichkeitsrechte verletzen. Sollte zentral+ für derartige Inhalte  rechtlich belangt werden, so kann sie auf den betreffenden Nutzer Regress  nehmen.</p>
                                        <p>Für Informationen von Dritten, welche über Links auf die  Webseiten von Dritten zugänglich gemacht werden oder die auf zentral+ eingebettet  sind, wird jegliche Haftung abgelehnt. Dies gilt auch für unverlangt  eingesandte Manuskripte, Illustrationen, Fotos oder elektronische Datenträger.</p>
                                        <p>zentral+ haftet nicht für Technikfehler, Betriebsstörungen  und Softwarefehler. Eine Haftung für Schäden, welche durch Computerviren,  Spionageprogramme und andere schädliche Computerprogramme hervorgerufen werden,  ist ausgeschlossen.</p>
                                        <p>Mit der Nutzung von zentral+  wird das Einverständnis mit den vorliegenden AGB&rsquo;s erklärt. Die AGB&rsquo;s sind  jederzeit auf der Webseite verfügbar. Bei registrierungspflichtigen  Dienstleistungen werden Nutzende zu Beginn des Registrierungsprozesses  zusätzlich auf die AGB hingewiesen. </p>
                                    <!--END TERMS-->
                                    
                                    </div>
                                    <li class="checkboxes bottom-line"><input type="checkbox" id="agb" name="terms" value="1" {{ if $form->terms->isChecked() }}checked{{ /if }} /><label for="agb">Ich habe die Nutzungsbedingungen gelesen und stimme Ihnen zu</label></li>
                                </li>
                                <li>
                                	<input type="submit" class="button red center" value="Konto aktivieren" />
                                </li>
                            </ul>

                            </form>
                        
                        </div>
                    </div>
                
                </div>
</div>
{{/block}}

{{block aside}}
{{ include file="_tpl/sidebar-community.tpl" }}
{{/block}}
