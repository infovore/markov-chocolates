#!/usr/bin/env ruby

require "rubygems"
require "bundler/setup"
Bundler.require(:default)
require "#{File.dirname(__FILE__)}/lib/array.rb"
require "#{File.dirname(__FILE__)}/lib/markov_chain.rb"


PATH_PREFIX = File.expand_path(File.dirname(__FILE__))
config = YAML.parse(File.read(PATH_PREFIX + "/creds.yml"))

%w{consumer_key consumer_secret access_token access_token_secret}.each do |key|
  Object.const_set(key.upcase, config["config"][key].value)
end

Twitter.configure do |config|
  config.consumer_key = CONSUMER_KEY
  config.consumer_secret = CONSUMER_SECRET
  config.oauth_token = ACCESS_TOKEN
  config.oauth_token_secret = ACCESS_TOKEN_SECRET
end

mc = MarkovChain.new(File.read("chocolate.txt"))
# one in 120 times, generate a chain
if(rand(120) < 1)
# if it's less than 141 chars, tweet it
  string = mc.sentences(1).capitalize
# otherwise re-generate until it fits
  while string.size > 140
    string = mc.sentences(1).capitalize
  end
  puts "posting tweet #{string}"
  Twitter.update(string)
end
