<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN"
	"http://www.w3.org/TR/REC-html40/loose.dtd">
<HTML>
<?php
	require_once("../lib_campsite.php");
	require_once ("../languages.php");
	require_once('include.inc.php');
	require_once("$DOCUMENT_ROOT/db_connect.php");

	$globalfile=selectLanguageFile('..','globals');
	$localfile=selectLanguageFile('.','locals');
	@include ($globalfile);
	@include ($localfile);
?>

<?php
	todefnum('TOL_UserId');
	todefnum('TOL_UserKey');
	query ("SELECT * FROM Users WHERE Id=$TOL_UserId AND KeyId=$TOL_UserKey", 'Usr');
	$access=($NUM_ROWS != 0);
	if ($NUM_ROWS) {
	fetchRow($Usr);
	query ("SELECT * FROM UserPerm WHERE IdUser=".getVar($Usr,'Id'), 'XPerm');
	 if ($NUM_ROWS){
		fetchRow($XPerm);
	 }
	 else $access = 0;						//added lately; a non-admin can enter the administration area; he exists but doesn't have ANY rights
	 $xpermrows= $NUM_ROWS;
	}
	else {
	query ("SELECT * FROM UserPerm WHERE 1=0", 'XPerm');
	}
?>



<?php
	todefnum('TOL_UserId');
    todefnum('TOL_UserKey');
    query ("SELECT * FROM Users WHERE Id=$TOL_UserId AND KeyId=$TOL_UserKey", 'Usr');
    $access=($NUM_ROWS != 0);
    if ($NUM_ROWS) {
	fetchRow($Usr);
	query ("SELECT * FROM UserPerm WHERE IdUser=".getVar($Usr,'Id'), 'XPerm');
	 if ($NUM_ROWS){
	 	fetchRow($XPerm);
	 }
	 else $access = 0;						//added lately; a non-admin can enter the administration area; he exists but doesn't have ANY rights
	 $xpermrows= $NUM_ROWS;
    }
    else {
	query ("SELECT * FROM UserPerm WHERE 1=0", 'XPerm');
	}
?>
    


    <?php  if ($access) {
	query ("SELECT AddImage FROM UserPerm WHERE IdUser=".getVar($Usr,'Id'), 'Perm');
	 if ($NUM_ROWS) {
		fetchRow($Perm);
		$access = (getVar($Perm,'AddImage') == "Y");
	}
	else $access = 0;
    } ?>
    
 

<HEAD>
    <META http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<META HTTP-EQUIV="Expires" CONTENT="now">
	<TITLE><?php  putGS("Adding new image"); ?></TITLE>
<?php  if ($access == 0) { ?>	<META HTTP-EQUIV="Refresh" CONTENT="0; URL=/priv/ad.php?ADReason=<?php  print encURL(getGS("You do not have the right to add images" )); ?>">
<?php  }
?>
</HEAD>

