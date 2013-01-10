<article>
    <figure>
        {{ if $user->image }}
        <img alt="{{ $user->uname }}" src="{{ $user->image }}" />
        {{ else }}
        <img alt="{{ $user->uname }}" src="{{ url static_file="pictures/user-thumb-mid-default.jpg" }}">
        {{ /if }}
        
    </figure>
    <h3>
        {{ $user->first_name }} {{ $user->last_name }} ({{ $user->uname }})
        {{ if $user->is_author }}
        <small class="red-mark">REDAKTION</small>
        {{ /if }}
    </h3>
    <!-- <p>Hier wird gegen Grundregeln der nuklearen Sicherheit verstossen!<br /> -->
    <time>Registriert sein {{ $user->created }} <span class="comm">{{ $user->posts_count }}</span></time></p>
</article>