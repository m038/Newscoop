{{ if !$gimme->user->logged_id == true }}
<div class="box highlight-box">
	<h4 class="box-title icon-letter"><a href="#">zentral+ Newsletter</a></h4>
  <form method="get" action="/register">
    <fieldset class="newsletter-form">
      <label>Folgen Sie uns im Newsletter</label>
      <input type="text" name="proposed_email" placeholder="Ihre E-Mail Adresse" />
    </fieldset>
    <input type="submit" class="button red center" value="Jetzt abonnieren" />
  </form>
</div>
{{ /if }}