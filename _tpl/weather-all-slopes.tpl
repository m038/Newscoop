<tr>
    <th>
        <p>
            <strong>
                <a href='#' class='mn-wintersport-link' data-type='mexs' data-id='{{ $gimme->weather_location->location_id }}' data-name='{{ $gimme->weather_location->location_name }}'>{{ $gimme->weather_location->location_name }}</a>
            </strong>
            <br>{{ $gimme->weather_location->region_name }}
        </p>
    </th>
    <td>
        <span class='phone-hide'>{{ $gimme->weather_location->snow_condition }}{{ if $gimme->weather_location->slope_condition }} , {{ $gimme->weather_location->slope_condition }} {{ /if }}<br>
            {{ if  $gimme->weather_location->open_slopes == 0 and $gimme->weather_location->total_slopes == 0 }}
                - / - Pisten
            {{ else }}
                {{ $gimme->weather_location->open_slopes }} / {{ $gimme->weather_location->total_slopes }} Pisten 
            {{ /if }}
        </span>
    </td>
    <td>
        <img src='{{ url static_file="assets/img/meteonews/symb/"}}{{ $gimme->weather_location->symbol }}.png' class='mn-symbol-small'> {{ $gimme->weather_location->temperature_max }} / {{ $gimme->weather_location->temperature_min }}
    </td>
</tr>
