<tr>
    <th style="width: 168px">
        <p>
            <strong>
                <a href='#' class='mn-lokalwetter-region-item' data-type='mexs' data-role='link' data-id='{{ $gimme->weather_location->location_id }}' data-name='{{ $gimme->weather_location->location_name }}'>{{ $gimme->weather_location->location_name }}</a>
            </strong>
            <br>{{ $gimme->weather_location->description }}
        </p>
    </th>
    <td style="text-align: right">
        <img src='{{ url static_file="assets/img/meteonews/symb/"}}{{ $gimme->weather_location->symbol }}.png' class='mn-symbol-small'> {{ $gimme->weather_location->temperature_max }}°/{{ $gimme->weather_location->temperature_min }}°
    </td>
    <td>
        <img src='{{ url static_file="assets/img/meteonews/symb/"}}icon-direction-north-30.png' class='mn-symbol-small' style='-webkit-transform:rotate({{ $gimme->weather_location->winddir }}deg); -moz-transform:rotate({{ $gimme->weather_location->winddir }}deg); -ms-transform:rotate({{ $gimme->weather_location->winddir }}deg); -o-transform:rotate({{ $gimme->weather_location->winddir }}deg); transform:rotate({{ $gimme->weather_location->winddir }}deg);' alt> 
        <span>{{ $gimme->weather_location->windforce }} km/h</span>
    </td>
    <td>
        <img src='{{ url static_file="assets/img/"}}icon-water-30.png' class='mn-symbol-small'>
        <span>{{ $gimme->weather_location->water_temp }}°</span>
    </td>
</tr>
