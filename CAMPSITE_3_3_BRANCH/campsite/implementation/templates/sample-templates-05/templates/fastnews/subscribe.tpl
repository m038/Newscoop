<h3>{{ $campsite->publication->name }}: Subscription page</h3>

{{ subscription_form type="by_publication" template="fastnews/do_subscribe.tpl" submit_button="Submit" }}
<table>
	{{ if $campsite->url->get_parameter("SubsType") == "paid" }}
	<tr><td colspan=2 align=left>Total time: {{ $campsite->publication->subscription_paid_time }}&nbsp;{{ $campsite->publication->subscription_time_unit }}</td></tr>
	<tr><td colspan=2 align=left>Total cost: {{ $campsite->subscription->totalcost }}&nbsp;{{ $campsite->publication->subscription_currency }}</td></tr>
	{{ /if }}
	{{ if $campsite->url->get_parameter("SubsType") == "trial" }}
	<tr><td colspan=2 align=left>Total time: {{ $campsite->publication->subscription_trial_time }}&nbsp;{{ $campsite->publication->subscription_time_unit }}</td></tr>
	{{ /if }}
    <tr>
        <td colspan="2">
            {{ camp_select object="subscription" attribute="alllanguages" }}
            <span class="formtext">Subscribe to all languages</span>
        </td>
    </tr>
	<tr>
	   <td>Languages:</td>
	   <td>{{ camp_select object="subscription" attribute="languages" }}</td>
	</tr>
</table>
{{ /subscription_form }}
