Guten Tag,

Um Ihr Passwort für zentral+ zurückzusetzen, klicken Sie bitte auf den untenstehenden Link: 

http://{{ $publication }}{{ $view->url(['controller' => 'auth', 'action' => 'password-restore-finish', 'user' => $user, 'token' => $token], 'default') }}

Vielen Dank!
{{ $view->placeholder('subject')->set(sprintf("Passwort zurücksetzen für %s", $site)) }}
