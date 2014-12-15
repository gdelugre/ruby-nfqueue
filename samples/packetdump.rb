#!/usr/bin/env ruby

require 'nfqueue'

def mac_address(packet)
    hw_addr = packet.hw_addr
    return '??:??:??:??:??:??' if hw_addr.nil?

    hw_addr.unpack('C*').map{|c| "%02x" % c}.join(':')
end

Netfilter::Queue.create(0) do |packet|
    puts "New packet ##{packet.id} from interface #{packet.indev_name}"
    puts "Ethernet address: #{mac_address(packet)}"

    puts
    puts packet.data.unpack('H*')[0]
    puts '--'

    Netfilter::Packet::ACCEPT
end
