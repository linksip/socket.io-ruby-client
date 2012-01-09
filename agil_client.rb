#!/usr/bin/env ruby

require 'rubygems'
require 'socket'
require 'net/http'
require 'SocketIO'

SocketIO.connect('localhost:83') do

  before_start do
    on_message do |message|
      msg_hash = JSON.parse(message)
      msg_hash['data'] && puts(msg_hash['data'].inspect)
      msg_hash['error'] && puts(msg_hash['error']['message'])
    end
  end

  after_start do
    send_message({:type => "meta",:data => {:sub_firm_ident => 'democaluire', :password => 'xxxxxx', :domain => "demo"}}.to_json)
    send_message({:type => "subscribe",:channel => "demo_8003"}.to_json)
  end
end

