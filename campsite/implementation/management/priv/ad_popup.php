<?php
require_once('db_connect.php');
require_once('camp_html.php');
camp_load_translation_strings("home");
require_once('classes/Input.php');
$ADReason = Input::Get('ADReason', 'string', getGS('You do not have the right to access this page.'), true);
?>
<HEAD>
	<LINK rel="stylesheet" type="text/css" href="<?php echo $Campsite['WEBSITE_URL']; ?>/css/admin_stylesheet.css">
	<TITLE><?php putGS("Error"); ?></TITLE>
</HEAD>
<p>
<CENTER>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="8" class="message_box" ALIGN="CENTER" style="margin-top: 20px; margin-bottom: 20px; margin-right: 10px;">
<TR>
	<TD COLSPAN="2">
		<B><font color="red"><?php  putGS("Error"); ?> </font></B>
		<HR NOSHADE SIZE="1" COLOR="BLACK">
	</TD>
</TR>
<TR>
	<TD COLSPAN="2" align="center" style="padding-left: 15px; padding-right: 15px;">
		<?php  print htmlspecialchars($ADReason); ?>
	</TD>
</TR>
<TR>
	<TD COLSPAN="2" align="center">
		<a href="javascript:self.close()"><b><?php  putGS('Close'); ?></b></a>
	</TD>
</TR>
</TABLE>
</CENTER>
</FORM>

<?php camp_html_copyright_notice(); ?>
