# Simple client ruby socket.io

Un client tout simple pour accéder à une web socket en socket.io

## Origine

Cette implémentation est un fork de https://github.com/lyondhill/socket.io-ruby-client
  - modifié pour être compatible ruby 1.8
  - modifié pour ne prendre en compte que de la web socket sur SSL

## Exemple

L'exemple d'utilisation est le script agil_client.rb

## Features

This client currently supports:

* Listeners for all 9 possible message
* Send messages of the type:
  * message
  * json
  * event

## How to use:

```ruby
require 'socketIO'

client = SocketIO.connect("localhost") do
  before_start do
    on_message {|message| puts "incoming message: #{message}"}
    on_event('news') { |data| puts data.first} # data is an array fo things.
  end

end
```

## Sync vs Async

You can start the socket io syncronously and then continue with your work
this crates threads so be careful.

```ruby
require 'socketIO'

client = SocketIO.connect("localhost", sync: true) do
  before_start do
    on_message {|message| puts message}
    on_disconnect {puts "I GOT A DISCONNECT"}
  end

  after_start do
    emit("loadLogs", "/var/www/rails_app/log/production.log")
  end
end

puts "socket still running"
loop do
  sleep 10
  puts 'zzz'
end
```
