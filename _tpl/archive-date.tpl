{{ if !$smarty.get.fqfrom || !$smarty.get.fqto }}Archiv{{ else }}
{{ assign var="fromDate" value=$smarty.get.fqfrom }}
{{ assign var="toDate" value=$smarty.get.fqto }}
{{ if $fromDate == $toDate }}Artikel vom {{ $fromDate|camp_date_format:"%e. %M %Y" }}
{{ elseif $fromDate|camp_date_format:"%M" == $toDate|camp_date_format:"%M" }}Artikel aus {{ $toDate|camp_date_format:"%M %Y" }}{{ elseif $fromDate|camp_date_format:"%Y" == $toDate|camp_date_format:"%Y" }}Artikel aus {{ $toDate|camp_date_format:"%Y" }}{{ /if }}
{{ /if }}
