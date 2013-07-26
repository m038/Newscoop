<tr>
    <th>
        <p><strong><a href='#'  class='mn-lokalwetter-region-item' data-role='link' data-type='mexs' data-id='{{ $gimme->weather_location->location_id }}' data-name='{{ $gimme->weather_location->location_name }}'>{{ $gimme->weather_location->location_name }}</a></strong>
        </p>
    </th>
    <td style="text-align: right">
        <img src='{{ url static_file="assets/img/meteonews/symb/"}}{{ $gimme->weather_location->symbol }}.png' class='mn-symbol-small'> {{ $gimme->weather_location->temperature_max }}°/{{ $gimme->weather_location->temperature_min }}°
    </td>
    <td>
        <img src='{{ url static_file="assets/img/"}}icon-water-30.png' class='mn-symbol-small'>
        <span>{{ $gimme->weather_location->water_temp }}°</span>
    </td>
</tr>  
