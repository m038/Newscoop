{{ render file="_tpl/_ismobdevice.tpl" }}
<script type='text/javascript'>
var OA_zones = {{ strip }}

{{ if $isMobDevice }}

{{* Tablet and mobile Section Politik *}}
{{ if $gimme->publication->identifier == 2 && $gimme->section->number == 10 }}
 {'6':6};
{{ /if }}
{{* Tablet and mobile Section Wirtschaft *}}
{{ if $gimme->publication->identifier == 2 && $gimme->section->number == 20 }}
 {'50':50};
{{ /if }}

{{ else }}

{{* front page *}}
{{ if $gimme->template->name == "front.tpl" }}
 {'1':1,'3':3,'66':66,'65':65};
{{ /if }}
{{* section Politik *}}
{{ if $gimme->publication->identifier == 2 && $gimme->section->number == 10 }}
 {'12':12,'13':13,'86':86,'67':67,'16':16};
{{ /if }}
{{* section Wirtschaft *}}
{{ if $gimme->publication->identifier == 2 && $gimme->section->number == 20 }}
 {'2':2,'4':4,'5':5,'68':68,'23':23};
{{ /if }}
{{* section Kultur *}}
{{ if $gimme->publication->identifier == 2 && $gimme->section->number == 30 }}
 {'30':30,'70':70,'33':33};
{{ /if }}
{{* section Gesellschaft *}}
{{ if $gimme->publication->identifier == 2 && $gimme->section->number == 40 }}
 {'41':41,'69':69,'44':44};
{{ /if }}
{{* section Dialog *}}
{{ if $gimme->publication->identifier == 2 && $gimme->section->number == 90 }}
 {'77':77,'72':72,'64':64};
{{ /if }}
{{* Dossiers page *}}
{{ if $gimme->template->name == "dossiers.tpl" }}
 {'78':78,'79':79};
{{ /if }}
{{* blogs page *}}
{{ if $gimme->template->name == "blogs.tpl" }}
 {'75':75,'71':71,'62':62};
{{ /if }}
{{* ausgehen page *}}
{{ if $gimme->template->name == "ausgehen.tpl" || ($gimme->section->number gt 70 && $gimme->section->number lte 80) }}
 {'76':76,'73':73,'63':63};
{{ /if }}


{{ /if }}

{{ /strip }}
</script>
<!-- Generated by OpenX 2.8.10 -->
<script type='text/javascript' src='http://openx.zentralplus.ch/delivery/spcjs.php?id=1'></script>