<?php  if ($access) { ?><STYLE>
	BODY { font-family: Tahoma, Arial, Helvetica, sans-serif; font-size: 10pt; }
	SMALL { font-family: Tahoma, Arial, Helvetica, sans-serif; font-size: 8pt; }
	FORM { font-family: Tahoma, Arial, Helvetica, sans-serif; font-size: 10pt; }
	TH { font-family: Tahoma, Arial, Helvetica, sans-serif; font-size: 10pt; }
	TD { font-family: Tahoma, Arial, Helvetica, sans-serif; font-size: 10pt; }
	BLOCKQUOTE { font-family: Tahoma, Arial, Helvetica, sans-serif; font-size: 10pt; }
	UL { font-family: Tahoma, Arial, Helvetica, sans-serif; font-size: 10pt; }
	LI { font-family: Tahoma, Arial, Helvetica, sans-serif; font-size: 10pt; }
	A  { font-family: Tahoma, Arial, Helvetica, sans-serif; font-size: 10pt; text-decoration: none; color: darkblue; }
	ADDRESS { font-family: Tahoma, Arial, Helvetica, sans-serif; font-size: 8pt; }
</STYLE>

 <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="1" WIDTH="100%">
	<TR>
		<TD ROWSPAN="2" WIDTH="1%"><IMG SRC="/priv/img/sign_big.gif" BORDER="0"></TD>
		<TD>
			<DIV STYLE="font-size: 12pt"><B><?php  putGS("Add new image"); ?></B></DIV>
			<HR NOSHADE SIZE="1" COLOR="BLACK">
		</TD>
	</TR>
	<TR><TD ALIGN=RIGHT>
	  <TABLE BORDER="0" CELLSPACING="1" CELLPADDING="0">
		<TR>
		  <TD><A HREF="/priv/images/" ><IMG SRC="/priv/img/tol.gif" BORDER="0" ALT="<?php  putGS("Images"); ?>"></A></TD><TD><A HREF="/priv/images/" ><B><?php  putGS("Images");  ?></B></A></TD>
		  <TD><A HREF="/priv/home.php" ><IMG SRC="/priv/img/tol.gif" BORDER="0" ALT="<?php  putGS("Home"); ?>"></A></TD><TD><A HREF="/priv/home.php" ><B><?php  putGS("Home");  ?></B></A></TD>
		  <TD><A HREF="/priv/logout.php" ><IMG SRC="/priv/img/tol.gif" BORDER="0" ALT="<?php  putGS("Logout"); ?>"></A></TD><TD><A HREF="/priv/logout.php" ><B><?php  putGS("Logout");  ?></B></A></TD>
		</TR>
	  </TABLE>
	</TD></TR>
</TABLE>
<?php
// do the storage now ///////////////////////////////////////////

todef('cDescription');
todef('cPhotographer');
todef('cPlace');
todef('cDate');
todef('cURL');
todef('cImageName', $_FILES['cImage']['name']);
todef('cImageTemp', $_FILES['cImage']['tmp_name']);
todef('cImageType', $_FILES['cImage']['type']);
todef('cImageError', $_FILES['cImage']['error']);
todef('cImageSize', $_FILES['cImage']['size']);

if (!$cURL && !$cImageSize) {
	// no image given
    ?>
	<P>
	<CENTER>
	  <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="8" BGCOLOR="#C0D0FF" ALIGN="CENTER">
		<TR>
			<TD COLSPAN="2">
				<B> <?php  putGS("Add image"); ?> </B>
				<HR NOSHADE SIZE="1" COLOR="BLACK">
			</TD>
		</TR>
		<TR>
			<TD COLSPAN="2"><BLOCKQUOTE><LI><?php  putGS('You must select an image or type in an URL'); ?></LI></BLOCKQUOTE></TD>
		</TR>
		<TR>
			<TD COLSPAN="2">
			<DIV ALIGN="CENTER">
			<INPUT TYPE="button" NAME="Back" VALUE="<?php  putGS('OK'); ?>" ONCLICK="history.back()">
			</DIV>
			</TD>
		</TR>
	  </TABLE>
	</CENTER>
	<P>
	 <?php
} else {
	if ($cURL) {
		// remote-file ///////////////////////////////////////////////////////////////////////////
        #echo "remote<br>";
        $errmsg = handleRemoteImg ($cDescription, $cPhotographer, $cPlace, $cDate, $cURL);

	} else {
         #echo "local file<br>";
		// local file
        $errmsg = handleLocalImage($cImageTemp, $cDescription, $cPhotographer, $cPlace, $cDate, $cURL);
	}

	if ($errmsg) {
        ?>
        <P>
        <CENTER>
        <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="8" BGCOLOR="#C0D0FF" ALIGN="CENTER">
            <TR>
                <TD COLSPAN="2">
                    <B> <?php  putGS("Add new image"); ?> </B>
                    <HR NOSHADE SIZE="1" COLOR="BLACK">
                </TD>
            </TR>
            <TR>
                <TD COLSPAN="2"><BLOCKQUOTE><LI><?php  echo $errmsg; ?></LI></BLOCKQUOTE></TD>
            </TR>
            <TR>
                <TD COLSPAN="2">
                 <DIV ALIGN="CENTER">
                  <INPUT TYPE="button" NAME="Back" VALUE="<?php  putGS('Back'); ?>" ONCLICK="history.back()">
                 </DIV>
                </TD>
            </TR>
        </TABLE>
        </CENTER>
        <P>
        <?php
    } else {
    	?>
    	<P>
    	<CENTER>
    	<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="8" BGCOLOR="#C0D0FF" ALIGN="CENTER">
    		<TR>
    			<TD COLSPAN="2">
    				<B> <?php  putGS("Add new image"); ?> </B>
    				<HR NOSHADE SIZE="1" COLOR="BLACK">
    			</TD>
    		</TR>
    		<TR>
    			<TD COLSPAN="2"><BLOCKQUOTE><LI><?php  putGS('Image <B>$1</B> has been successfully added', $cDescription); ?></LI></BLOCKQUOTE></TD>
    		</TR>
    		<TR>
    			<TD COLSPAN="2">
    			 <DIV ALIGN="CENTER">
    			  <INPUT TYPE="button" NAME="Done" VALUE="<?php  putGS('Done'); ?>" ONCLICK="location.href='<?php echo _DIR_; ?>index.php?v=<?php todef('v'); echo $v; ?>'">
    			 </DIV>
    			</TD>
    		</TR>
    	</TABLE>
    	</CENTER>
    	<P>
    	<?php
    	$logtext = getGS('Image uploaded'); query ("INSERT INTO Log SET TStamp=NOW(), IdEvent=41, User='".getVar($Usr,'UName')."', Text='$logtext'"); ?>
    	<?php
    }
}
?>
<HR NOSHADE SIZE="1" COLOR="BLACK">
<a STYLE='font-size:8pt;color:#000000' href='http://www.campware.org' target='campware'>CAMPSITE  2.1.5 &copy 1999-2004 MDLF, maintained and distributed under GNU GPL by CAMPWARE</a>
</BODY>
<?php
}
?>

</HTML>
