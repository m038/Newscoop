<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Campsite Template/01</title>
<link rel="stylesheet" type="text/css" href="/templates/01-style.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>

<body topmargin="5" leftmargin="5" bgcolor="#FFFFFF">

<table width="747" cellpadding="0" cellspacing="0" border="0">

  <!--main baner-->
  
   <!-- add some banner rotator here -->
  
  <!--end main baner-->
  
  <!--header-->
  
  <tr> 
    <td colspan="5" height="69">
	  {{ include file="header.tpl" }}</td>
  </tr>
  
  <!-- end header-->
  
  <!--main index-->
  
  <tr> 
    <td colspan="5" valign="top"> 
	  {{ include file="header-01.tpl" }}</td>
  </tr>
  
  <!--end main index-->
  
  <tr>
    <td width="131" valign="top">
	
  <!--index left-->
  
           {{ include file="menu.tpl" }}<!--end index left-->
	  
    </td>
	<td width="8"></td>
    <td width="467" valign="top"> 
	
        <table border="0" cellpadding="0" cellspacing="0" width="100%">
          <tr>
            <td>
              {{ include file="section-article.tpl" }}</td>
          </tr>
        </table>
        <table border="0" cellpadding="0" cellspacing="0" width="100%">
		  <tr>
		    <td height="8"></td>
		  </tr>
          <tr>
            <td background="/templates/img/06linija.gif" height="1"></td>
          </tr>
        </table>
              {{ include file="section-rest.tpl" }}
        <table border="0" cellpadding="0" cellspacing="0" width="100%">
		  <tr>
		    <td height="8"></td>
		  </tr>
          <tr>
            <td background="/templates/img/06linija.gif" height="1"></td>
          </tr>
		  <tr>
		    <td height="8"></td>
		  </tr>		  
        </table>

        <table border="0" cellpadding="0" cellspacing="0" width="100%">
		  <tr>
		    <td width="281" height="1"><img src="/templates/img/transpa.gif" width="281" height="1"></td>
			<td width="8" height="1"><img src="/templates/img/transpa.gif" width="8" height="1"></td>
			<td width="178" height="1"><img src="/templates/img/transpa.gif" width="178" height="1"></td>
		  </tr>
          <tr>
            <td width="281" valign="top">
{{ include file="section-news.tpl" }}</td>		
			  <td width="8"></td>
              <td width="178" valign="top">
			  
			  <!--blok kultura/intervju-->		
			  
                {{ include file="section-special.tpl" }}</td>

            </tr>
            <tr>
			  <td colspan="3" height="25"></td>
			</tr>
          </table>
       
	  <!--end main middle--> 


    </td>
	<td width="8"></td>
    <td width="133" valign="top" bgcolor="#d3e5f1"> 
        <!--main right--> 
        {{ include file="right.tpl" }}
    </td>
  </tr>
  
  <!-- footer -->
  
  <tr>
    <td colspan="2"></td>
	<td align="center">{{ include file="banner.tpl" }}</td>
	<td colspan="2"></td>
  </tr>
  <tr>
    <td colspan="5" height="25"></td>
  </tr>
  <tr>
	<td align="center" style="padding: 3px 0px 3px 0px" colspan="5">
        {{ include file="footer.tpl" }}</td>
  </tr>
  <tr>
    <td colspan="5" align="center" style="padding: 3px 0px 3px 0px">
{{ include file="footer-01.tpl" }}</td>
  </tr>
  
</table>

</body>

</html>
