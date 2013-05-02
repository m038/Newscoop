        <table cellpadding="0" cellspacing="0">
            {{ list_weather_stats location_list="bergwetter" stat_date="$stat_date" location_name="bergwetter3500" hour="$hour" }}
            <tr>
                <td>
                <small>3500 m NN</small>
                <img src='{{ url static_file="assets/img/meteonews/symb/"}}{{ $gimme->weather_location->symbol }}.png' class='mn-symbol-small-30' alt> {{ $gimme->weather_location->temperature }}°, sonnig
                <img src='{{ url static_file="assets/img/meteonews/symb/"}}icon-direction-north-30.png' class='mn-symbol-small-30' style='-webkit-transform:rotate({{ $gimme->weather_location->winddir }}deg); -moz-transform:rotate({{ $gimme->weather_location->winddir }}deg); -ms-transform:rotate({{ $gimme->weather_location->winddir }}deg); -o-transform:rotate({{ $gimme->weather_location->winddir }}deg); transform:rotate({{ $gimme->weather_location->winddir }}deg);' alt>
                {{ $gimme->weather_location->windforce }} km/h</td>
            </tr>
            {{ /list_weather_stats }}
            {{ list_weather_stats location_list="bergwetter" stat_date="$stat_date" location_name="bergwetter3000" hour="$hour" }}
            <tr>
                <td>
                <small>3000 m NN</small>
                <img src='{{ url static_file="assets/img/meteonews/symb/"}}{{ $gimme->weather_location->symbol }}.png' class='mn-symbol-small-30' alt> {{ $gimme->weather_location->temperature }}°, sonnig
                <img src='{{ url static_file="assets/img/meteonews/symb/"}}icon-direction-north-30.png' class='mn-symbol-small-30' style='-webkit-transform:rotate({{ $gimme->weather_location->winddir }}deg); -moz-transform:rotate({{ $gimme->weather_location->winddir }}deg); -ms-transform:rotate({{ $gimme->weather_location->winddir }}deg); -o-transform:rotate({{ $gimme->weather_location->winddir }}deg); transform:rotate({{ $gimme->weather_location->winddir }}deg);' alt>
                {{ $gimme->weather_location->windforce }} km/h</td>
            </tr>
            {{ /list_weather_stats }}
            {{ list_weather_stats location_list="bergwetter" stat_date="$stat_date" location_name="bergwetter2500" hour="$hour" }}
            <tr>
                <td>
                <small>2500 m NN</small>
                <img src='{{ url static_file="assets/img/meteonews/symb/"}}{{ $gimme->weather_location->symbol }}.png' class='mn-symbol-small-30' alt> {{ $gimme->weather_location->temperature }}°, sonnig
                <img src='{{ url static_file="assets/img/meteonews/symb/"}}icon-direction-north-30.png' class='mn-symbol-small-30' style='-webkit-transform:rotate({{ $gimme->weather_location->winddir }}deg); -moz-transform:rotate({{ $gimme->weather_location->winddir }}deg); -ms-transform:rotate({{ $gimme->weather_location->winddir }}deg); -o-transform:rotate({{ $gimme->weather_location->winddir }}deg); transform:rotate({{ $gimme->weather_location->winddir }}deg);' alt>
                {{ $gimme->weather_location->windforce }} km/h</td>
            </tr>
            {{ /list_weather_stats }}
            {{ list_weather_stats location_list="bergwetter" stat_date="$stat_date" location_name="bergwetter2000" hour="$hour" }}
            <tr>
                <td>
                <small>2000 m NN</small>
                <img src='{{ url static_file="assets/img/meteonews/symb/"}}{{ $gimme->weather_location->symbol }}.png' class='mn-symbol-small-30' alt> {{ $gimme->weather_location->temperature }}°, sonnig
                <img src='{{ url static_file="assets/img/meteonews/symb/"}}icon-direction-north-30.png' class='mn-symbol-small-30' style='-webkit-transform:rotate({{ $gimme->weather_location->winddir }}deg); -moz-transform:rotate({{ $gimme->weather_location->winddir }}deg); -ms-transform:rotate({{ $gimme->weather_location->winddir }}deg); -o-transform:rotate({{ $gimme->weather_location->winddir }}deg); transform:rotate({{ $gimme->weather_location->winddir }}deg);' alt>
                {{ $gimme->weather_location->windforce }} km/h</td>
            </tr>
            {{ /list_weather_stats }}
            {{ list_weather_stats location_list="bergwetter" stat_date="$stat_date" location_name="bergwetter1500" hour="$hour" }}
            <tr>
                <td>
                <small>1500 m NN</small>
                <img src='{{ url static_file="assets/img/meteonews/symb/"}}{{ $gimme->weather_location->symbol }}.png' class='mn-symbol-small-30' alt> {{ $gimme->weather_location->temperature }}°, sonnig
                <img src='{{ url static_file="assets/img/meteonews/symb/"}}icon-direction-north-30.png' class='mn-symbol-small-30' style='-webkit-transform:rotate({{ $gimme->weather_location->winddir }}deg); -moz-transform:rotate({{ $gimme->weather_location->winddir }}deg); -ms-transform:rotate({{ $gimme->weather_location->winddir }}deg); -o-transform:rotate({{ $gimme->weather_location->winddir }}deg); transform:rotate({{ $gimme->weather_location->winddir }}deg);' alt>
                {{ $gimme->weather_location->windforce }} km/h</td>
            </tr>
            {{ /list_weather_stats }}
            {{ list_weather_stats location_list="bergwetter" stat_date="$stat_date" location_name="bergwetter1000" hour="$hour" }}
            <tr>
                <td>
                <small>1000 m NN</small>
                <img src='{{ url static_file="assets/img/meteonews/symb/"}}{{ $gimme->weather_location->symbol }}.png' class='mn-symbol-small-30' alt> {{ $gimme->weather_location->temperature }}°, sonnig
                <img src='{{ url static_file="assets/img/meteonews/symb/"}}icon-direction-north-30.png' class='mn-symbol-small-30' style='-webkit-transform:rotate({{ $gimme->weather_location->winddir }}deg); -moz-transform:rotate({{ $gimme->weather_location->winddir }}deg); -ms-transform:rotate({{ $gimme->weather_location->winddir }}deg); -o-transform:rotate({{ $gimme->weather_location->winddir }}deg); transform:rotate({{ $gimme->weather_location->winddir }}deg);' alt>
                {{ $gimme->weather_location->windforce }} km/h</td>
            </tr>
            {{ /list_weather_stats }}
            {{ list_weather_stats location_list="bergwetter" stat_date="$stat_date" location_name="bergwetter500" hour="$hour" }}
            <tr>
                <td>
                <small>500 m NN</small>
                <img src='{{ url static_file="assets/img/meteonews/symb/"}}{{ $gimme->weather_location->symbol }}.png' class='mn-symbol-small-30' alt> {{ $gimme->weather_location->temperature }}°, sonnig
                <img src='{{ url static_file="assets/img/meteonews/symb/"}}icon-direction-north-30.png' class='mn-symbol-small-30' style='-webkit-transform:rotate({{ $gimme->weather_location->winddir }}deg); -moz-transform:rotate({{ $gimme->weather_location->winddir }}deg); -ms-transform:rotate({{ $gimme->weather_location->winddir }}deg); -o-transform:rotate({{ $gimme->weather_location->winddir }}deg); transform:rotate({{ $gimme->weather_location->winddir }}deg);' alt>
                {{ $gimme->weather_location->windforce }} km/h</td>
            </tr>
            {{ /list_weather_stats }}
        </table>
