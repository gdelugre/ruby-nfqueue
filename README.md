Description of nfqueue
----------------------

nfqueue is a tiny wrapper around libnetfilter\_queue. It allows you to do some packet filtering very simply in a Ruby environment.

For example, plugging on the #0 queue:

```ruby
require 'nfqueue'

system('sudo iptables -A OUTPUT -p tcp --dport 80 -j NFQUEUE --queue-num 0 --queue-bypass')

Netfilter::Queue.create(0) do |packet|
  puts "Inspecting packet ##{packet.id}"

  p packet.data
  Netfilter::Packet::ACCEPT
end
```

Dependencies
------------

You need to have kernel support for NFQUEUE and libnetfilter\_queue installed to get it working.
nfqueue depends on nfnetlink and ffi (https://github.com/ffi/ffi/wiki/)


Contact
-------

Guillaume Delugré, guillaume at security-labs dot org