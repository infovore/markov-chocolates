#!/usr/bin/env ruby

require "rubygems"
require "bundler/setup"
require "lib/array.rb"
require "lib/markov_chain.rb"

Bundler.require(:default)

#PATH_PREFIX = File.expand_path(File.dirname(__FILE__))
#config = YAML.parse(File.read(PATH_PREFIX + "/creds.yml"))

#%w{consumer_key consumer_secret access_token access_token_secret}.each do |key|
  #Object.const_set(key.upcase, config["config"][key].value)
#end

mc = MarkovChain.new(File.read("chocolate.txt"))
# one in four times, generate a chain
if(rand(4) < 1)
# if it's less than 141 chars, tweet it
  string = mc.sentences(1).capitalize
# otherwise re-generate until it fits
  while string.size > 140
    string = mc.sentences(1).capitalize
  end
  # tweet it
end
